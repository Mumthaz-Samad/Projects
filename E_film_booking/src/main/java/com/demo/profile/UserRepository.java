package com.demo.profile;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.beans.Registrationdetails;

public interface UserRepository extends JpaRepository<Registrationdetails, Long> {
    Registrationdetails findByEmail(String email);
}

