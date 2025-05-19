package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User getUserById(String googleId) {
        return userRepository.findByGoogleId(googleId)
                .orElseThrow(() -> new RuntimeException("User not found with Google ID: " + googleId));
    }

    public User createUser(String firstName, String surName, String googleId, String emailAddress) {
        User user = new User("firstName", "surName", "kmName", 07012323, "googleId", "emailAddress");
        return userRepository.save(user);
    }


    public User updateUser(User user) {
        // Verify user exists
        getUserById(user.getGoogleId());
        return userRepository.save(user);
    }

    public void deleteUser(String googleId) {
        User user = getUserById(googleId);
        userRepository.delete(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public boolean existsByGoogleId(String googleId) {
        return userRepository.findByGoogleId(googleId).isPresent();
    }

    public User updateKmName(String googleId, String kmName) {
        User user = getUserById(googleId);
        user.setKmName(kmName);
        return userRepository.save(user);
    }

    public User updatePhoneNumber(String googleId, int phoneNumber) {
        User user = getUserById(googleId);
        user.setPhoneNumber(phoneNumber);
        return userRepository.save(user);
    }
}