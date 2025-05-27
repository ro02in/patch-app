package com.pvt154.patchApp.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Patch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "description")
    private String description;

    @Column(name = "owner_google_id")
    private String ownerGoogleId;

    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] pictureData;

    @Column(name = "is_public")
    private Boolean isPublic;

    @Column(name = "placement")
    private String placement;

    @Column(name = "klubbmästeri")
    private String klubbmästeri;

    @Column(name = "patch_name")
    private String patchName;

    @Column(name = "color")
    private String color;

    public Patch(String ownerGoogleId, String placement, String colors) {
        this.ownerGoogleId = ownerGoogleId;
        this.placement = placement;
        this.color = colors;
    }

    public Patch(String description, String owner, String placement, String colors, byte[] pictureData) {
        this.description = description;
        this.ownerGoogleId = owner;
        this.placement = placement;
        this.color = colors;
        this.pictureData = pictureData;
    }
}
