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

    @OneToOne
    @JoinColumn(name = "patch_offered_id")
    private Patch patchOffered;

    @OneToOne
    @JoinColumn(name = "patch_requested_id")
    private Patch patchRequested;

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private User sender;

    @ManyToOne
    @JoinColumn(name = "receiver_id")
    private User receiver;
}
