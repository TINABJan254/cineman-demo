package com.thien.cineman827.model;

import java.util.List;

public class ScreeningRoom {
    private int id;
    private String name;
    private int totalSeats;
    private String type;
    private String description;
    private List<Seat> listSeats;

    public ScreeningRoom(){}

    public ScreeningRoom(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public ScreeningRoom(int id, String name, int totalSeats, String type, String description) {
        this.id = id;
        this.name = name;
        this.totalSeats = totalSeats;
        this.type = type;
        this.description = description;
    }

    public int getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }

    public List<Seat> getListSeats() {
        return this.listSeats;
    }

    public void setListSeats(List<Seat> listSeats) {
        this.listSeats = listSeats;
    }
}
