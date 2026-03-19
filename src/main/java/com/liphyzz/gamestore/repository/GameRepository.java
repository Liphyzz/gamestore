package com.liphyzz.gamestore.repository;

import org.springframework.data.repository.CrudRepository;

import com.liphyzz.gamestore.model.Game;

public interface GameRepository extends CrudRepository<Game, Integer>{
    
}
