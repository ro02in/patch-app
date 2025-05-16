package com.pvt154.patchApp.model;

import com.pvt154.patchApp.service.TradeStatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Data
public class TradeRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Add this
    private Long tradeId;  // Changed from int to Long
    
    @ManyToOne
    @JoinColumn(name = "sender_id", referencedColumnName = "google_id")  // Fixed column name
    private User sender;
    
    @ManyToOne
    @JoinColumn(name = "receiver_id", referencedColumnName = "google_id")  // Fixed column name
    private User receiver;
    
    @OneToOne
    @JoinColumn(name = "offered_patch_id")  // Consistent naming
    private Patch badgeOffered;  // Match with service layer naming
    
    @OneToOne
    @JoinColumn(name = "requested_patch_id")  // Consistent naming
    private Patch badgeRequested;  // Match with service layer naming
    
    @Enumerated(EnumType.STRING)  // Add this
    private TradeStatus status;
    
    private LocalDateTime createdAt;  // Changed from LocalDate for more precision
}