package com.pvt154.patchApp.model;

import java.util.ArrayList;
import java.util.List;

public class User {
    private String firstName;
    private String surName;
    private String kmName;
    private int phoneNumber;
    private String emailAddress;
    private String kmStatus;
    private String teamSthlmPage;
    private String googleId;

    private List<Patch> PatchCollection;

    public User(String firstName, String surName, String kmName, int phoneNumber,
                String emailAddress, String kmStatus, String teamSthlmPage, String googleId) {
        this.firstName = firstName;
        this.surName = surName;
        this.kmName = kmName;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.kmStatus = kmStatus;
        this.teamSthlmPage = teamSthlmPage;
        this.googleId = googleId;
        this.PatchCollection = new ArrayList<>();
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

    public List<Patch> getPatchToCollection() {
        return PatchCollection;
    }

    public void addPatchToCollection(Patch patch) {
        PatchCollection.add(patch);
    }

    public void removePAtchFromCollection(Patch patch) {
        PatchCollection.remove(patch);
    }

    // Add setters here if needed
}
