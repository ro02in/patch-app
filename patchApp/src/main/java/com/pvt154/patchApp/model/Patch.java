package com.pvt154.patchApp.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

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

    @Column(name = "owner_id")
    private Long ownerId;

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

    public Patch(Long ownerId, String placement, String colors) {
        this.ownerId = ownerId;
        this.placement = placement;
        this.color = colors;
    }

    public Patch(String description, Long ownerId, String placement, String colors, byte[] pictureData) {
        this.description = description;
        this.ownerId = ownerId;
        this.placement = placement;
        this.color = colors;
        this.pictureData = pictureData;
    }
}
