package com.pvt154.patchApp.service;

import lombok.Data;

@Data
public class TradeRequestDTO {
    private Long senderId;
    private Long receiverId;
    private Long badgeOfferedId;
    private Long badgeRequestedId;
}

