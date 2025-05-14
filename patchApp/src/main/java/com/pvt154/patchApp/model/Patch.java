package com.pvt154.patchApp.model;

import com.pvt154.patchApp.service.PatchColors;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;

@Entity
@Data
@NoArgsConstructor

public class Patch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String creator; // Denna behöver inte vara en array, jag tror vi egentligen bör använda en separat klass för detta eller att vi kör arraylist av det, alternativt att vi håller det fritext, öppnar dock upp för problem med stavning osv osv.
    private String fromKM;
    @OneToOne
    private User fromUser; // Byt till user sen när vi fixat det, alternativt sätt user i konstruktorn.
    private String history;
    @Column(name = "owner_google_id")
    private String ownerGoogleId;
    private String picturePath;// borde göras så här och spara bilden i databas (aws s3)
    //private Image picture; = ImageIO.read(new File("picture.png")); // Look into this, recommend reading more at https://stackoverflow.com/questions/34072052/is-it-possible-to-add-an-image-png-as-an-attribute-of-a-java-class
    private int tradeCount; //kanske ta bort denna
    private String status; //Skulle va bra o ha klart definierade val här men for now lämnar jag det som sträng så löser vi det. Skulle funka bra med "tag-system" men vi får kolla vidare på det senare
    private String comment;
    private ArrayList<String> colors;

    //Skriv om konstruktorn allt eftersom variabler uppdateras, vi behöver också gå igenom exakt vilka variabler vi ska ha som obligatoriska och göra overloaded konstruktorer för dessa.
    public Patch(Long id, String owner, String status, String[] colors) {
        this.id = id;
        this.creator = creator; //icke-obligatorisk
        this.fromKM = fromKM; //icke-obligatorisk
        this.fromUser = fromUser; //icke-obligatorisk Kolla om denna ens behövs???
        this.history = history; //icke-obligatorisk men kan vara kvar så man kan lämna en tom string
        this.about = about; //icke-obligatorisk samma som history
        this.owner = owner;
        this.picturePath = picturePath; //icke-obligatorisk
        this.tradeCount = tradeCount; //icke-obligatorisk, kolla om denna behövs i konstruktorn, den kmr väll alltid ha 0 vi skapelse, men plussas vid varje trade.
        this.status = status;
        this.comment = comment; //icke-obligatorisk samma som history
        this.colors = new ArrayList<>(Arrays.asList(colors)); //icke-obligatorisk Dubbelchecka denna, kan bli problem ifall inga märken anges?
    }

    public String getCreator() {
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
    public String getPicture() {
        return picturePath;
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