package com.demo.registrationaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.beans.Registrationdetails;
@Service
public class RegistrationService {
	@Autowired
	private RegistrationDAO register;
	
	public void saveUser(Registrationdetails user) {
        register.save(user);
    }

	

}
