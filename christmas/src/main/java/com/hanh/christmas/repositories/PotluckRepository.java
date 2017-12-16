package com.hanh.christmas.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hanh.christmas.models.Potluck;

@Repository
public interface PotluckRepository extends CrudRepository<Potluck, Long>{

}
