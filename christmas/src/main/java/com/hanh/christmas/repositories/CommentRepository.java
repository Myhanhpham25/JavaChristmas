package com.hanh.christmas.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hanh.christmas.models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long> {

	List<Comment> findAll();
}
