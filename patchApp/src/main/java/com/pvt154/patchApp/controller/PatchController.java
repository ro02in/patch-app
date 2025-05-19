package com.pvt154.patchApp.controller;
//test
import com.pvt154.patchApp.model.Patch;
import com.pvt154.patchApp.model.User;
import com.pvt154.patchApp.service.PatchService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/patches")
public class PatchController {
    private final PatchService patchService;

    public PatchController(PatchService patchService) {
        this.patchService = patchService;
    }

    @GetMapping("/user/{userId}")
    public List<Patch> getPatchesByUser(@PathVariable String userId) {
        User user = new User(); user.setGoogleId(userId); // eller hämta från UserService
        return patchService.getPatchesForUser(user);
    }
}

