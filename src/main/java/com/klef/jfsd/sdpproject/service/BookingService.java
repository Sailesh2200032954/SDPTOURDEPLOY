package com.klef.jfsd.sdpproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdpproject.model.Booking;
import com.klef.jfsd.sdpproject.repository.BookingRepository;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    public Booking createBooking(String name, String email, String spotName, String spotLocation, String bookingDate, Long amount) {
        Booking booking = new Booking();
        booking.setName(name);
        booking.setEmail(email);
        booking.setSpotName(spotName);
        booking.setSpotLocation(spotLocation);
        booking.setBookingDate(bookingDate);
        booking.setAmount(amount);

        // Save the booking to the database
        return bookingRepository.save(booking);
    }

    public Booking getBookingById(Long id) {
        return bookingRepository.findById(id).orElse(null);
    }

    // Add other methods as needed
}
