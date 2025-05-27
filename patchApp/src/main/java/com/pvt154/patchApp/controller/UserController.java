package com.pvt154.patchApp.controller;

import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/user")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public ResponseEntity<User> registerUser(@RequestBody User user) {
        User savedUser = userService.createUser(user);
        return ResponseEntity.ok(savedUser);
    }

    @PutMapping("/update/{googleId}")
    public ResponseEntity<User> updateUser(@PathVariable String googleId,
                                           @RequestBody User updatedUser) {
        User result = userService.updateUser(googleId, updatedUser);
        return ResponseEntity.ok(result);
    }

    @GetMapping("/search")
    public List<User> searchUsers(@RequestParam("query") String query) {
        return userService.searchUsers(query);
    }

    @DeleteMapping("/delete/{googleId}")
    public ResponseEntity<User> deleteUser(@PathVariable String googleId) {
         userService.deleteUser(googleId);
         return ResponseEntity.noContent().build();
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello User!";
    }
}