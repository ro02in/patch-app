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
    @JoinColumn(name = "badge_offered_id")
    private Patch badgeOffered;
    
    @OneToOne
    @JoinColumn(name = "badge_requested_id")
    private Patch badgeRequested;

    @Column(name = "sender_id", columnDefinition = "VARCHAR(255)", unique = true)
    private String senderId;

    @Column(name = "receiver_id", columnDefinition = "VARCHAR(255)", unique = true)
    private String receiverId;
    

}