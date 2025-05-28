package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.model.TradeRequest;
import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.TradeRequestRepository;
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


    @Autowired
    public TradeRequestService(TradeRequestRepository tradeRequestRepository,
                               PatchService patchService,
                               UserService userService) {
        this.tradeRequestRepository = tradeRequestRepository;
        this.patchService = patchService;
        this.userService = userService;
    }

    /**
     * Skapar en ny trade request mellan två användare.
     *
     * @param senderId         GoogleId för avsändare
     * @param receiverId       GoogleId för mottagare
     * @param patchOfferedId   ID för patch som avsändaren erbjuder
     * @param patchRequestedId ID för patch som avsändaren vill ha (kan vara null vid gåva)
     * @return Sparad TradeRequest
     */
    public TradeRequest createTradeRequest(String senderId, String receiverId, Long patchOfferedId, Long patchRequestedId) {
        User sender = userService.getUserById(senderId);
        User receiver = userService.getUserById(receiverId);
        Patch patchOffered = patchService.getPatchById(patchOfferedId);
        if (!patchOffered.getOwnerGoogleId().equals(sender.getGoogleId())) {
            throw new IllegalArgumentException("Sender doesn't own the offered patch");
        }

        Patch patchRequested = null;
        if (patchRequestedId != null) {
            patchRequested = patchService.getPatchById(patchRequestedId);
            if (!patchRequested.getOwnerGoogleId().equals(receiver.getGoogleId())) {
                throw new IllegalArgumentException("Receiver doesn't own the requested patch");
            }
        }

        TradeRequest tradeRequest = new TradeRequest();
        tradeRequest.setSender(senderId);
        tradeRequest.setReceiver(receiverId);
        tradeRequest.setPatchOffered(patchOfferedId);
        tradeRequest.setPatchRequested(patchRequestedId);
        tradeRequest.setStatus(TradeStatus.PENDING);
        tradeRequest.setCreatedAt(LocalDateTime.now());

        return tradeRequestRepository.save(tradeRequest);
    }

    /**
     * Svarar på en trade request (godkänna/avvisa)
     *
     * @param tradeId   TradeRequest-id
     * @param newStatus Ny status (t.ex. APPROVED eller REJECTED)
     * @return Uppdaterad TradeRequest
     */
    public TradeRequest respondToTrade(Long tradeId, TradeStatus newStatus) {
        TradeRequest trade = getTradeRequestById(tradeId);

        if (trade.getStatus().equals(TradeStatus.PENDING)) {
            trade.setStatus(newStatus);
            if (newStatus == TradeStatus.APPROVED) {
                Patch offeredPatch = patchService.getPatchById( trade.getPatchOffered());
                Patch requestedPatch = patchService.getPatchById( trade.getPatchRequested());

               // User sender = trade.getSender();
                //User receiver = trade.getReceiver();
                User sender = userService.getUserById(trade.getSender());
                User receiver = userService.getUserById(trade.getReceiver());

                // Ändra ägarskap av patchar
                patchService.changeOwner(offeredPatch, receiver);
                if (requestedPatch != null) {
                    patchService.changeOwner(requestedPatch, sender);
                }
            }

            return tradeRequestRepository.save(trade);

        }

        return null;
    }

    public List<TradeRequest> getTradeRequestsByReceiver(String googleId) {
        // Eftersom TradeRequest nu har User-objekt, måste vi hämta användaren först
        //User receiver = userService.getUserById(googleId);

        return tradeRequestRepository.findByReceiver(googleId);
    }

    public List<TradeRequest> getTradeRequestsBySender(String googleId) {
        //User sender = userService.getUserById(googleId);
        return tradeRequestRepository.findBySender(googleId);
    }

    public List<TradeRequest> getAllTradeRequests() {
        return tradeRequestRepository.findAll();
    }

    public TradeRequest getTradeRequestById(Long id) {
        return tradeRequestRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Trade request not found with id: " + id));
    }

    public void deleteTradeRequest(long tradeId) {
        tradeRequestRepository.deleteById(tradeId);
    }

}
