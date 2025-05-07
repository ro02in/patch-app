package com.pvt154.patchApp.model;

import javax.imageio.ImageIO;
import java.awt.*;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;

public class Patch {

    private String[] creator; // Denna behöver inte vara en array, jag tror vi egentligen bör använda en separat klass för detta eller att vi kör arraylist av det, alternativt att vi håller det fritext, öppnar dock upp för problem med stavning osv osv.
    private String fromKM;
    private User fromUser; // Byt till user sen när vi fixat det, alternativt sätt user i konstruktorn.
    private String history;
    private String about; //kanske ta bort denna, history och comment bör va tillräckligt?
    private User owner;
    private Image picture = ImageIO.read(new File("picture.png")); // Look into this, recommend reading more at https://stackoverflow.com/questions/34072052/is-it-possible-to-add-an-image-png-as-an-attribute-of-a-java-class
    private int tradeCount; //kanske ta bort denna
    private String status; //Skulle va bra o ha klart definierade val här men for now lämnar jag det som sträng så löser vi det. Skulle funka bra med "tag-system" men vi får kolla vidare på det senare
    private String comment;
    private ArrayList<String> colors;

    //Skriv om konstruktorn allt eftersom variabler uppdateras, vi behöver också gå igenom exakt vilka variabler vi ska ha som obligatoriska och göra overloaded konstruktorer för dessa.
    public Patch(String[] creator, String fromKM, User fromUser, String history, String about, User owner, Image picture, int tradeCount, String status, String comment, String[] colors) {
        this.creator = creator; //icke-obligatorisk
        this.fromKM = fromKM; //icke-obligatorisk
        this.fromUser = fromUser; //icke-obligatorisk Kolla om denna ens behövs???
        this.history = history; //icke-obligatorisk men kan vara kvar så man kan lämna en tom string
        this.about = about; //icke-obligatorisk samma som history
        this.owner = owner;
        this.picture = picture; //icke-obligatorisk
        this.tradeCount = tradeCount; //icke-obligatorisk, kolla om denna behövs i konstruktorn, den kmr väll alltid ha 0 vi skapelse, men plussas vid varje trade.
        this.status = status;
        this.comment = comment; //icke-obligatorisk samma som history
        this.colors = new ArrayList<>(Arrays.asList(colors)); //icke-obligatorisk Dubbelchecka denna, kan bli problem ifall inga märken anges?
    }

    public String[] getCreator() {
        return creator;
    }

    public String getFromKM() {
        return fromKM;
    }

    public User getFromUser() {
        return fromUser;
    }

    public String getHistory() {
        return history;
    }

    public String getAbout() {
        return about;
    }

    public User getOwner() {
        return owner;
    }

    //Image systemet behöver vi prata om, for now är denna placeholder här. Vi kan antingen ha file location, inläst byte[] eller bara en sträng med file path. Behöver läsa på mer om detta dock.
    public Image getPicture() {
        return picture;
    }

    public int getTradeCount() {
        return tradeCount;
    }

    public String getStatus() {
        return status;
    }

    public String getComment() {
        return comment;
    }
}