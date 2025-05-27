package com.pvt154.patchApp.repository;

import com.pvt154.patchApp.model.Patch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PatchRepository extends JpaRepository<Patch, Long> {
    List<Patch> findByOwnerGoogleId(String ownerGoogleId);
}