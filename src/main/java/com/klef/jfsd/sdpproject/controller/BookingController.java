package com.klef.jfsd.sdpproject.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookingController {

    @GetMapping("/bookingconfirmation")
    public String showBookingConfirmation(@RequestParam Map<String, String> params, Model model) {
        // Add necessary attributes to the model
        model.addAttribute("params", params);
        return "bookingconfirmation"; // This resolves to BookingConfirmation.jsp
    }
}
