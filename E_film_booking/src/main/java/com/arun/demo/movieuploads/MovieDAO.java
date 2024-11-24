package com.arun.demo.movieuploads;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arun.demo.beans.MovieDetails;

@Repository
public interface MovieDAO extends JpaRepository<MovieDetails, Long>{
	
	List<MovieDetails> findByMovieNameContainingIgnoreCase(String movieName);
	

}
