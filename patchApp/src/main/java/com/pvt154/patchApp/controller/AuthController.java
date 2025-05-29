package com.pvt154.patchApp.controller;

import com.example.backend.model.User;
import com.example.backend.repository.UserRepository;
import com.example.backend.service.JwtService;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.Collections;
import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final UserRepository userRepository;
    private final JwtService jwtService;

    private GoogleIdTokenVerifier verifier;

    @Value("${google.clientId}")
    private String clientId;

    public AuthController(UserRepository userRepository, JwtService jwtService) {
        this.userRepository = userRepository;
        this.jwtService = jwtService;
    }

    @PostConstruct
    public void initVerifier() {
        this.verifier = new GoogleIdTokenVerifier.Builder(
                new NetHttpTransport(),
                JacksonFactory.getDefaultInstance()
        )
                .setAudience(Collections.singletonList(clientId))
                .build();
    }

    private GoogleIdToken verifyToken(String idTokenString) {
        try {
            return verifier.verify(idTokenString);
        } catch (Exception e) {
            return null;
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> body) {
        String idTokenString = body.get("idToken");
        GoogleIdToken idToken = verifyToken(idTokenString);
        if (idToken == null) {
            return ResponseEntity.badRequest().body(Map.of("status", "error", "message", "Invalid ID token."));
        }

        String email = idToken.getPayload().getEmail();

        Optional<User> optionalUser = userRepository.findByEmail(email);
        if (optionalUser.isEmpty()) {
            return ResponseEntity.status(404).body(Map.of("status", "not_found", "message", "User not found."));
        }

        User user = optionalUser.get();
        String jwt = jwtService.generateToken(user);

        return ResponseEntity.ok(Map.of("status", "success", "token", jwt));
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody Map<String, String> body) {
        String idTokenString = body.get("idToken");
        GoogleIdToken idToken = verifyToken(idTokenString);
        if (idToken == null) {
            return ResponseEntity.badRequest().body(Map.of("status", "error", "message", "Invalid ID token."));
        }

        String email = idToken.getPayload().getEmail();

        if (userRepository.existsByEmail(email)) {
            return ResponseEntity.status(400).body(Map.of("status", "error", "message", "User already exists."));
        }

        User user = new User();
        user.setEmail(email);
        user.setName((String) idToken.getPayload().get("name"));
        userRepository.save(user);

        String jwt = jwtService.generateToken(user);

        return ResponseEntity.ok(Map.of("status", "success", "token", jwt));
    }
}
