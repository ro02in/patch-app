package com.pvt154.patchApp.controller;
//test
import com.pvt154.patchApp.model.TradeRequest;
import com.pvt154.patchApp.service.TradeRequestDTO;
import com.pvt154.patchApp.service.TradeRequestService;
import com.pvt154.patchApp.service.TradeStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/trades")
public class TradeRequestController {

    @Autowired
    private TradeRequestService tradeRequestService;

    @PostMapping
    public ResponseEntity<TradeRequest> createTrade(@RequestBody TradeRequestDTO dto) {
        TradeRequest trade = tradeRequestService.createTradeRequest(
                dto.getSenderId(),
                dto.getReceiverId(),
                dto.getBadgeOfferedId(),
                dto.getBadgeRequestedId()
        );
        return ResponseEntity.ok(trade);
    }

    @PostMapping("/{id}/respond")
    public ResponseEntity<TradeRequest> respondToTrade(@PathVariable Long id, @RequestParam TradeStatus status) {
        return ResponseEntity.ok(tradeRequestService.respondToTrade(id, status));
    }
}
