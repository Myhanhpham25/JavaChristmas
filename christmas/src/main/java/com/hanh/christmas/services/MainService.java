package com.hanh.christmas.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hanh.christmas.models.Potluck;
import com.hanh.christmas.models.User;
import com.hanh.christmas.repositories.UserRepository;


@Service
public class MainService {
	private UserRepository userRepository;
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public MainService(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepository = userRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	public void saveWithUserRole(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		userRepository.save(user);
	}

	public User findByEmail(String email) {	
		return userRepository.findByEmail(email);
	}

	public List<User> findAllUsers() {
		return userRepository.findAll();
	}

	public void createfood(Potluck food) {
		System.out.println("food mainservice");		
	}

}
