package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.io.InputStream;
import java.net.URL;
import java.util.Optional;

@Service
@Transactional
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User getUserById(String googleId) {
        return userRepository.findById(googleId)
                .orElseThrow(() -> new RuntimeException("User not found with Google ID: " + googleId));
    }

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(String googleId, User updatedUser) {
        User user = getUserById(googleId);
        user.setFirstName(updatedUser.getFirstName());
        user.setSurName(updatedUser.getSurName());
        user.setKmName(updatedUser.getKmName());
        user.setEmailAddress(updatedUser.getEmailAddress());
        user.setBiography(updatedUser.getBiography());
        user.setPictureData(updatedUser.getPictureData());
        return userRepository.save(user);
    }

    public void deleteUser(String googleId) {
        User user = getUserById(googleId);
        userRepository.delete(user);
    }

    public boolean existsByGoogleId(String googleId) {
        return userRepository.findByGoogleId(googleId).isPresent();
    }

    public List<User> searchUsers(String query) {
        return userRepository.searchUsers(query);
    }

    public User createOrUpdateFromGoogle(String googleId, String firstName, String surName, String email, String pictureUrl) {
        Optional<User> existing = userRepository.findById(googleId);

        User user = existing.orElseGet(User::new);
        user.setGoogleId(googleId);
        user.setFirstName(firstName);
        user.setSurName(surName);
        user.setEmailAddress(email);

        // Only set kmName if not set (user hasn't picked nickname yet)
        if (user.getKmName() == null || user.getKmName().isEmpty()) {
            user.setKmName(firstName.toLowerCase()); // Or anything else
        }

        if (user.getBiography() == null) {
            user.setBiography(""); // Optional default
        }

        if (pictureUrl != null && (user.getPictureData() == null || user.getPictureData().length == 0)) {
            try (InputStream in = new URL(pictureUrl).openStream()) {
                user.setPictureData(in.readAllBytes());
            } catch (Exception e) {
                // Ignore download errors
                System.out.println("Failed to download picture: " + e.getMessage());
            }
        }

        return userRepository.save(user);
    }
}
