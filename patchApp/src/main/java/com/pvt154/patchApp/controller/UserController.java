package com.pvt154.patchApp.controller;

import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/user")
public class UserController {

    private final UserRepository userRepository;

    @Autowired // valfri i nyare Spring, men bra att ha
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Sökning efter personer
    @GetMapping("/search")
    public List<User> searchUsers(@RequestParam("query") String query) {
        return userRepository.searchUsers(query);
    }
}
