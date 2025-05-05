package com.pvt154.patchApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pvt154.patchApp.model.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByGoogleId(String googleId);
}

