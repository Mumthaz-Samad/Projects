package com.arun.demo.profile;

import com.arun.demo.beans.Registrationdetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public Registrationdetails getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }
}
