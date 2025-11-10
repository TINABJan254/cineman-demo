package com.thien.cineman827.model;

import java.util.ArrayList;
import java.util.Date;

public class Bill {
    private int id;
    private float totalPrice;
    private Date createdAt;
    private String type;
    private String note;
    private ArrayList<Ticket> listTickets;
    private Employee employee;
    private Customer customer;

    public Bill() {
    }

    public Bill(int id, float totalPrice, Date createdAt, String type, String note,
                ArrayList<Ticket> listTickets, Employee employee, Customer customer) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
        this.type = type;
        this.note = note;
        this.listTickets = listTickets;
        this.employee = employee;
        this.customer = customer;
    }

    public Bill(int id, float totalPrice, Date createdAt, String type, String note) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
        this.type = type;
        this.note = note;
    }

    public int getTotalTickets() {
        return listTickets.size();
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

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public ArrayList<Ticket> getListTickets() {
        return listTickets;
    }

    public void setListTickets(ArrayList<Ticket> listTickets) {
        this.listTickets = listTickets;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
