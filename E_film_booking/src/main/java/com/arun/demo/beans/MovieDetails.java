package com.arun.demo.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="movie_details")
public class MovieDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="movie_id")
    private long movieId;

    @Column(name = "movie_name", nullable = false)
    private String movieName;

    @Column(name = "image", nullable = false)
    private String image; 

    @Column(name = "movie_details", columnDefinition = "varchar(1000)", nullable = false)
    private String movieDetails;

    // Getters and Setters
    public long getMovieId() {
        return movieId;
    }

    public void setMovieId(long movieId) {
        this.movieId = movieId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getMovieDetails() {
        return movieDetails;
    }

    public void setMovieDetails(String movieDetails) {
        this.movieDetails = movieDetails;
    }

    @Override
    public String toString() {
        return "MovieDetails [movieId=" + movieId + ", movieName=" + movieName + ", image=" + image 
                + ", movieDetails=" + movieDetails + "]";
    }
}
