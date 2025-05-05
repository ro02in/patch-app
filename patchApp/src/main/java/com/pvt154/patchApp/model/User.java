package com.pvt154.patchApp.model;

public class User {
    private String firstName;
    private String surName;
    private String kmName;
    private int phoneNumber;
    private String emailAddress;
    private String kmStatus;
    private String teamSthlmPage;
    private String googleId;

    public User(String firstName, String surName, int phoneNumber, String emailAddress, String kmStatus, String teamSthlmPage, String googleId) {
        this.firstName = firstName;
        this.surName = surName;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.kmStatus = kmStatus;
        this.teamSthlmPage = teamSthlmPage;
        this.googleId = googleId;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getSurName() {
        return surName;
    }

    public String getFullName() {
        return firstName + " " + surName;
    }

    public String getKmName() {
        return kmName;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public String getKmStatus() {
        return kmStatus;
    }

    public String getTeamSthlmPage() {
        return teamSthlmPage;
    }

    public String getGoogleId() {
        return googleId;
    }

    // Add setters here if needed
}
