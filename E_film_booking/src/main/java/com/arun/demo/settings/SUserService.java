package com.arun.demo.settings;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arun.demo.beans.Registrationdetails;


@Service
public class SUserService {

    @Autowired
    private SUserRepository userRepository;

    // Find User by ID
    public Registrationdetails findUserById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));
    }

    // Update User Profile
    public void updateUserProfile(Registrationdetails user) {
        Registrationdetails existingUser = findUserById(user.getId());
        existingUser.setName(user.getName());
        existingUser.setEmail(user.getEmail());
        userRepository.save(existingUser);
    }

    // Change Password
    public boolean changePassword(Long id, String currentPassword, String newPassword) {
        Registrationdetails user = findUserById(id);
        if (user.getPassword().equals(currentPassword)) {
            user.setPassword(newPassword);
            userRepository.save(user);
            return true;
        }
        return false;
    }
    
}
