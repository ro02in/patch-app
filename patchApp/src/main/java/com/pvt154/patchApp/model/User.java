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

    @Column(name = "university")
    private String university;

    @Column(name = "email_address", unique = true)
    private String emailAddress;

    @Column(name = "biography")
    private String biography;

    @Column(name = "picture")
    private byte[] pictureData;

    @OneToMany(mappedBy = "sender")
    private List<TradeRequest> sentTrades = new ArrayList<>();

    @OneToMany(mappedBy = "receiver")
    private List<TradeRequest> receivedTrades = new ArrayList<>();

    public User(String firstName, String surName, String kmName, String googleId, String emailAddress, String biography, byte[] pictureData) {
        this.firstName = firstName;
        this.surName = surName;
        this.kmName = kmName;
        this.googleId = googleId;
        this.emailAddress = emailAddress;
        this.biography = biography;
        this.pictureData = pictureData;
    }
}
