package com.pvt154.patchApp.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // ← NEW ID

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

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "biography")
    private String biography;

    @Lob
    @Column(name = "picture")
    private byte[] picture;

    @OneToMany(mappedBy = "sender")
    private List<TradeRequest> sentTrades = new ArrayList<>();

    @OneToMany(mappedBy = "receiver")
    private List<TradeRequest> receivedTrades = new ArrayList<>();

    public User(String firstName, String surName, String kmName,
                String emailAddress, String password,
                String biography, byte[] picture, String username, String university) {
        this.firstName = firstName;
        this.surName = surName;
        this.kmName = kmName;
        this.emailAddress = emailAddress;
        this.password = password;
        this.biography = biography;
        this.picture = picture;
        this.username = username;
        this.university = university;
    }
}
