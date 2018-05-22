package com.example.sweater.repos;

import com.example.sweater.domain.UserLogin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserLoginRepo extends JpaRepository<UserLogin, Long> {
    UserLogin findByUsername(String username);
}
