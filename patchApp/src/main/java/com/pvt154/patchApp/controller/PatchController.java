package com.pvt154.patchApp.controller;

import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.service.PatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/patch")
public class PatchController {

    private final PatchService patchService;

    @Autowired
    public PatchController(PatchService patchService) {
        this.patchService = patchService;
    }

    @PostMapping("/add")
    public ResponseEntity<Patch> createPatch(
            @RequestParam("description") String description,
            @RequestParam("ownerGoogleId") String ownerGoogleId,
            @RequestParam("placement") String placement,
            @RequestParam("isPublic") boolean isPublic,
            @RequestParam("color") String color,
            @RequestParam("image") MultipartFile imageFile,
            @RequestParam("patchName") String patchName,
            @RequestParam("klubbmästeri") String klubbmästeri
    ) throws IOException {
        byte[] imageBytes = imageFile.getBytes();
        Patch patch = new Patch(description, ownerGoogleId, placement, color, imageBytes);
        patch.setPatchName(patchName);
        patch.setKlubbmästeri(klubbmästeri);
        patch.setIsPublic(isPublic);

        Patch savedPatch = patchService.createPatch(patch);
        return ResponseEntity.ok(savedPatch);
    }

    @GetMapping("/{id}/image")
    public ResponseEntity<byte[]> getImage(@PathVariable Long id) {
        byte[] image = patchService.getPatchImage(id);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG); // Or IMAGE_PNG
        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }

    @GetMapping("/user/{googleId}")
    public ResponseEntity<List<Patch>> getPatchesByUser(@PathVariable String googleId) {
        List<Patch> patches = patchService.getPatchesByUser(googleId);
        return ResponseEntity.ok(patches);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deletePatch(@PathVariable long id) {
        patchService.deletePatch(id);
        return ResponseEntity.noContent().build();
    }


    @GetMapping("/hello")
    public ResponseEntity<String> hello() {
        return ResponseEntity.ok("Hello Patch!");
    }
}
