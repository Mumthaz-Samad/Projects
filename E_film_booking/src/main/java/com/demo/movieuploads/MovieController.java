package com.demo.movieuploads;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.demo.beans.MovieDetails;

@Controller
public class MovieController {
	
	    @Autowired
	    private MovieService service;
	 
	    @PostMapping("/uploadMovieDetails")
	    public String uploadMovieDetails(@RequestParam("movieName") String movieName,
	                                     @RequestParam("image") MultipartFile image,
	                                     @RequestParam("movieDetails") String movieDetails,
	                                     Model model) {
	        try {
	           
	            MovieDetails savedMovie = service.saveMovieDetails(movieName, image, movieDetails);
	            model.addAttribute("success", "Movie details uploaded successfully!");
	        } catch (IOException e) {
	            model.addAttribute("error", "Error uploading file: " + e.getMessage());
	        }

	        return "redirect:/admin"; 
	    }
	    @GetMapping("/home")
	    public String getMovies(Model model) {
	        List<MovieDetails> movieList = service.getAllMovies();
	        model.addAttribute("movieList", movieList);
	        return "home"; 
	    }
	    @GetMapping("/homecustomer")
	    public String getMoviess(Model model) {
	        List<MovieDetails> movieList = service.getAllMovies();
	        model.addAttribute("movieList", movieList);
	        return "homecustomer"; 
	    }

	     
	     @GetMapping("/search")
	     @ResponseBody
	     public List<MovieDetails> searchMovies(@RequestParam("query") String query) {
	         return service.searchMoviesByName(query); 
	     }

}
