package com.pvt154.patchApp.repository;


import com.pvt154.patchApp.model.TradeRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TradeRequestRepository extends JpaRepository<TradeRequest, Long> {
    List<TradeRequest> findByReceiverId(Long receiverId);
    List<TradeRequest> findBySenderId(Long senderId);
}