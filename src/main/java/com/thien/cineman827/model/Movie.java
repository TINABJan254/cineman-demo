package com.thien.cineman827.model;

public class Movie {
    private int id;
    private String title;
    private String genre;
    private int duration;
    private String language;
    private String ageRestriction;
    private String director;
    private String description;

    public Movie(){}

    public Movie(int id, String title, String genre, int duration, String language, String ageRestriction, String director, String description) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.duration = duration;
        this.language = language;
        this.ageRestriction = ageRestriction;
        this.director = director;
        this.description = description;
    }

    public Movie(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getAgeRestriction() {
        return ageRestriction;
    }

    public void setAgeRestriction(String ageRestriction) {
        this.ageRestriction = ageRestriction;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
