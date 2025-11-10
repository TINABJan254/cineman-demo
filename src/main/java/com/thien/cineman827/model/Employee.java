package com.thien.cineman827.model;

import java.sql.Date;

public class Employee extends Member {
    String position;

    public Employee() {
        super();
    }

    public Employee(String position, String fullName, Date dob, String gender, String address, String email, String phone, String username, String password, String role) {
        super(fullName, dob, gender, address, email, phone, username, password, role);
        this.position = position;
    }

    public Employee(String position, int id, String fullName, Date dob, String gender, String address, String email, String phone, String username, String password, String role, String note) {
        super(id, fullName, dob, gender, address, email, phone, username, password, role, note);
        this.position = position;
    }

    public String getPosition() {
        return this.position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

}
