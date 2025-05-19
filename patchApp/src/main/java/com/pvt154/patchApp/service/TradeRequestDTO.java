package com.pvt154.patchApp.service;

import lombok.Data;

@Data
public class TradeRequestDTO {
    private String senderId;
    private String receiverId;
    private Long badgeOfferedId;
    private Long badgeRequestedId;
    // Getters och setters
}

