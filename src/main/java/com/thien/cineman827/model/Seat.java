package com.thien.cineman827.model;


import java.util.List;

public class Seat {
    private int id;
    private String name;
    private String type;
    private float extraPrice;
    private String description;

    public Seat() {}

    public Seat(int id, String name, String type, float extraPrice, String description) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.extraPrice = extraPrice;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

}
