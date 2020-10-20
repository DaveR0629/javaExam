package com.javaexam.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.javaexam.models.LoginUser;
import com.javaexam.models.Review;
import com.javaexam.models.TvShow;
import com.javaexam.models.User;
import com.javaexam.services.TvShowService;
import com.javaexam.services.UserService;

@Controller
public class UserController {

	private static UserService userServ;
	private static TvShowService showServ;

	public UserController(UserService userServ, TvShowService showServ) {
		this.userServ = userServ;
		this.showServ = showServ;
	}

	@GetMapping("/")
	public String signIn(Model model) {
		model.addAttribute("registerringUser", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "login.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("registerringUser") User registerringUser, BindingResult result,
			Model model, HttpSession session) {
		if (!registerringUser.getPassword().equals(registerringUser.getConfirm())) {
			result.rejectValue("confirm", "Match", "Confirm Password must match Password!");
		}
		if (userServ.getUser(registerringUser.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Email already in use!");
		}

		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "login.jsp";
		} else {
			session.setAttribute("user", userServ.create(registerringUser));
			return "redirect:/home/asc";
		}
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model,
			HttpSession session) {
		User loggingInUser = userServ.login(loginUser, result);
		if (result.hasErrors()) {
			model.addAttribute("registerringUser", new User());
			return "login.jsp";
		} else {
			session.setAttribute("user", loggingInUser);
			return "redirect:/home";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

	@GetMapping("/user")
	public String userProfile(HttpSession session, Model model) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		User userFromDB = userServ.getUser(loggedInUser.getId());
		model.addAttribute("user", userFromDB);
		List<TvShow> otherTvShows = showServ.getTvShow();
		for (Review r : userFromDB.getReviews()) {
			otherTvShows.remove(r.getTvShow());
		}
		model.addAttribute("mainsToReview", otherTvShows);
		return "userProfile.jsp";
	}
}
