package com.arun.demo.profile;

import com.arun.demo.beans.Bookingdetails;
import com.arun.demo.beans.Registrationdetails;
import com.arun.demo.bookingdetails.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CProfileController {

    @Autowired
    private UserService userService;

    @Autowired
    private BookingService bookingService;

    @GetMapping("/profile")
    public String viewProfile(HttpSession session, Model model) {
        Registrationdetails userDetails = (Registrationdetails) session.getAttribute("userDetails");

        if (userDetails == null) {
            // Redirect to login if session is null
            return "redirect:/login";
        }

        Long userId = userDetails.getId();
        Registrationdetails user = userService.getUserById(userId);
        List<Bookingdetails> bookings = bookingService.getBookingsByUserId(userId);

        model.addAttribute("user", user);
        model.addAttribute("bookings", bookings);

        return "profile"; // Thymeleaf template for profile page
    }

    @GetMapping("/order")
    public String viewOrderProfile(HttpSession session, Model model) {
        Registrationdetails userDetails = (Registrationdetails) session.getAttribute("userDetails");

        if (userDetails == null) {
            // Redirect to login if session is null
            return "redirect:/loginForm";
        }

        Long userId = userDetails.getId();
        List<Bookingdetails> bookings = bookingService.getBookingsByUserId(userId);

        model.addAttribute("bookings", bookings);

        return "Order"; // Thymeleaf template for Order page
    }
}
