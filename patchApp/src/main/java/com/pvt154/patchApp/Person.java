package com.pvt154.patchApp;

//Vi borde gå igenom varesig vi ska använda abstrakt person klass eller om vi skippar det och bara gör en "user" istället.
// Abstrakt kanske funkar om vi ska ha separat klass för administrator konton, men det kanske vi kan fixa med en "behörighet" variabel???
public abstract class Person {
    private String firstName;
    private String surName;
    private String kmName;
    private int phoneNumber;
    private String emailAddress;
    private String kmStatus;
    private String teamSthlmPage;


    public Person (String firstName, String surName, int phoneNumber, String emailAddress, String kmStatus, String teamSthlmPage){
        this.firstName = firstName;
        this.surName = surName;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.kmStatus = kmStatus;
        this.teamSthlmPage = teamSthlmPage;
    }

    public String getFirstName(){
        return firstName;
    }

    public String getSurName(){
        return surName;
    }

    //Bra o ha för andra klasser ifall man vill ha namn. Kan också användas senare för att visa element på UI.
    public String getFullName(){
        return firstName + " " + surName;
    }

    public String getKmName(){
        return kmName;
    }

    public int getPhoneNumber(){
        return phoneNumber;
    }
    
    public String getEmailAddress(){
        return emailAddress;
    }
    
    public String getKmStatus(){
        return kmStatus;
    }
    
    public String getTeamSthlmPage(){
        return teamSthlmPage;
    }

    //Tror inte vi ska ha denna metod. Det är väll bara konstruktorn som löser detta?
    public void createProfile() {

    }

    //Osäker på om man ska kalla på denna själv eller om en admin ska göra det, either way är det nog inte ngt själva "person" ska ta hand om, kanske User eller Admin, men inte person.
    public void deleteOwnAccount(){

    }

}
