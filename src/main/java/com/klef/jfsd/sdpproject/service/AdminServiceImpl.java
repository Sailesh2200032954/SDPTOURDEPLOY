package com.klef.jfsd.sdpproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;
import com.klef.jfsd.sdpproject.repository.AdminRepository;
import com.klef.jfsd.sdpproject.repository.SpotsRepository;
import com.klef.jfsd.sdpproject.repository.TouristRepository;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private SpotsRepository spotsRepository;

    @Autowired
    private TouristRepository touristRepository;

    @Override
    public Admin checkadminlogin(String uname, String pwd) {
        // Check if the admin exists with the provided username and password
        return adminRepository.findByusernameAndpassword(uname, pwd);
    }

    @Override
    public String deletetour(int eid) {
        try {
            // Assuming that TouristRepository has a deleteById method
            touristRepository.deleteById(eid);
            return "Tourist deleted successfully.";
        } catch (Exception e) {
            return "Error deleting tourist: " + e.getMessage();
        }
    }

    @Override
    public String AddSpot(Spots spots) {
        try {
            // Save the new tourist spot into the database
            spotsRepository.save(spots);
            return "Spot added successfully.";
        } catch (Exception e) {
            return "Error adding spot: " + e.getMessage();
        }
    }

    @Override
    public List<Tourist> viewalltourists() {
        // Retrieve all tourists from the database
        return touristRepository.findAll();
    }
}
