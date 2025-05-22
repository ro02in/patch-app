package com.pvt154.patchApp.repository;

import com.pvt154.patchApp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, String> {
    Optional<User> findByGoogleId(String googleId);

    @RestController
    @RequestMapping("/users")
    public class UserController {

        private final UserRepository userRepository;

        @Autowired // <-- behövs i vissa version, men inte alltid
        public UserController(UserRepository userRepository) {
            this.userRepository = userRepository;
        }

        @GetMapping("/search")
        public List<User> searchUsers(@RequestParam("query") String query) {
            return userRepository.searchUsers(query);
        }
    }


    @Query("SELECT u FROM User u WHERE " +
            "LOWER(u.firstName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(u.surName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(u.kmName) LIKE LOWER(CONCAT('%', :query, '%'))")
    List<User> searchUsers(@Param("query") String query);

}
