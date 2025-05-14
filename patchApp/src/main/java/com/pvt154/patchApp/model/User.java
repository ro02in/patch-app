package com.pvt154.patchApp.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class User {
    @Id
    private String googleId;
    private String firstName;
    private String surName;
    private String kmName; // ej obligatorisk
    private int phoneNumber;
    private String emailAddress;
    private String kmStatus;
    private String teamSthlmPage;

@Override
    public User( String firstName, String surName, String googleId, String emailAdress) {
        this.firstName = firstName;
        this.surName = surName;
        this.googleId = googleId;
        this.emailAddress = emailAdress;
    }

    public User(String firstName, String surName, String googleId, String emailAddress, String kmStatus) {
        this.firstName = firstName;
        this.surName = surName;
        this.googleId = googleId;
        this.emailAddress = emailAddress;
        this.kmStatus = kmStatus;
    }
    public User(String firstName, String surName, String googleId, String emailAddress, String kmStatus, String kmName) {
        this.firstName = firstName;
        this.surName = surName;
        this.googleId = googleId;
        this.emailAddress = emailAddress;
        this.kmStatus = kmStatus;
        this.kmName = kmName;
    }
    public User(String firstName, String surName, String googleId, String emailAddress, String kmStatus, String kmName, String teamSthlmPage) {
        this.firstName = firstName;
        this.surName = surName;
        this.googleId = googleId;
        this.emailAddress = emailAddress;
        this.kmStatus = kmStatus;
        this.kmName = kmName;
        this.teamSthlmPage = teamSthlmPage;
    }



}
