package com.thien.cineman827.model;

import java.util.Date;


public class Showtime {
    private int id;
    private Date startTime;
    private Date endTime;
    private float basePrice;
    private String description;
    private float totalRevenue;
    private int soldTickets;
    private ScreeningRoom screeningRoom;
    private Movie movie;

    public Showtime() {}

    public Showtime(int id, Date startTime, Date endTime, float basePrice, String description, float totalRevenue, int soldTickets, ScreeningRoom screeningRoom, Movie movie) {
        this.id = id;
        this.startTime = startTime;
        this.endTime = endTime;
        this.basePrice = basePrice;
        this.description = description;
        this.totalRevenue = totalRevenue;
        this.soldTickets = soldTickets;
        this.screeningRoom = screeningRoom;
        this.movie = movie;
    }

    public Showtime(int id, Date startTime, Date endTime, float basePrice, String description) {
        this.id = id;
        this.startTime = startTime;
        this.endTime = endTime;
        this.basePrice = basePrice;
        this.description = description;
    }

    public ScreeningRoom getScreeningRoom() {
        return this.screeningRoom;
    }

    public void setScreeningRoom(ScreeningRoom screeningRoom) {
        this.screeningRoom = screeningRoom;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStartTime() {
        return this.startTime;
    }

    public Date getEndTime() {
        return this.endTime;
    }

    public float getTotalRevenue() {
        return this.totalRevenue;
    }

    public int getSoldTickets() {
        return this.soldTickets;
    }

    public void setTotalRevenue(float totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public void setSoldTickets(int soldTickets) {
        this.soldTickets = soldTickets;
    }

    public Movie getMovie() {
        return this.movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

}
