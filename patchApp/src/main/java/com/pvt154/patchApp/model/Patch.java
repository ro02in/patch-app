package com.pvt154.patchApp.model;

import com.pvt154.patchApp.service.PatchColors;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Patch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String history;
    
    @Column(name = "owner_google_id")
    private String ownerGoogleId;
    
    private String picturePath;
    
    private String status;
    
    @ElementCollection
    @CollectionTable(name = "patch_colors", 
            joinColumns = @JoinColumn(name = "patch_id"))
    @Enumerated(EnumType.STRING)
    @Column(name = "color")
    private List<PatchColors> colors = new ArrayList<>();

    public Patch(String owner, String status, PatchColors[] colors) {
        this.ownerGoogleId = owner;
        this.status = status;
        this.colors = new ArrayList<>(Arrays.asList(colors));
    }

    public Patch(String history, String owner, String status, PatchColors[] colors, String picturePath) {
        this.history = history;
        this.ownerGoogleId = owner;
        this.status = status;
        this.colors = new ArrayList<>(Arrays.asList(colors));
        this.picturePath = picturePath;
    }


}