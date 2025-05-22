package com.pvt154.patchApp.model;

import com.pvt154.patchApp.service.PatchCategory;
import com.pvt154.patchApp.service.PatchColors;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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

    private String description;

    @Column(name = "owner_google_id")
    private String ownerGoogleId;

    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] pictureData;

    private Boolean isPublic;

    private PatchCategory category;

    @ElementCollection
    @CollectionTable(name = "patch_colors", joinColumns = @JoinColumn(name = "patch_id"))
    @Enumerated(EnumType.STRING)
    @Column(name = "color")
    private List<PatchColors> colors = new ArrayList<>();

    public Patch(String ownerGoogleId, PatchCategory category, PatchColors[] colors) {
        this.ownerGoogleId = ownerGoogleId;
        this.category = category;
        this.colors = new ArrayList<>(Arrays.asList(colors));
    }

    public Patch(String description, String owner, PatchCategory category, PatchColors[] colors, byte[] pictureData) {
        this.description = description;
        this.ownerGoogleId = owner;
        this.category = category;
        this.colors = new ArrayList<>(Arrays.asList(colors));
        this.pictureData = pictureData;
    }
}
