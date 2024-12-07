package com.klef.jfsd.sdpproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdpproject.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
    // Custom queries can be added here if needed
}
