package com.thien.cineman827.model;

public class Ticket {
    private int id;
    private String description;
    private Seat seat;
    private Showtime showtime;
    private float finalPrice;

    public Ticket() {
    }

    public Ticket(int id, String description, Seat seat, Showtime showtime, float finalPrice) {
        this.id = id;
        this.description = description;
        this.seat = seat;
        this.showtime = showtime;
        this.finalPrice = finalPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
