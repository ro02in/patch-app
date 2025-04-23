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

    public void createProfile() {

    }

    public void deleteOwnAccount(){

    }

}
