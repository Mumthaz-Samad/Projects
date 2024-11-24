package com.arun.demo.beans;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "booking_details")
public class Bookingdetails {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	private Long userId;
	

	private String userName;

    private String filmName;

    private String selectedTime;

    @Temporal(TemporalType.DATE)
    private Date selectedDate;

    @Column(length = 255)
    private String bookedSeats;

    private int totalPrice;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFilmName() {
		return filmName;
	}

	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}

	public String getSelectedTime() {
		return selectedTime;
	}

	public void setSelectedTime(String selectedTime) {
		this.selectedTime = selectedTime;
	}

	public Date getSelectedDate() {
		return selectedDate;
	}

	public void setSelectedDate(Date selectedDate) {
		this.selectedDate = selectedDate;
	}

	public String getBookedSeats() {
		return bookedSeats;
	}

	public void setBookedSeats(String bookedSeats) {
		this.bookedSeats = bookedSeats;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Bookingdetails [id=" + id + ", userName=" + userName + ", filmName=" + filmName + ", selectedTime="
				+ selectedTime + ", selectedDate=" + selectedDate + ", bookedSeats=" + bookedSeats + ", totalPrice="
				+ totalPrice + "]";
	}

	
    

	
	
	

}
