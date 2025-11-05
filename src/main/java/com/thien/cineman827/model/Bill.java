package com.thien.cineman827.model;

import java.util.List;
import java.util.Date;

public class Bill {
    private int id;
    private float totalPrice;
    private Date createdAt;
    private String type;
    private String note;
    private Ticket[] listTickets;
    private Employee employee;
    private Customer customer;

    public Bill() {
    }

    public Bill(int id, float totalPrice, Date createdAt, String type, String note,
                Ticket[] listTickets, Employee employee, Customer customer) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
        this.type = type;
        this.note = note;
        this.listTickets = listTickets;
        this.employee = employee;
        this.customer = customer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
}
