package com.pvt154.patchApp.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;

import java.util.ArrayList;
import java.util.List;


public class PatchCollection {
@OneToMany (cascade = CascadeType.ALL, orphanRemoval = true)
@JoinColumn(name = "user_id")
    private List<Patch> patches;

    public PatchCollection() {
        this.patches = new ArrayList<>();
    }

    public void addPatch(Patch patch) {
        if (!patches.contains(patch)) {
            patches.add(patch);
        }
    }
    
    public void removePatch(Patch patch) {
        patches.remove(patch);
    }

    public List<Patch> getAllPatches() {
        return new ArrayList<>(patches); //Returnerar en kopia för att undika direkt manipulering
    }

    public boolean contains(Patch patch) {
        return patches.contains(patch);
    }

    public int size() {
        return patches.size();
    }

    public void clear() {
        patches.clear();
    }
}
