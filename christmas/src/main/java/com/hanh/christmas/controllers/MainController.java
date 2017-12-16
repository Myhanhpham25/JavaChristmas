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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanh.christmas.models.Comment;
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
	public String home(@ModelAttribute("potluck") Potluck potluck, @ModelAttribute("comment") Comment comment, Principal principal, Model model, HttpSession session) {
		String email = principal.getName();
		User currentUser = mainService.findByEmail(email); //User Object
		session.setAttribute("curUser", currentUser);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("allUsers", mainService.findAllUsers());
        model.addAttribute("comments", mainService.findAllComments());
		return "dashboard";
	}
	
	@PostMapping(path="/addpotluck")
	public String createPotluck(@Valid @ModelAttribute("potluck") Potluck potluck, BindingResult result, Model model, Principal principal) {
		String email = principal.getName();
		User user = mainService.findByEmail(email); //User Object

		if(result.hasErrors()) {
			System.out.println(result);
			return "dashboard";
		}else {
			mainService.createfood(potluck, user);
			return "redirect:/dashboard";
		}
	}
		
		@RequestMapping("/attend/{id}")
		public String attendParty(@PathVariable("id") Long id, Model model, Principal principal) {
			mainService.attendParty(id);
			return "redirect:/dashboard";
		}
		
		@RequestMapping("/cancel/{id}")
		public String cancelParty(@PathVariable("id") Long id, Model model, Principal principal) {
			mainService.cancelParty(id);
			return "redirect:/dashboard";
		}
		
		@RequestMapping("/delete/{id}")
		public String deletepotluck(@PathVariable("id") Long id, Model model, Principal principal) {
			mainService.deletepotluck(id);
			return "redirect:/dashboard";
		}
		
		@PostMapping(path="/addComment")
		public String createComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, Model model) {
			if(result.hasErrors()) {
				System.out.println(result);
				return "dashboard";
			}else {
				mainService.addComment(comment);
				return "redirect:/dashboard";
			}
		}
			
			@RequestMapping("/deleteComment/{id}")
			public String deleteComment(@PathVariable("id") Long id, Model model) {
				mainService.deleteComment(id);
				return "redirect:/dashboard";
			}
			
			@RequestMapping("/deleteUser/{id}")
			public String deleteUser(@PathVariable("id") Long id, Model model) {
				mainService.deleteUser(id);
				return "redirect:/dashboard";
			}
}
