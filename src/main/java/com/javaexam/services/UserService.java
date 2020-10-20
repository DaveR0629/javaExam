package com.javaexam.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.javaexam.models.LoginUser;
import com.javaexam.models.User;
import com.javaexam.repositorys.UserRepository;

@Service
public class UserService {

	private static UserRepository userRepo;

	public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}

	public User create(User registerringUser) {
		String hashed = BCrypt.hashpw(registerringUser.getPassword(), BCrypt.gensalt());
		registerringUser.setPassword(hashed);
		return userRepo.save(registerringUser);
	}

	public User getUser(Long id) {
		Optional<User> potentialUser = userRepo.findById(id);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}

	public User getUser(String userName) {
		Optional<User> potentialUser = userRepo.findByUserName(userName);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}

	public User login(LoginUser loginUser, BindingResult result) {
		if (result.hasErrors()) {
			return null;
		}
		User existingUser = getUser(loginUser.getUserName());
		if (existingUser == null) {
			result.rejectValue("userName", "Unique", "Unknown user name!");
			return null;
		}
		if (!BCrypt.checkpw(loginUser.getPassword(), existingUser.getPassword())) {
			result.rejectValue("password", "Matches", "Incorrect Password!");
			return null;
		}
		return existingUser;
	}
}
