package com.javaexam.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.javaexam.models.Review;
import com.javaexam.models.TvShow;
import com.javaexam.models.User;
import com.javaexam.services.TvShowService;

@Controller
public class HomeController {

	private static TvShowService showServ;

	public HomeController(TvShowService showServ) {
		this.showServ = showServ;
	}

	@GetMapping("/home")
	public String newTvShowPlus(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("newShowPlus", new TvShow());
		model.addAttribute("allShows", showServ.getTvShow());
		return "dashboard.jsp";
	}

	@GetMapping("/home/desc")
	public String newTvShowPlusDesc(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("newShowPlus", new TvShow());
		model.addAttribute("allReviews", showServ.descRev());
		return "orderedDashboard.jsp";
	}

	@GetMapping("/home/asc")
	public String newTvShowPlusAsc(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("newShowPlus", new TvShow());
		model.addAttribute("allReviews", showServ.ascRev());
		return "orderedDashboard.jsp";
	}

	@PostMapping("/shows/new")
	public String createTvShowWithNetworks(@Valid @ModelAttribute("newShowPlus") TvShow newShowPlus,
			BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("allShows", showServ.getTvShow());
			return "dashboard.jsp";
		} else {
			User loggedInUser = (User) session.getAttribute("user");
			newShowPlus.setUser(loggedInUser);
			showServ.create(newShowPlus);
			return "redirect:/home";
		}
	}

	@GetMapping("/show/{id}")
	public String showMain(@PathVariable("id") Long id, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("someShow", showServ.getTvShow(id));
		model.addAttribute("newReview", new Review());
		return "showTvShow.jsp";
	}

	@PostMapping("/shows/{id}/review")
	public String reviewShow(@Valid @ModelAttribute("newReview") Review newReview, BindingResult result,
			@PathVariable("id") Long id, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (result.hasErrors()) {
			model.addAttribute("someShow", showServ.getTvShow(id));
			return "showTvShow.jsp";
		}
		newReview.setTvShow(showServ.getTvShow(id));
		newReview.setUser(loggedInUser);
		Review r = showServ.create(newReview);
		if (r == null) {
			result.rejectValue("rating", "unique", "You have already reviewed this Show!");
			model.addAttribute("someShow", showServ.getTvShow(id));
			return "showTvShow.jsp";
		}
		return "redirect:/show/" + id;
	}

	@GetMapping("edit/show/{id}")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
		model.addAttribute("someShow", showServ.getTvShow(id));
		return "editShow.jsp";
	}

	@PostMapping("/show/update/{id}")
	public String updateShow(@PathVariable("id") Long id, @Valid @ModelAttribute("someShow") TvShow someShow,
			BindingResult result) {
		if (result.hasErrors()) {
			return "editShow.jsp";
		} else {
			showServ.update(someShow, id);
			return "redirect:/show/" + id;
		}
	}

	@GetMapping("/show/destroy/{id}")
	public String destroyShow(@PathVariable("id") Long id, @Valid @ModelAttribute("someShow") TvShow someShow,
			BindingResult result, HttpSession session, Model model) {
		showServ.destory(someShow, id);
		return "redirect:/home";
	}
}
