package com.pvt154.patchApp;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.model.TradeRequest;
import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.PatchRepository;
import com.pvt154.patchApp.repository.UserRepository;
import com.pvt154.patchApp.service.PatchService;
import com.pvt154.patchApp.service.TradeRequestService;
import com.pvt154.patchApp.service.TradeStatus;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
public class PatchAppApplicationTest {

	@Autowired
	private TradeRequestService tradeRequestService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PatchRepository patchRepository;

	@Autowired
	private PatchService patchService;

	private User sender;
	private User receiver;
	private Patch senderPatch;
	private Patch receiverPatch;

	@BeforeEach
	public void setup() {
		// Create test users using the appropriate constructor
		sender = new User("John", "Doe","jodoe", 07012323, "google-id-1", "john@example.com");
		receiver = new User("Jane", "Smith", "jasmith", 07012223, "google-id-2", "jane@example.com");

		userRepository.save(sender);
		userRepository.save(receiver);

		// Create test patches
		senderPatch = new Patch();
		senderPatch.setOwnerGoogleId(sender.getGoogleId());
		senderPatch.setStatus("AVAILABLE");
		senderPatch.setHistory("Sender's patch history");

		receiverPatch = new Patch();
		receiverPatch.setOwnerGoogleId(receiver.getGoogleId());
		receiverPatch.setStatus("AVAILABLE");
		receiverPatch.setHistory("Receiver's patch history");

		patchRepository.save(senderPatch);
		patchRepository.save(receiverPatch);
	}

	@Test
	public void testCreateTradeRequest() {
		// Create a trade request
		TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
				sender.getGoogleId(),
				receiver.getGoogleId(),
				senderPatch.getId(),
				receiverPatch.getId()
		);

		// Assert the trade was created with correct values
		assertNotNull(tradeRequest.getTradeId());
		assertEquals(TradeStatus.PENDING, tradeRequest.getStatus());
		assertEquals(sender.getGoogleId(), tradeRequest.getSenderId());
		assertEquals(receiver.getGoogleId(), tradeRequest.getReceiverId());
		assertEquals(senderPatch.getId(), tradeRequest.getBadgeOffered().getId());
		assertEquals(receiverPatch.getId(), tradeRequest.getBadgeRequested().getId());
	}

	@Test
	public void testApproveTradeRequest() {
		// Create a trade request
		TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
				sender.getGoogleId(),
				receiver.getGoogleId(),
				senderPatch.getId(),
				receiverPatch.getId()
		);

		// Approve the trade
		TradeRequest approvedRequest = tradeRequestService.respondToTrade(
				tradeRequest.getTradeId(),
				TradeStatus.APPROVED
		);

		// Assert the trade status was updated
		assertEquals(TradeStatus.APPROVED, approvedRequest.getStatus());

		// Assert ownership was transferred
		Patch updatedSenderPatch = patchRepository.findById(senderPatch.getId()).get();
		Patch updatedReceiverPatch = patchRepository.findById(receiverPatch.getId()).get();

		assertEquals(receiver.getGoogleId(), updatedSenderPatch.getOwnerGoogleId());
		assertEquals(sender.getGoogleId(), updatedReceiverPatch.getOwnerGoogleId());
	}

	@Test
	public void testRejectTradeRequest() {
		// Create a trade request
		TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
				sender.getGoogleId(),
				receiver.getGoogleId(),
				senderPatch.getId(),
				receiverPatch.getId()
		);

		// Reject the trade
		TradeRequest rejectedRequest = tradeRequestService.respondToTrade(
				tradeRequest.getTradeId(),
				TradeStatus.REJECTED
		);

		// Assert the trade status was updated
		assertEquals(TradeStatus.REJECTED, rejectedRequest.getStatus());

		// Assert ownership was NOT transferred
		Patch updatedSenderPatch = patchRepository.findById(senderPatch.getId()).get();
		Patch updatedReceiverPatch = patchRepository.findById(receiverPatch.getId()).get();

		assertEquals(sender.getGoogleId(), updatedSenderPatch.getOwnerGoogleId());
		assertEquals(receiver.getGoogleId(), updatedReceiverPatch.getOwnerGoogleId());
	}

	@Test
	public void testGetTradeRequestsByReceiver() {
		// Create a trade request
		TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
				sender.getGoogleId(),
				receiver.getGoogleId(),
				senderPatch.getId(),
				receiverPatch.getId()
		);

		// Get requests by receiver
		var requests = tradeRequestService.getTradeRequestsByReceiver(receiver.getGoogleId());

		// Should have at least one request
		assertFalse(requests.isEmpty());
		assertEquals(receiver.getGoogleId(), requests.get(0).getReceiverId());
	}

	@Test
	public void testGetTradeRequestsBySender() {
		// Create a trade request
		TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
				sender.getGoogleId(),
				receiver.getGoogleId(),
				senderPatch.getId(),
				receiverPatch.getId()
		);

		// Get requests by sender
		var requests = tradeRequestService.getTradeRequestsBySender(sender.getGoogleId());

		// Should have at least one request
		assertFalse(requests.isEmpty());
		assertEquals(sender.getGoogleId(), requests.get(0).getSenderId());
	}

	@Test
	public void testGetTradeRequestById() {
		// Create a trade request
		TradeRequest createdRequest = tradeRequestService.createTradeRequest(
				sender.getGoogleId(),
				receiver.getGoogleId(),
				senderPatch.getId(),
				receiverPatch.getId()
		);

		// Get request by id
		TradeRequest retrievedRequest = tradeRequestService.getTradeRequestById(createdRequest.getTradeId());

		// Verify it's the same request
		assertEquals(createdRequest.getTradeId(), retrievedRequest.getTradeId());
		assertEquals(sender.getGoogleId(), retrievedRequest.getSenderId());
		assertEquals(receiver.getGoogleId(), retrievedRequest.getReceiverId());
	}

	@Test
	public void testCreateGift() {
		// Create a gift (trade request with null requested badge)
		TradeRequest giftRequest = tradeRequestService.createTradeRequest(
				sender.getGoogleId(),
				receiver.getGoogleId(),
				senderPatch.getId(),
				null
		);

		// Verify the gift was created correctly
		assertNotNull(giftRequest.getTradeId());
		assertEquals(TradeStatus.PENDING, giftRequest.getStatus());
		assertEquals(sender.getGoogleId(), giftRequest.getSenderId());
		assertEquals(receiver.getGoogleId(), giftRequest.getReceiverId());
		assertEquals(senderPatch.getId(), giftRequest.getBadgeOffered().getId());
		assertNull(giftRequest.getBadgeRequested());
	}
}