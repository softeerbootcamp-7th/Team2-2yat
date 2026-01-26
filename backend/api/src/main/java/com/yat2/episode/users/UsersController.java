package com.yat2.episode.users;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UsersController {

    private final UsersService usersService;

    public UsersController(UsersService usersService) {
        this.usersService = usersService;
    }

    @Operation(
            summary = "summary 예시",
            description = "사용자 리스트를 가져옵니다.",
            security = {
                    //@SecurityRequirement(name = "COOKIE_ACCESS_TOKEN")
            }
    )
    @GetMapping
    public ResponseEntity<List<Users>> getAllUsers() {
        return ResponseEntity.ok(usersService.getAllUsers());
    }
}