package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.model.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

import static javax.print.attribute.standard.JobState.PENDING;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TradeRequest {
    @Id
    private int TradeID;
    @ManyToOne
    @JoinColumn(name = "from_user_id", referencedColumnName = "google_id")
    private User fromUser;
    @ManyToOne
    @JoinColumn(name = "from_user_id", referencedColumnName = "google_id")
    private User toUser;
    @OneToOne
    @JoinColumn(name = "offered_badge_id")
    private Patch requestedPatch;
    @OneToOne
    @JoinColumn(name = "requested_badge_id")
    private Patch wantedPatch;
    //@Enumerated(EnumType.STRING)
    private TradeStatus status;
    private LocalDate timeCreated;




}
