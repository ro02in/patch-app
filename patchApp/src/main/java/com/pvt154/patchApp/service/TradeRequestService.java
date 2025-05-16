package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.model.TradeRequest;
import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.TradeRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@Transactional
public class TradeRequestService {
    private final TradeRequestRepository tradeRequestRepository;
    private final PatchService patchService;
    private final UserService userService;

    @Autowired
    public TradeRequestService(TradeRequestRepository tradeRequestRepository,
                             PatchService patchService,
                             UserService userService) {
        this.tradeRequestRepository = tradeRequestRepository;
        this.patchService = patchService;
        this.userService = userService;
    }

    public TradeRequest createTradeRequest(String senderId, String receiverId, Long badgeOfferedId, Long badgeRequestedId) {
        // Changed Long to String for user IDs
        User sender = userService.getUserById(senderId);
        User receiver = userService.getUserById(receiverId);
        
        // Verify patch ownership
        Patch badgeOffered = patchService.getBadgeById(badgeOfferedId);
        if (!badgeOffered.getOwnerGoogleId().equals(sender.getGoogleId())) {
            throw new IllegalArgumentException("Sender doesn't own the offered patch");
        }

        // For gift, badgeRequestedId can be null
        Patch badgeRequested = null;
        if (badgeRequestedId != null) {
            badgeRequested = patchService.getBadgeById(badgeRequestedId);
            if (!badgeRequested.getOwnerGoogleId().equals(receiver.getGoogleId())) {
                throw new IllegalArgumentException("Receiver doesn't own the requested patch");
            }
        }

        TradeRequest request = new TradeRequest();
        request.setSender(sender);
        request.setReceiver(receiver);
        request.setBadgeOffered(badgeOffered);
        request.setBadgeRequested(badgeRequested);
        request.setStatus(TradeStatus.PENDING);
        request.setCreatedAt(LocalDateTime.now());
        
        return tradeRequestRepository.save(request);
    }

    public TradeRequest respondToTrade(Long tradeId, TradeStatus newStatus) {
        TradeRequest trade = tradeRequestRepository.findById(tradeId)
                .orElseThrow(() -> new RuntimeException("Trade not found"));

        if (trade.getStatus() != TradeStatus.PENDING) {
            throw new IllegalStateException("Trade is no longer pending");
        }

        trade.setStatus(newStatus);

        if (newStatus == TradeStatus.APPROVED) {
            // Execute the trade
            Patch offeredPatch = trade.getBadgeOffered();
            Patch requestedPatch = trade.getBadgeRequested();

            // Transfer ownership
            patchService.changeOwner(offeredPatch, trade.getReceiver());
            if (requestedPatch != null) {
                patchService.changeOwner(requestedPatch, trade.getSender());
            }
        }

        return tradeRequestRepository.save(trade);
    }
}