package com.thien.cineman827.model;

import java.sql.Date;

public class Customer extends Member {
    String customerCode;

    public Customer() {
        super();
    }

    public Customer(String customerCode, String fullName, Date dob, String gender, String address, String email, String phone, String username, String password, String role) {
        super(fullName, dob, gender, address, email, phone, username, password, role);
        this.customerCode = customerCode;
    }

    public Customer(String customerCode, int id, String fullName, Date dob, String gender, String address, String email, String phone, String username, String password, String role, String note) {
        super(id, fullName, dob, gender, address, email, phone, username, password, role, note);
        this.customerCode = customerCode;
    }

    public String getCustomerCode() {
        return customerCode;
    }
    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }
}
