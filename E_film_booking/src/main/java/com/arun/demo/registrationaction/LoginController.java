package com.arun.demo.registrationaction;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arun.demo.beans.Bookingdetails;
import com.arun.demo.beans.Registrationdetails;

@Controller
public class LoginController {

    @Autowired
    private LoginService service;

    @PostMapping("/processing")
    public String processLogin(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               Model model, HttpSession session) {

        // Check for admin credentials
        if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
            return "redirect:/admin"; 
        }

        boolean isValid = service.validateUser(email, password);

        if (isValid) {
            // Fetch full user details from the database
            Registrationdetails userDetails = service.getUserDetailsByEmail(email);

            // Store user details in the session
            session.setAttribute("userDetails", userDetails);

            return "redirect:/homecustomer";  
        } else {
            model.addAttribute("failed", "Invalid email or password!");
            return "login";  
        }
    }


    @PostMapping("/update")
    public String showUpdatePasswordPage(@RequestParam("email") String email, Model model) {
        boolean emailExists = service.checkEmailExists(email); // Validate email existence

        if (emailExists) {
            return "updatepassword"; // Show update password form
        } else {
            model.addAttribute("error", "The provided email does not exist.");
            return "update-password"; // Return back with error
        }
    }

    @PostMapping("/update-password")
    public String updatePassword(@RequestParam("email") String email,
                                 @RequestParam("password") String password, 
                                 Model model) {

        boolean isUpdated = service.updatePassword(email, password);

        if (isUpdated) {
            model.addAttribute("success", "Password updated successfully!");
        } else {
            model.addAttribute("failed", "Password update failed. Try again!");
        }

        return "update-password"; // Show update password form with status
    }
    
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Clear all session data
        return "redirect:/loginForm";  // Redirect to login page
    }

    
   
   
}
