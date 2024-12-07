package com.klef.jfsd.sdpproject.service;

import java.util.List;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;

public interface AdminService {
    // Method to check admin login credentials
    public Admin checkadminlogin(String uname, String pwd);

    // Method to delete a tourist by their ID
    public String deletetour(int eid);

    // Method to add a new tourist spot
    public String AddSpot(Spots spots);

    // Method to view all tourists
    public List<Tourist> viewalltourists();
}
