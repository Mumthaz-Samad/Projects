package com.arun.demo.bookingdetails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.arun.demo.beans.Bookingdetails;
import com.arun.demo.beans.Registrationdetails;

@Controller
@RequestMapping("/bookings")
public class BookingController {

    @Autowired
    private BookingService service;

    @PostMapping("/booksaving")
    public String saveBooking(@RequestParam String filmName,
                              @RequestParam String selectedTime,
                              @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date selectedDate,
                              @RequestParam String bookedSeats,
                              @RequestParam int totalPrice,
                              HttpSession session,
                              Model model) {

        // Retrieve user details from the session
        Registrationdetails userDetails = (Registrationdetails) session.getAttribute("userDetails");

        if (userDetails != null) {
            Long userId = userDetails.getId();
            String userName = userDetails.getName();

            // Create a new Bookingdetails object
            Bookingdetails booking = new Bookingdetails();
            booking.setFilmName(filmName);
            booking.setSelectedTime(selectedTime);
            booking.setSelectedDate(selectedDate);
            booking.setBookedSeats(bookedSeats);
            booking.setTotalPrice(totalPrice);
            booking.setUserId(userId);
            booking.setUserName(userName);

            // Save the booking
            service.saveBooking(booking);

            // Add a success message or any other details to the model if needed
            model.addAttribute("message", "Booking successfully saved!");
            return "Bookingconfirm"; // Thymeleaf template for confirmation
        }

        // If userDetails is null, redirect to a login or error page
        return "redirect:/login";
    }

    @GetMapping("/all")
    public String getAllBookings(Model model) {
        // Retrieve all bookings
        List<Bookingdetails> bookings = service.getAllBookings();

        // Add bookings to the model
        model.addAttribute("bookings", bookings);

        // Return the Thymeleaf template name
        return "All"; // Thymeleaf template to display all bookings
    }
}
