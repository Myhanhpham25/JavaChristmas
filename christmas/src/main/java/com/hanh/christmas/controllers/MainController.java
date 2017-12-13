package com.hanh.christmas.controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanh.christmas.models.Potluck;
import com.hanh.christmas.models.User;
import com.hanh.christmas.services.MainService;
import com.hanh.christmas.validator.UserValidator;



@Controller
public class MainController {

	private MainService mainService;
	private UserValidator userValidator;

	public MainController(MainService mainService, UserValidator userValidator) {
		this.mainService = mainService;
		this.userValidator = userValidator;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	// login and route to dashboard
	@RequestMapping("/login")
	public String login(@ModelAttribute("user") User user,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model, HttpSession session ) {
		
		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successfull!");
		}
		return "index";
	}

	// post - creating registration page
	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "index";
		}
		mainService.saveWithUserRole(user);
		return "redirect:/login";
	}

	// principle is equal to session. i also displayed all the users on the same
	// jsut to see what my database have.
	@RequestMapping(value = { "/", "/dashboard" })
	public String home(@ModelAttribute("potluck") Potluck potluck, Principal principal, Model model, HttpSession session) {
		String email = principal.getName();
		User currentUser = mainService.findByEmail(email); //User Object
		session.setAttribute("curUser", currentUser);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("allUsers", mainService.findAllUsers());

		return "dashboard";
	}
	
	@PostMapping(path="/addpotluck")
	public String createPotluck(@Valid @ModelAttribute("potluck") Potluck potluck, BindingResult result, Model model, Principal principal) {
		String email = principal.getName();
		model.addAttribute("userId", mainService.findByEmail(email).getId());
		if(result.hasErrors()) {
			System.out.println(result);
			return "dashboard";
		}else {
			mainService.createfood(potluck);
			System.out.println("successsfuly added food");
			return "redirect:/dashboard";
		}	
	}
}
