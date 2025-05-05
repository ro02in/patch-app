package com.pvt154.patchApp.controller;

import org.springframework.web.bind.annotation.*;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.http.javanet.NetHttpTransport;

import java.util.Collections;

@RestController
@RequestMapping("/auth")
public class AuthController {

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
                    .setAudience(Collections.singletonList("219831910027-3ed994vlp6g9seiru7dboftgtafr5m6f.apps.googleusercontent.com")) // <== CHANGE THIS
                    .build();

            GoogleIdToken idToken = verifier.verify(tokenRequest.getIdToken());

            if (idToken != null) {
                GoogleIdToken.Payload payload = idToken.getPayload();

                // Extract useful user info
                String userId = payload.getSubject();
                String email = payload.getEmail();
                String name = (String) payload.get("name");

                // TODO: Check DB 

                return "Google login successful for user: " + email;
            } else {
                return "Invalid ID token";
            }
        } catch (Exception e) {
            return "Token verification error: " + e.getMessage();
        }
    }
}
