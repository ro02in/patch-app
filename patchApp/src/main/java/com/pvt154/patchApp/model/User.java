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


    public User( String firstName, String surName, String googleId) {
        this.firstName = firstName;
        this.surName = surName;
        this.googleId = googleId;

    }

}
