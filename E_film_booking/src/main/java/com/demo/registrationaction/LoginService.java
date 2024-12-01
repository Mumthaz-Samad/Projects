package com.demo.registrationaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.beans.Bookingdetails;
import com.demo.beans.Registrationdetails;

import java.util.List;
import java.util.Optional;

@Service
public class LoginService {

    @Autowired
    private RegistrationDAO login;
    
    public boolean validateUser(String email, String password) {
        // Directly call findByEmail without Optional.ofNullable
        Optional<Registrationdetails> userOpt = login.findByEmail(email);
        
        // Now userOpt is already an Optional<Registrationdetails>
        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {
            return true;
        }
        return false;
    }

    public boolean checkEmailExists(String email) {
        return login.existsByEmail(email);
    }

    public boolean updatePassword(String email, String password) {
        Optional<Registrationdetails> userOpt = login.findByEmail(email);

        if (userOpt.isPresent()) {
            Registrationdetails user = userOpt.get();
            user.setPassword(password);  // Set the new password
            login.save(user);   // Save the updated user
            return true;
        }
        return false;
    }
    public Registrationdetails getUserDetailsByEmail(String email) {
        // Fetch user details using the DAO
        Optional<Registrationdetails> userOpt = login.findByEmail(email);

        // Return the user if found, or throw an exception
        return userOpt.orElseThrow(() -> new RuntimeException("User not found for email: " + email));
    }
}
