package com.demo.registrationaction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.beans.Bookingdetails;
import com.demo.beans.Registrationdetails;

import java.util.List;
import java.util.Optional;  // Import Optional

@Repository
public interface RegistrationDAO extends JpaRepository<Registrationdetails, Long> {
	
    Optional<Registrationdetails> findByEmail(String email); // Return Optional
    boolean existsByEmail(String email);
   
}
