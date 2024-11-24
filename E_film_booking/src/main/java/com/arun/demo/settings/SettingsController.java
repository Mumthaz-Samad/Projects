package com.arun.demo.settings;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.arun.demo.beans.Registrationdetails;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/setting")
public class SettingsController {

    @Autowired
    private SUserService userService;

    // Load Settings Page
    @GetMapping
    public String settingsPage(Model model, HttpSession session) {
    	Registrationdetails userDetails = (Registrationdetails) session.getAttribute("userDetails");
        Long userId = userDetails.getId();
        if (userId == null) {
            return "redirect:/login"; // Redirect to login page if userId is not in session
        }

        Registrationdetails user = userService.findUserById(userId);
        if (user == null) {
            return "errorPage"; // Replace with your actual error page
        }

        model.addAttribute("user", user);
        return "Settings";
    }

    // Update Profile
    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute Registrationdetails user, HttpSession session) {
    	Registrationdetails userDetails = (Registrationdetails) session.getAttribute("userDetails");
        Long userId = userDetails.getId();
        if (userId == null) {
            return "redirect:/login"; // Ensure user is logged in
        }

        user.setId(userId); // Ensure the user ID from the session is used
        userService.updateUserProfile(user);
        return "redirect:/setting";
    }

    // Change Password
    @PostMapping("/changePassword")
    public String changePassword(@RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 HttpSession session) {
    	Registrationdetails userDetails = (Registrationdetails) session.getAttribute("userDetails");
        Long userId = userDetails.getId();
        if (userId == null) {
            return "redirect:/login"; // Ensure user is logged in
        }

        boolean success = userService.changePassword(userId, currentPassword, newPassword);
        if (success) {
            return "redirect:/setting";
        } else {
            return "redirect:/setting?error=password";
        }
    }

    // Update Preferences
   
}
