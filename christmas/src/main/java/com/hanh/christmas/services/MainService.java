package com.hanh.christmas.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hanh.christmas.models.Comment;
import com.hanh.christmas.models.Potluck;
import com.hanh.christmas.models.User;
import com.hanh.christmas.repositories.CommentRepository;
import com.hanh.christmas.repositories.PotluckRepository;
import com.hanh.christmas.repositories.UserRepository;


@Service
public class MainService {
	private UserRepository userRepository;
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	private PotluckRepository potluckRepository;
	private CommentRepository commentRepository;

	public MainService(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder, PotluckRepository potluckRepository, CommentRepository commentRepository) {
		this.userRepository = userRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
		this.potluckRepository = potluckRepository;
		this.commentRepository = commentRepository;
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

	public void createfood(Potluck potluck, User user) {
		potluck.setUser(user);
		Potluck new_potluck = potluckRepository.save(potluck);
		User curUser = userRepository.findOne(user.getId());
		List<Potluck> potlucks = curUser.getPotlucks();	
		potlucks.add(new_potluck);
		curUser.setPotlucks(potlucks);
		userRepository.save(curUser);	
	}

	public void attendParty(Long id) {
		User user = userRepository.findOne(id);
		Boolean cur_status = user.getStatus();
		Boolean new_status = true;
		user.setStatus(new_status);
		userRepository.save(user);		
	}

	public void cancelParty(Long id) {
		User user = userRepository.findOne(id);
		Boolean cur_status = user.getStatus();
		Boolean new_status = false;
		user.setStatus(new_status);
		userRepository.save(user);	
	}

	public void deletepotluck(Long id) {
		Potluck potluck = potluckRepository.findOne(id);
		potluckRepository.delete(potluck);	
	}

	public void addComment(Comment comment) {
		commentRepository.save(comment);
	}

	public  List<Comment> findAllComments() {
		return commentRepository.findAll();
	}

	public void deleteComment(Long id) {
		Comment comment = commentRepository.findOne(id);
		commentRepository.delete(comment);	
	}

	public void deleteUser(Long id) {
	 User user = userRepository.findOne(id);
	 userRepository.delete(user);
		
	}

}
