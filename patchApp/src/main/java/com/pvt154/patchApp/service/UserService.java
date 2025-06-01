package com.pvt154.patchApp.service;

import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public boolean emailExists(String email) {
        return userRepository.findByEmailAddress(email).isPresent();
    }

    public User registerUser(User user) {
        // Add any validation here if needed
        return userRepository.save(user);
    }

    public boolean validateUserCredentials(String email, String password) {
        Optional<User> userOpt = userRepository.findByEmailAddress(email);
        return userOpt.isPresent() && userOpt.get().getPassword().equals(password);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
    }

    public User updateUser(Long id, User updatedUser) {
        User user = getUserById(id);
        user.setFirstName(updatedUser.getFirstName());
        user.setSurName(updatedUser.getSurName());
        user.setKmName(updatedUser.getKmName());
        user.setEmailAddress(updatedUser.getEmailAddress());
        user.setBiography(updatedUser.getBiography());
        user.setPicture(updatedUser.getPicture());
        return userRepository.save(user);
    }

    public void deleteUser(Long id) {
        User user = getUserById(id);
        userRepository.delete(user);
    }

    public List<User> searchUsers(String query) {
        return userRepository.searchUsers(query);
    }
}