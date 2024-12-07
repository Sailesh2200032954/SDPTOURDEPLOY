package com.klef.jfsd.sdpproject.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;
import com.klef.jfsd.sdpproject.service.TouristService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TouristController {

    @Autowired
    private TouristService touristService;

    @GetMapping("/")
    public ModelAndView home() {
        return new ModelAndView("home");
    }

    @GetMapping("/aboutus")
    public ModelAndView aboutus() {
        return new ModelAndView("aboutus");
    }

    @GetMapping("/services")
    public ModelAndView services() {
        return new ModelAndView("services");
    }

    @GetMapping("/upcpackages")
    public ModelAndView upcpackages() {
        return new ModelAndView("upcpackages");
    }

    @GetMapping("/touristreg")
    public ModelAndView touristreg() {
        return new ModelAndView("touristreg");
    }

    @GetMapping("/touristlogin")
    public ModelAndView touristlogin() {
        return new ModelAndView("touristlogin");
    }

    @PostMapping("/inserttourist")
    public String insertTourist(@RequestParam("ename") String name, 
                                 @RequestParam("egender") String gender,
                                 @RequestParam("edob") String dob, 
                                 @RequestParam("eemail") String email,
                                 @RequestParam("epwd") String password, 
                                 @RequestParam("econtact") String contact,
                                 Model model) {
        try {
            if (touristService.emailExists(email)) {
                model.addAttribute("message", "Email already in use.");
                return "touristreg";
            }

            if (touristService.contactExists(contact)) {
                model.addAttribute("message", "Contact number already in use.");
                return "touristreg";
            }

            Tourist tourist = new Tourist(name, gender, dob, email, password, contact);
            touristService.saveTourist(tourist);
            model.addAttribute("message", "Registration successful! Please log in.");
            return "redirect:/touristlogin";
        } catch (Exception e) {
            model.addAttribute("message", "An error occurred during registration.");
            return "touristreg";
        }
    }

    @PostMapping("/checktourlogin")
    public ModelAndView checktourlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String email = request.getParameter("eemail");
        String password = request.getParameter("epwd");

        Tourist tour = touristService.checkTourLogin(email, password);

        if (tour != null) {
            HttpSession session = request.getSession();
            session.setAttribute("tourist", tour);
            session.setMaxInactiveInterval(900);
            mv.setViewName("touristhome");
        } else {
            mv.setViewName("touristlogin");
            mv.addObject("message", "Login failed. Please check your credentials.");
        }

        return mv;
    }

    @GetMapping("/touristhome")
    public ModelAndView touristhome() {
        return new ModelAndView("touristhome");
    }

    @GetMapping("/touristprofile")
    public ModelAndView touristprofile() {
        return new ModelAndView("touristprofile");
    }

    @GetMapping("/touristcontactus")
    public ModelAndView touristcontactus() {
        return new ModelAndView("touristcontactus");
    }

    @GetMapping("/touristlogout")
    public String touristlogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/touristlogin";
    }

    @GetMapping("/viewspots")
    public ModelAndView viewspots() {
        ModelAndView mv = new ModelAndView();
        try {
            List<Spots> spots = touristService.viewSpots();
            mv.setViewName("viewspots");
            mv.addObject("spots", spots);
        } catch (Exception e) {
            mv.setViewName("error");
            mv.addObject("message", "Error fetching spots.");
        }
        return mv;
    }

    private boolean isSessionValid(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("tourist") != null;
    }
}
