package com.demo.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.beans.Registrationdetails;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public Registrationdetails getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }
}
