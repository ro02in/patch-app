package com.pvt154.patchApp.controller;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.repository.PatchRepository;
import com.pvt154.patchApp.service.PatchCategory;
import com.pvt154.patchApp.service.PatchColors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@RestController
@RequestMapping("/api/patch")
public class PatchController {

    @Autowired
    private final PatchRepository patchRepository;

    public PatchController(PatchRepository patchRepository) {
        this.patchRepository = patchRepository;
    }

    @PostMapping("/add")
    public ResponseEntity<Patch> createPatch(
            @RequestParam("description") String description,
            @RequestParam("ownerGoogleId") String ownerGoogleId,
            @RequestParam("category") PatchCategory category,
            @RequestParam("isPublic") boolean isPublic,
            @RequestParam("colors") PatchColors[] colors,
            @RequestParam("image") File imageFile,
            @RequestParam("patchName") String patchName
            ) throws IOException {

       // byte[] imageBytes = new byte[(int) imageFile.length()];
        byte[] imageByteTryTwo = Files.readAllBytes(Paths.get(imageFile.getAbsolutePath()));
        Patch patch = new Patch(description, ownerGoogleId, category, colors, imageByteTryTwo);
        patch.setIsPublic(isPublic);
        Patch savedPatch = patchRepository.save(patch);
        return ResponseEntity.ok(savedPatch);
    }

    @GetMapping("/{id}/image")
    public ResponseEntity<byte[]> getImage(@PathVariable Long id) {
        return patchRepository.findById(id)
                .map(patch -> {
                    byte[] image = patch.getPictureData();
                    HttpHeaders headers = new HttpHeaders();
                    headers.setContentType(MediaType.IMAGE_JPEG); // or PNG if that's what you use
                    return new ResponseEntity<>(image, headers, HttpStatus.OK);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/user/{googleId}")
    public ResponseEntity<List<Patch>> getPatchesByUser(@PathVariable String googleId) {
        List<Patch> patches = patchRepository.findByOwnerGoogleId(googleId);
        return ResponseEntity.ok(patches);
    }


    @GetMapping("/hello")
    public ResponseEntity<String> hello() {
        return ResponseEntity.ok("Hello Patch!");
    }
}
