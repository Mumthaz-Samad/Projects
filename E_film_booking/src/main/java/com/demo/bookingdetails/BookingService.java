package com.demo.bookingdetails;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.beans.Bookingdetails;
@Service
public class BookingService {
	@Autowired
	private BookingRepository book;
	
	public Bookingdetails saveBooking(Bookingdetails booking) {
        return book.save(booking);
    }
	public List<Bookingdetails> getAllBookings() {
	    return book.findAll();
	}
	public List<Bookingdetails> getBookingsByUserId(Long userId) {
        return book.findByUserId(userId);
    }

}
