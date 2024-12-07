package com.klef.jfsd.sdpproject.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;
import com.klef.jfsd.sdpproject.service.AdminService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.Getter;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	

	@GetMapping("adminlogin")
	public ModelAndView adminlogin() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("adminhome");
		
		
		return mv;
	}
	
	@GetMapping("adminlogout")
	public ModelAndView adminlogout() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		
		ModelAndView mv=new ModelAndView();
		
		
		String auname=request.getParameter("auname");
		String apwd=request.getParameter("apwd");
		
		Admin admin = adminService.checkadminlogin(auname, apwd);
		if(admin!=null) {
		//	return "admin login success";
			mv.setViewName("adminhome");
	
			
		}
		else {
			//return "admin login fail";
			mv.setViewName("adminloginfail");
			mv.addObject("message","Login Failed");
		}
		return mv;
	}
	
	@GetMapping("addspots")
	   public ModelAndView addspots()
	   {
		   ModelAndView mv = new ModelAndView("addspots");
		   mv.setViewName("addspots");
		   return mv;
	   }
	
	@PostMapping("insertspot")
	public ModelAndView insertspot(HttpServletRequest request) {
	    String msg = null;
	    ModelAndView mv = new ModelAndView();
	    
	    try {
	        // Retrieve the parameters from the request
	        String Country = request.getParameter("spot_country");  // Use the correct parameter names from the form
	        String State = request.getParameter("spot_state");
	        String Spotname = request.getParameter("spot_name");
	        
	        // Check if the required fields are not null or empty
	        if (Country == null || Country.trim().isEmpty()) {
	            throw new IllegalArgumentException("Country cannot be empty.");
	        }
	        if (State == null || State.trim().isEmpty()) {
	            throw new IllegalArgumentException("State cannot be empty.");
	        }
	        if (Spotname == null || Spotname.trim().isEmpty()) {
	            throw new IllegalArgumentException("Spotname cannot be empty.");
	        }

	        // Create a new Spot object and set the properties
	        Spots s = new Spots();
	        s.setCountry(Country);
	        s.setState(State);
	        s.setSpotname(Spotname);
	        
	        // Save the Spot (assuming adminService.AddSpot is responsible for saving the spot)
	        msg = adminService.AddSpot(s);
	        System.out.println(msg);
	        
	        // Set success message and view
	        mv.setViewName("spotmsg");
	        mv.addObject("message", msg);
	    } catch (IllegalArgumentException e) {
	        // Handle validation errors
	        msg = e.getMessage();
	        System.out.println("Validation error: " + msg);
	        mv.setViewName("spoterror");
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        // Catch all other exceptions
	        msg = e.getMessage();
	        System.out.println("Error: " + msg);
	        mv.setViewName("spoterror");
	        mv.addObject("message", msg);
	    }
	    
	    return mv;
	}

	

	@PostMapping("addspotsuccess")
	public ModelAndView addspotsuccess() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("addspotsuccess");
		
		
		return mv;
	}
	
	@GetMapping("viewalltourists")
    public ModelAndView viewalltourists()
    {
      ModelAndView mv = new ModelAndView();
      List<Tourist> tourlist = adminService.viewalltourists();
      mv.setViewName("viewalltourists");
      mv.addObject("tourlist",tourlist);		
      return mv;
    }
	
	@GetMapping("deletetour")
    public ModelAndView deletetour()
    {
      ModelAndView mv = new ModelAndView();
      List<Tourist> tourlist = adminService.viewalltourists();
      mv.setViewName("deletetour");
      mv.addObject("tourlist",tourlist);
      return mv;
    }
	
	@GetMapping("delete")
	public String deleteoperation(@RequestParam("id") int tid) {
		adminService.deletetour(tid);
		return "redirect:/deletetour"; //redirection to specific path
	}
	 public ModelAndView sessionTimeout() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("adminlogin");  // Redirect to login page
	        mv.addObject("message", "Your session has expired. Please log in again.");
	        return mv;
	    }
	
}


	
	
	
