package com.thien.cineman827.dao;

import com.thien.cineman827.model.Customer;

import java.sql.*;

public class CustomerDAO extends DAO{

    public void addCustomer(Customer c) throws SQLException {
        String sqlMember = "INSERT INTO tblMember (fullName, dob, gender, address, email, phone, username, password, role, note) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlCustomer = "INSERT INTO tblCustomer (customerCode, tblMemberId) VALUES (?, ?)";

        try (
                PreparedStatement psMember = con.prepareStatement(sqlMember, Statement.RETURN_GENERATED_KEYS);
                PreparedStatement psCustomer = con.prepareStatement(sqlCustomer)
        ) {
            psMember.setString(1, c.getFullName());
            psMember.setDate(2, c.getDob());
            psMember.setString(3, c.getGender());
            psMember.setString(4, c.getAddress());
            psMember.setString(5, c.getEmail());
            psMember.setString(6, c.getPhone());
            psMember.setString(7, c.getUsername());
            psMember.setString(8, c.getPassword());
            psMember.setString(9, c.getRole());
            psMember.setString(10, c.getNote());

            psMember.executeUpdate();

            // get auto gen id
            ResultSet rs = psMember.getGeneratedKeys();
            int memberId = -1;
            if (rs.next()) {
                memberId = rs.getInt(1);
            } else {
                throw new SQLException("Can't get auto gen id");
            }

            // gen customer code
            rs =  con.prepareStatement("SELECT MAX(customerCode) FROM tblCustomer").executeQuery();
            String customerCode = "KH001";
            if (rs.next()) {
                String maxCode = rs.getString(1);
                int num = Integer.parseInt(maxCode.substring(2)) + 1;
                customerCode = String.format("KH%03d", num);
            }
            c.setCustomerCode(customerCode);

            psCustomer.setString(1, c.getCustomerCode());
            psCustomer.setInt(2, memberId);

            psCustomer.executeUpdate();

            System.out.println("Add customer success with memberId = " + memberId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CustomerDAO cd = new CustomerDAO();
        // Ngày sinh: 2000-01-01
        Date d = Date.valueOf("2000-01-01");
        Customer customer = new Customer(
                "",                        // customerCode
                "Nuyen van a",             // fullName
                d,                             // dob
                "Nam",                         // gender
                "Ha Noi",                      // address
                "thienw@example.com",           // email
                "22312r3123",                  // phone
                "thien",                       // username
                "123456",                      // password
                "USER"                         // role
        );

        try {
            cd.addCustomer(customer);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Add customer success");
    }

}
