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
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@Rollback(true)
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

    private String uniqueGoogleId() {
        return "google-id-" + UUID.randomUUID();
    }

    @BeforeEach
    public void setup() throws IOException {
        // Rensa trade requests först
        tradeRequestService.getAllTradeRequests().forEach(tr -> {
            if (!tr.getStatus().equals(TradeStatus.PENDING)) {
                tradeRequestService.respondToTrade(tr.getTradeId(), TradeStatus.REJECTED); // om du vill avvisa dem först
                tradeRequestService.deleteTradeRequest(tr.getTradeId());
            }
        });

        // Sedan patcher och users
        patchRepository.deleteAll();
        userRepository.deleteAll();
        String test = "hej";
        byte[] imageBytes = test.getBytes();

        // Skapa användare och patcher som innan
        sender = new User("John", "Doe","jodoe", "7012323", "su", "test1@email.com", imageBytes ,"bio", "hej");
        receiver = new User("Jane", "Smith", "jasmith", "7012223", "su", "test2email.vom", imageBytes, "bio2 electric boogaloo", "hej");

        userRepository.save(sender);
        userRepository.save(receiver);

        senderPatch = new Patch();
        senderPatch.setOwnerId(sender.getId());
        senderPatch.setIsPublic(true);
        senderPatch.setDescription("Sender's patch history");
        patchRepository.save(senderPatch);

        receiverPatch = new Patch();
        receiverPatch.setOwnerId(receiver.getId());
        receiverPatch.setDescription("Receiver's patch history");
        patchRepository.save(receiverPatch);
    }


    @Test
    public void testCreateTradeRequest() {
        TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
                sender.getId(),
                receiver.getId(),
                senderPatch.getId(),
                receiverPatch.getId()
        );

        assertNotNull(tradeRequest.getTradeId());
        assertEquals(TradeStatus.PENDING, tradeRequest.getStatus());

        // Här jämför vi med User-objekt, så jämför googleId på User-objekten
        assertEquals(sender.getId(), tradeRequest.getSender());
        assertEquals(receiver.getId(), tradeRequest.getReceiver());
        assertEquals(senderPatch.getId(), tradeRequest.getPatchOffered());
        assertEquals(receiverPatch.getId(), tradeRequest.getPatchRequested());
    }

    @Test
    public void testApproveTradeRequest() {
        TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
                sender.getId(),
                receiver.getId(),
                senderPatch.getId(),
                receiverPatch.getId()
        );

        TradeRequest approvedRequest = tradeRequestService.respondToTrade(
                tradeRequest.getTradeId(),
                TradeStatus.APPROVED
        );

        assertEquals(TradeStatus.APPROVED, approvedRequest.getStatus());

        Patch updatedSenderPatch = patchRepository.findById(senderPatch.getId()).get();
        Patch updatedReceiverPatch = patchRepository.findById(receiverPatch.getId()).get();
        // Ägarskap ska bytas
        assertEquals(receiver.getId(), updatedSenderPatch.getOwnerId());
        assertEquals(sender.getId(), updatedReceiverPatch.getOwnerId());
    }

    @Test
    public void testRejectTradeRequest() {
        TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
                sender.getId(),
                receiver.getId(),
                senderPatch.getId(),
                receiverPatch.getId()
        );

        TradeRequest rejectedRequest = tradeRequestService.respondToTrade(
                tradeRequest.getTradeId(),
                TradeStatus.REJECTED
        );

        assertEquals(TradeStatus.REJECTED, rejectedRequest.getStatus());

        Patch updatedSenderPatch = patchRepository.findById(senderPatch.getId()).get();
        Patch updatedReceiverPatch = patchRepository.findById(receiverPatch.getId()).get();

        // Ägarskap ska vara oförändrat vid avslag
        assertEquals(sender.getId(), updatedSenderPatch.getOwnerId());
        assertEquals(receiver.getId(), updatedReceiverPatch.getOwnerId());
    }

    @Test
    public void testGetTradeRequestsByReceiver() {
        TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
                sender.getId(),
                receiver.getId(),
                senderPatch.getId(),
                receiverPatch.getId()
        );

        var requests = tradeRequestService.getTradeRequestsByReceiver(receiver.getId());

        assertFalse(requests.isEmpty());
        // Jämför googleId på User-objektet i TradeRequest
        assertEquals(receiver.getId(), requests.get(0).getReceiver());
    }

    @Test
    public void testGetTradeRequestsBySender() {
        TradeRequest tradeRequest = tradeRequestService.createTradeRequest(
                sender.getId(),
                receiver.getId(),
                senderPatch.getId(),
                receiverPatch.getId()
        );

        var requests = tradeRequestService.getTradeRequestsBySender(sender.getId());

        assertFalse(requests.isEmpty());
        assertEquals(sender.getId(), requests.get(0).getSender());
    }

    @Test
    public void testGetTradeRequestById() {
        TradeRequest createdRequest = tradeRequestService.createTradeRequest(
                sender.getId(),
                receiver.getId(),
                senderPatch.getId(),
                receiverPatch.getId()
        );

        TradeRequest retrievedRequest = tradeRequestService.getTradeRequestById(createdRequest.getTradeId());

        assertEquals(createdRequest.getTradeId(), retrievedRequest.getTradeId());
        assertEquals(sender.getId(), retrievedRequest.getSender());
        assertEquals(receiver.getId(), retrievedRequest.getReceiver());
    }

    @Test
    public void testCreateGift() {
        TradeRequest giftRequest = tradeRequestService.createTradeRequest(
                sender.getId(),
                receiver.getId(),
                senderPatch.getId(),
                null
        );

        assertNotNull(giftRequest.getTradeId());
        assertEquals(TradeStatus.PENDING, giftRequest.getStatus());
        assertEquals(sender.getId(), giftRequest.getSender());
        assertEquals(receiver.getId(), giftRequest.getReceiver());
        assertEquals(senderPatch.getId(), giftRequest.getPatchOffered());
        assertNull(giftRequest.getPatchRequested());
    }
}
