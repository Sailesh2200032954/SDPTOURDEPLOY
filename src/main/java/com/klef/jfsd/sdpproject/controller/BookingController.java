package com.klef.jfsd.sdpproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.klef.jfsd.sdpproject.model.Booking;
import com.klef.jfsd.sdpproject.service.BookingService;

@RestController
@RequestMapping("/bookings")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @PostMapping("/create")
    public Booking createBooking(@RequestParam String name,
                                 @RequestParam String email,
                                 @RequestParam String spotName,
                                 @RequestParam String spotLocation,
                                 @RequestParam String bookingDate,
                                 @RequestParam Long amount) {
        return bookingService.createBooking(name, email, spotName, spotLocation, bookingDate, amount);
    }

    @GetMapping("/{id}")
    public Booking getBooking(@PathVariable Long id) {
        return bookingService.getBookingById(id);
    }
}
