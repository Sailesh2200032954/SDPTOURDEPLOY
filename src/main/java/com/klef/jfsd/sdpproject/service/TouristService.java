package com.klef.jfsd.sdpproject.service;

import java.util.List;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;

public interface TouristService {
    String touristRegistration(Tourist tourist);
    Tourist checkTourLogin(String email, String password);
    List<Spots> viewSpots();
    List<Tourist> viewAllTourists();
    boolean emailExists(String email);
    boolean contactExists(String contact);
    void saveTourist(Tourist tourist);
}
