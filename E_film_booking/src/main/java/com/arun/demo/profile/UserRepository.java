package com.arun.demo.profile;

import com.arun.demo.beans.Registrationdetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Registrationdetails, Long> {
    Registrationdetails findByEmail(String email);
}

