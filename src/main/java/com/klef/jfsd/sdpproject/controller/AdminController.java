package com.klef.jfsd.sdpproject.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;
import com.klef.jfsd.sdpproject.repository.SpotsRepository;
import com.klef.jfsd.sdpproject.repository.TouristRepository;
import com.klef.jfsd.sdpproject.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private SpotsRepository touristSpotRepository;

    @Autowired
    private TouristRepository touristRepository;

    @GetMapping("adminlogin")
    public ModelAndView adminlogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminlogin");
        return mv;
    }

    @GetMapping("adminhome")
    public ModelAndView adminhome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminhome");
        return mv;
    }

    @GetMapping("adminlogout")
    public ModelAndView adminlogout() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminlogin");
        return mv;
    }

    @PostMapping("checkadminlogin")
    public ModelAndView checkadminlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String auname = request.getParameter("auname");
        String apwd = request.getParameter("apwd");

        Admin admin = adminService.checkadminlogin(auname, apwd);
        if (admin != null) {
            mv.setViewName("adminhome");
        } else {
            mv.setViewName("adminloginfail");
            mv.addObject("message", "Login Failed");
        }
        return mv;
    }

    @GetMapping("addspots")
    public ModelAndView addspots() {
        ModelAndView mv = new ModelAndView("addspots");
        return mv;
    }

    @PostMapping("insertspot")
    public ModelAndView insertspot(HttpServletRequest request) {
        String msg = null;
        ModelAndView mv = new ModelAndView();

        try {
            String Country = request.getParameter("spot_country");
            String State = request.getParameter("spot_state");
            String Spotname = request.getParameter("spot_name");

            if (Country == null || Country.trim().isEmpty()) {
                throw new IllegalArgumentException("Country cannot be empty.");
            }
            if (State == null || State.trim().isEmpty()) {
                throw new IllegalArgumentException("State cannot be empty.");
            }
            if (Spotname == null || Spotname.trim().isEmpty()) {
                throw new IllegalArgumentException("Spotname cannot be empty.");
            }

            Spots s = new Spots();
            s.setCountry(Country);
            s.setState(State);
            s.setSpotname(Spotname);

            msg = adminService.AddSpot(s);
            mv.setViewName("spotmsg");
            mv.addObject("message", msg);
        } catch (IllegalArgumentException e) {
            msg = e.getMessage();
            mv.setViewName("spoterror");
            mv.addObject("message", msg);
        } catch (Exception e) {
            msg = e.getMessage();
            mv.setViewName("spoterror");
            mv.addObject("message", msg);
        }

        return mv;
    }

    @PostMapping("addspotsuccess")
    public ModelAndView addspotsuccess() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addspotsuccess");
        return mv;
    }

    @GetMapping("viewalltourists")
    public ModelAndView viewalltourists() {
        ModelAndView mv = new ModelAndView();
        List<Tourist> tourlist = adminService.viewalltourists();
        mv.setViewName("viewalltourists");
        mv.addObject("tourlist", tourlist);
        return mv;
    }

    @GetMapping("deletetour")
    public ModelAndView deletetour() {
        ModelAndView mv = new ModelAndView();
        List<Tourist> tourlist = adminService.viewalltourists();
        mv.setViewName("deletetour");
        mv.addObject("tourlist", tourlist);
        return mv;
    }

    @GetMapping("delete")
    public String deleteoperation(@RequestParam("id") int tid) {
        adminService.deletetour(tid);
        return "redirect:/deletetour";
    }

    @GetMapping("/api/total-tourist-spots")
    public long getTotalTouristSpots() {
        return touristSpotRepository.count(); // This will return the count of spots
    }

    @GetMapping("/api/total-tourists")
    public long getTotalTourists() {
        return touristRepository.count(); // This will return the count of tourists
    }

    @GetMapping("/session-timeout")
    public ModelAndView sessionTimeout() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminlogin");
        mv.addObject("message", "Your session has expired. Please log in again.");
        return mv;
    }
}
