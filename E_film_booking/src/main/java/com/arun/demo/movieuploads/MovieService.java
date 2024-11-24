package com.arun.demo.movieuploads;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.arun.demo.beans.MovieDetails;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;


@Service
public class MovieService {
	@Autowired
	private MovieDAO movies;
	
	private static final String UPLOAD_DIR = "src/main/resources/static/uploads/";
	
	public MovieDetails saveMovieDetails(String movieName, MultipartFile image, String movieDetails) throws IOException {
        // Save the file
        String fileName = image.getOriginalFilename();
        Path filePath = Paths.get(UPLOAD_DIR + fileName);
        Files.createDirectories(filePath.getParent());
        Files.write(filePath, image.getBytes());

        // Save movie details in the database
        MovieDetails movie = new MovieDetails();
        movie.setMovieName(movieName);
        movie.setImage("/uploads/" + fileName); // Store the path for retrieval
        movie.setMovieDetails(movieDetails);

        return movies.save(movie);
    }
	
	public List<MovieDetails> getAllMovies() {
        return movies.findAll();
    }
	public List<MovieDetails> searchMoviesByName(String query) {
	    return movies.findByMovieNameContainingIgnoreCase(query);  // Find movies with the name containing the query
	}

}
