package com.pvt154.patchApp.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
public class User {
    @Id
    @Column(name = "google_id", columnDefinition = "VARCHAR(255)", unique = true)
    private String googleId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "sur_name")
    private String surName;

    @Column(name = "km_name") // username
    private String kmName;

    @Column(name = "phone_number")
    private Integer phoneNumber;

    @Column(name = "email_address", unique = true)
    private String emailAddress;

    @Column(name = "biography")
    private String biography;

    @OneToMany(mappedBy = "sender")
    private List<TradeRequest> sentTrades = new ArrayList<>();

    @OneToMany(mappedBy = "receiver")
    private List<TradeRequest> receivedTrades = new ArrayList<>();

    public User(String firstName, String surName, String kmName, Integer phoneNumber, String googleId, String emailAddress, String biography) {
        this.firstName = firstName;
        this.surName = surName;
        this.kmName = kmName;
        this.phoneNumber = phoneNumber;
        this.googleId = googleId;
        this.emailAddress = emailAddress;
        this.biography = biography;
    }
}
