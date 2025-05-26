package com.pvt154.patchApp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.pvt154.patchApp.repository.UserRepository;
import com.pvt154.patchApp.model.User;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.http.javanet.NetHttpTransport;
import java.util.Collections;
import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Value("${google.clientId}")
    private String clientId;

    @Autowired
    private UserRepository userRepository;

    public static class TokenRequest {
        private String idToken;
        public String getIdToken() { return idToken; }
        public void setIdToken(String idToken) { this.idToken = idToken; }
    }

    public static class AuthResponse {
        public String status;
        public String message;
        public String email;

        public AuthResponse(String status, String message, String email) {
            this.status = status;
            this.message = message;
            this.email = email;
        }
    }

    @PostMapping("/login")
    public AuthResponse loginWithGoogle(@RequestBody TokenRequest tokenRequest) {
        try {
            GoogleIdToken idToken = verifyToken(tokenRequest.getIdToken());
            if (idToken == null) return new AuthResponse("error", "Invalid ID token", null);

            GoogleIdToken.Payload payload = idToken.getPayload();
            String googleId = payload.getSubject();
            String email = payload.getEmail();

            Optional<User> optionalUser = userRepository.findByGoogleId(googleId);

            if (optionalUser.isPresent()) {
                return new AuthResponse("success", "Login successful", email);
            } else {
                return new AuthResponse("not_found", "No account found. Please register first.", email);
            }
        } catch (Exception e) {
            return new AuthResponse("error", "Login error: " + e.getMessage(), null);
        }
    }

    @PostMapping("/register")
    public AuthResponse registerWithGoogle(@RequestBody TokenRequest tokenRequest) {
        try {
            GoogleIdToken idToken = verifyToken(tokenRequest.getIdToken());
            if (idToken == null) return new AuthResponse("error", "Invalid ID token", null);

            GoogleIdToken.Payload payload = idToken.getPayload();
            String googleId = payload.getSubject();
            String emailAddress = payload.getEmail();

            Optional<User> optionalUser = userRepository.findByGoogleId(googleId);
            if (optionalUser.isPresent()) {
                return new AuthResponse("exists", "User already has an account", emailAddress);
            }

            // Optionally pull name from Google's payload
            String name = (String) payload.get("name"); // full name
            String givenName = (String) payload.get("given_name");
            String familyName = (String) payload.get("family_name");

            User newUser = new User();
            newUser.setGoogleId(googleId);
            newUser.setEmailAddress(emailAddress);
            newUser.setFirstName(givenName); // optional
            newUser.setSurName(familyName);  // optional
            // KM name, phoneNumber, biography will stay null for now

            userRepository.save(newUser);

            return new AuthResponse("success", "User registered", emailAddress);
        } catch (Exception e) {
            return new AuthResponse("error", "Registration error: " + e.getMessage(), null);
        }
    }

    private GoogleIdToken verifyToken(String idTokenString) throws Exception {
        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                new NetHttpTransport(),
                JacksonFactory.getDefaultInstance())
                .setAudience(Collections.singletonList(clientId))
                .build();
        return verifier.verify(idTokenString);
    }
}