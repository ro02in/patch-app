package com.pvt154.patchApp.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    // DTO for incoming request body
    public static class TokenRequest {
        private String idToken;

        public String getIdToken() {
            return idToken;
        }

        public void setIdToken(String idToken) {
            this.idToken = idToken;
        }
    }

    @PostMapping("/google")
    public String googleLogin(@RequestBody TokenRequest tokenRequest) {
        try {
            GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                    new NetHttpTransport(),
                    JacksonFactory.getDefaultInstance())
                    .setAudience(Collections.singletonList("627806627643-q8p6dujvu63ertrl3mi143f5j17a7cep.apps.googleusercontent.com")) // Change to your Client ID
                    .build();

            GoogleIdToken idToken = verifier.verify(tokenRequest.getIdToken());

            if (idToken != null) {
                GoogleIdToken.Payload payload = idToken.getPayload();
                
                String googleId = payload.getSubject();
                String emailAddress = payload.getEmail();
                String firstName = (String) payload.get("name");

                // Check if the user exists in the database
                Optional<User> optionalUser = userRepository.findByGoogleId(googleId);

                if (optionalUser.isPresent()) {
                    // User already exists
                    System.out.println("User already exists: " + emailAddress);
                    return "User exists: " + emailAddress;
                } else {
                    // Create a new user
                    User newUser = new User("firstName" , "Surname", "kmName", 1701231234, "emailAddress", "status", "page", "googleId");  // Example constructor values
                    userRepository.save(newUser);
                    System.out.println("New user saved: " + emailAddress);
                    return "New user created: " + emailAddress;
                }
            } else {
                return "Invalid ID token";
            }
        } catch (Exception e) {
            return "Token verification error: " + e.getMessage();
        }
    }
}
