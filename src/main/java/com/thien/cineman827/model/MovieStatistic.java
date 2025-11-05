package com.thien.cineman827.model;

public class MovieStatistic extends Movie {

    private float totalRevenue;
    private int soldTickets;

    public MovieStatistic(){}

    public MovieStatistic(float totalRevenue, int soldTickets, int id, String title, String genre, int duration, String language, String ageRestriction, String director, String description) {
        super(id, title, genre, duration, language, ageRestriction, director, description);
        this.totalRevenue = totalRevenue;
        this.soldTickets = soldTickets;
    }

    public MovieStatistic(int id, String title, String genre, int duration, String language, String ageRestriction, String director, String description) {
        super(id, title, genre, duration, language, ageRestriction, director, description);
    }

    public float getTotalRevenue() {
        return this.totalRevenue;
    }

    public void setTotalRevenue(float totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public int getSoldTickets() {
        return this.soldTickets;
    }

    public void setSoldTickets(int soldTickets) {
        this.soldTickets = soldTickets;
    }

}
