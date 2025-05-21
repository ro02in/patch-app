package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.model.TradeRequest;
import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.TradeRequestRepository;
import com.pvt154.patchApp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class TradeRequestService {
    private final TradeRequestRepository tradeRequestRepository;
    private final PatchService patchService;
    private final UserService userService;
    private final UserRepository userRepository;

    @Autowired
    public TradeRequestService(TradeRequestRepository tradeRequestRepository,
                             PatchService patchService,
                             UserService userService,
                             UserRepository userRepository) {
        this.tradeRequestRepository = tradeRequestRepository;
        this.patchService = patchService;
        this.userService = userService;
        this.userRepository = userRepository;
    }

    public TradeRequest createTradeRequest(String senderId, String receiverId, Long badgeOfferedId, Long badgeRequestedId) {
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
        request.setSenderId(sender.getGoogleId());
        request.setReceiverId(receiver.getGoogleId());
        request.setPatchOffered(badgeOffered);
        request.setPatchRequested(badgeRequested);
        request.setStatus(TradeStatus.PENDING);
        request.setCreatedAt(LocalDateTime.now());
        
        return tradeRequestRepository.save(request);
    }

    public TradeRequest respondToTrade(Long tradeId, TradeStatus newStatus) {
        TradeRequest trade = getTradeRequestById(tradeId);

        if (trade.getStatus() != TradeStatus.PENDING) {
            throw new IllegalStateException("Trade is no longer pending");
        }

        trade.setStatus(newStatus);

        if (newStatus == TradeStatus.APPROVED) {
            // Execute the trade
            Patch offeredPatch = trade.getPatchOffered();
            Patch requestedPatch = trade.getPatchRequested();

            // Transfer ownership - need to fetch User objects from IDs
            User receiver = userRepository.findByGoogleId(trade.getReceiverId())
                    .orElseThrow(() -> new RuntimeException("Receiver not found"));
            User sender = userRepository.findByGoogleId(trade.getSenderId())
                    .orElseThrow(() -> new RuntimeException("Sender not found"));
            
            patchService.changeOwner(offeredPatch, receiver);
            if (requestedPatch != null) {
                patchService.changeOwner(requestedPatch, sender);
            }
        }

        return tradeRequestRepository.save(trade);
    }
    
    public List<TradeRequest> getTradeRequestsByReceiver(String googleId) {
        return tradeRequestRepository.findByReceiverId(googleId);
    }
    
    public List<TradeRequest> getTradeRequestsBySender(String googleId) {
        return tradeRequestRepository.findBySenderId(googleId);
    }
    
    public List<TradeRequest> getAllTradeRequests() {
        return tradeRequestRepository.findAll();
    }
    
    public TradeRequest getTradeRequestById(Long id) {
        return tradeRequestRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Trade request not found with id: " + id));
    }
}