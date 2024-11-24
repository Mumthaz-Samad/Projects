package com.arun.demo.bookingdetails;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arun.demo.beans.Bookingdetails;

public interface BookingRepository extends JpaRepository<Bookingdetails, Long>{
	List<Bookingdetails> findByUserId(Long userId);

}
