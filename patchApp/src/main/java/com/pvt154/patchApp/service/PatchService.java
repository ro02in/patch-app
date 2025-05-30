package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.PatchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatchService {

    private final PatchRepository patchRepository;

    @Autowired
    public PatchService(PatchRepository patchRepository) {
        this.patchRepository = patchRepository;
    }

    public Patch createPatch(Patch patch) {
        return patchRepository.save(patch);
    }


    public List<Patch> getPatchesByUser(String id) {
        return patchRepository.findByOwnerId(id);
    }


    public byte[] getPatchImage(Long id) {
        Patch patch = getPatchById(id);
        return patch.getPictureData();
    }

    public void deletePatch(long id) {
        patchRepository.deleteById(id);
    }


    public Patch changeOwner(Patch patch, User newOwner) {
        patch.setOwnerId(newOwner.getId());
        return patchRepository.save(patch);
    }


    public Patch getPatchById(Long id) {
        return patchRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Patch not found with id: " + id));
    }
}
