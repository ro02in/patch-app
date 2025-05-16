package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.PatchRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatchService {
    private final PatchRepository patchRepository;

    public PatchService(PatchRepository patchRepository) {
        this.patchRepository = patchRepository;
    }

    public Patch changeOwner(Patch patch, User newOwner) {
        patch.setOwnerGoogleId(newOwner.getGoogleId());  // Use setOwnerGoogleId instead of setOwner
        return patchRepository.save(patch);
    }

    public List<Patch> getPatchesForUser(User user) {
        return patchRepository.findByOwnerGoogleId(user.getGoogleId());  // Update this method too
    }

    public Patch getBadgeById(Long id) {
        return patchRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Patch not found with id: " + id));
    }
}