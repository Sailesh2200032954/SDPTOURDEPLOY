package com.klef.jfsd.sdpproject.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;
import com.klef.jfsd.sdpproject.repository.TouristRepository;

@Service
public class TouristServiceImpl implements TouristService {
    @Autowired
    private TouristRepository touristRepository;

    @Override
    public String touristRegistration(Tourist tourist) {
        // Registration logic here
        return "Success";
    }

    @Override
    public Tourist checkTourLogin(String email, String password) {
        // Login logic here
        return null;
    }

    @Override
    public List<Spots> viewSpots() {
        // Fetch spots
        return null;
    }

    @Override
    public List<Tourist> viewAllTourists() {
        return touristRepository.findAll();
    }

    @Override
    public boolean emailExists(String email) {
        return touristRepository.existsByEmail(email);
    }

    @Override
    public boolean contactExists(String contact) {
        return touristRepository.existsByContact(contact);
    }

    @Override
    public void saveTourist(Tourist tourist) {
        touristRepository.save(tourist);
    }
}
