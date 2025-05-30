package com.pvt154.patchApp.controller;
//test

import com.pvt154.patchApp.model.TradeRequest;
import com.pvt154.patchApp.service.TradeRequestDTO;
import com.pvt154.patchApp.service.TradeRequestService;
import com.pvt154.patchApp.service.TradeStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/trades")
public class TradeRequestController {

    @Autowired
    private TradeRequestService tradeRequestService;

    @PostMapping("/add")
    public ResponseEntity<TradeRequest> createTrade(@RequestBody TradeRequestDTO dto) {
        TradeRequest trade = tradeRequestService.createTradeRequest(
                dto.getSenderId(),
                dto.getReceiverId(),
                dto.getBadgeOfferedId(),
                dto.getBadgeRequestedId()
        );
        return ResponseEntity.ok(trade);
    }

    @GetMapping("/received/trades")
    public List<TradeRequest> receivedTrades(@RequestParam("query") Long query) {
        return tradeRequestService.getTradeRequestsByReceiver(query);
    }

    @GetMapping("/sent/trades")
    public List<TradeRequest> sentTrades(@RequestParam("query") Long query) {
        return tradeRequestService.getTradeRequestsBySender(query);
    }

    @PostMapping("/{id}/status")
    public ResponseEntity<TradeRequest> respondToTrade(@PathVariable Long id, @RequestParam TradeStatus status) {
        return ResponseEntity.ok(tradeRequestService.respondToTrade(id, status));
    }

    @DeleteMapping("/{id}/delete")
    public ResponseEntity<TradeRequest> deleteTrade(@PathVariable Long id) {
        try {
            tradeRequestService.deleteTradeRequest(id);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }


    @GetMapping("/hello")
    public String hello() {
        return "Hello trade request";
    }

}
