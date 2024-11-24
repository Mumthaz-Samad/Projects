package com.arun.demo.settings;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arun.demo.beans.Registrationdetails;

public interface SUserRepository extends JpaRepository<Registrationdetails, Long> {
}
