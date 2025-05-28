package com.pvt154.patchApp.model;
//test

import com.pvt154.patchApp.service.TradeStatus;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "trade_request")
@Data
@NoArgsConstructor
public class TradeRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trade_id")
    private Long tradeId;

    @Enumerated(EnumType.STRING)
    private TradeStatus status;

    @Column(name = "created_at")
    private LocalDateTime createdAt;


    @Column(name = "patch_offered_id")
    private Long patchOffered;


    @Column(name = "patch_requested_id")
    private Long patchRequested;


    @Column(name = "sender_id")
    private String sender;


    @Column(name = "receiver_id")
    private String receiver;

}
