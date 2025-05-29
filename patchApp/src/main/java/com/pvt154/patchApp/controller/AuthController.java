package com.pvt154.patchApp.controller;
/*
import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.service.UserService;
import com.pvt154.patchApp.service.JwtService;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "https://group-4-15.pvt.dsv.su.se") // adjust as needed
public class AuthController {

    private final UserService userService;


    private final JwtService jwtService;

    private GoogleIdTokenVerifier verifier;

    @Value("${google.clientId}")
    private String clientId;

    public AuthController(UserService userService, JwtService jwtService) {
        this.userService = userService;
        this.jwtService = jwtService;
    }

    @PostConstruct
    public void initVerifier() {
        try {
            verifier = new GoogleIdTokenVerifier.Builder(
                    GoogleNetHttpTransport.newTrustedTransport(),  // <-- static method here
                    JacksonFactory.getDefaultInstance()
            )
                    .setAudience(Collections.singletonList("your-client-id-here"))
                    .build();
        } catch (Exception e) {
            throw new RuntimeException("Failed to initialize GoogleIdTokenVerifier", e);
        }
    }

    private GoogleIdToken verifyToken(String idTokenString) {
        try {
            return verifier.verify(idTokenString);
        } catch (Exception e) {
            System.err.println("Token verification failed: " + e.getMessage());
            return null;
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> body) {
        String idTokenString = body.get("idToken");
        if (idTokenString == null || idTokenString.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "status", "error",
                    "message", "Missing ID token."
            ));
        }

        GoogleIdToken idToken = verifyToken(idTokenString);
        if (idToken == null) {
            return ResponseEntity.badRequest().body(Map.of(
                    "status", "error",
                    "message", "Invalid ID token."
            ));
        }

        String googleId = idToken.getPayload().getSubject();
        String firstName = (String) idToken.getPayload().get("given_name");
        String surName = (String) idToken.getPayload().get("family_name");
        String email = idToken.getPayload().getEmail();
        String pictureUrl = (String) idToken.getPayload().get("picture");

        // Check if user exists
        boolean exists = userService.existsByGoogleId(googleId);
        if (!exists) {
            return ResponseEntity.status(404).body(Map.of(
                    "status", "not_found",
                    "message", "User not found."
            ));
        }

        User user = userService.getUserById(googleId);
        String jwt = jwtService.generateToken(user);

        return ResponseEntity.ok(Map.of(
                "status", "success",
                "token", jwt
        ));
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody Map<String, String> body) {
        String idTokenString = body.get("idToken");
        if (idTokenString == null || idTokenString.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "status", "error",
                    "message", "Missing ID token."
            ));
        }

        GoogleIdToken idToken = verifyToken(idTokenString);
        if (idToken == null) {
            return ResponseEntity.badRequest().body(Map.of(
                    "status", "error",
                    "message", "Invalid ID token."
            ));
        }

        String googleId = idToken.getPayload().getSubject();
        String firstName = (String) idToken.getPayload().get("given_name");
        String surName = (String) idToken.getPayload().get("family_name");
        String email = idToken.getPayload().getEmail();
        String pictureUrl = (String) idToken.getPayload().get("picture");

        if (userService.existsByGoogleId(googleId)) {
            return ResponseEntity.badRequest().body(Map.of(
                    "status", "error",
                    "message", "User already exists."
            ));
        }

        User user = userService.createOrUpdateFromGoogle(googleId, firstName, surName, email, pictureUrl);

        String jwt = jwtService.generateToken(user);

        return ResponseEntity.ok(Map.of(
                "status", "success",
                "token", jwt
        ));
    }
}*/
