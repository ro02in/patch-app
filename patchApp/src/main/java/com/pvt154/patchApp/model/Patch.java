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
    private String history;
    @Column(name = "owner_google_id")
    private String ownerGoogleId;
    private String picturePath;// borde göras så här och spara bilden i databas (aws s3)
    private String status; //Skulle va bra o ha klart definierade val här men for now lämnar jag det som sträng så löser vi det. Skulle funka bra med "tag-system" men vi får kolla vidare på det senare
    private ArrayList<PatchColors> colors;

    //Skriv om konstruktorn allt eftersom variabler uppdateras, vi behöver också gå igenom exakt vilka variabler vi ska ha som obligatoriska och göra overloaded konstruktorer för dessa.
    public Patch(Long id, String owner, String status, String[] colors) {
        this.id = id;
        this.ownerGoogleId = owner;
        this.status = status;
        this.colors = new ArrayList<>(Arrays.asList(colors)); //icke-obligatorisk Dubbelchecka denna, kan bli problem ifall inga märken anges?
    }


    public Patch(Long id, String history, String owner, String status, String[] colors, String picturePath) {
        this.id = id;
        this.history = history;
        this.ownerGoogleId = owner;
        this.status = status;
        this.colors = new ArrayList<>(Arrays.asList(colors));
        this.picturePath = picturePath;
    }
}