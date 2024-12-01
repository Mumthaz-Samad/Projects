package com.demo.settings;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.beans.Registrationdetails;

public interface SUserRepository extends JpaRepository<Registrationdetails, Long> {
}
