package com.thien.cineman827.dao;

import com.thien.cineman827.model.Customer;
import com.thien.cineman827.model.Employee;
import com.thien.cineman827.model.Member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class MemberDAO extends DAO{

    public MemberDAO() {
        super();
    }

    public Member checkLogin(Member member) {
        String sql = "SELECT * FROM tblMember WHERE tblMember.username = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, member.getUsername());
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getString("password").equals(member.getPassword())) {
                int id = rs.getInt("id");
                String fullName = rs.getString("fullName");
                Date dob = rs.getDate("dob");
                String gender = rs.getString("gender");
                String adddress = rs.getString("address");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String username = rs.getString("username");
                String password = "";
                String role = rs.getString("role");
                String note = rs.getString("note");

                if (role.equals("CUSTOMER")) {
                    String sql1 = "SELECT * FROM tblCustomer WHERE tblCustomer.tblMemberId = ?";
                    try (PreparedStatement ps1 = con.prepareStatement(sql1)) {
                        ps1.setInt(1, id);
                        ResultSet rs1 = ps1.executeQuery();

                        if (rs1.next()) {
                            Customer cus = new Customer(rs1.getString("customerCode"), id, fullName, dob,
                                    gender, adddress, email, phone, username, "", role, note);

                            return cus;
                        }
                    }
                } else {
                    String sql1 = "SELECT * FROM tblEmployee WHERE tblEmployee.tblMemberId = ?";
                    try (PreparedStatement ps1 = con.prepareStatement(sql1)) {
                        ps1.setInt(1, id);
                        ResultSet rs1 = ps1.executeQuery();

                        if (rs1.next()) {
                            Employee e = new Employee(rs1.getString("position"), id, fullName, dob,
                                    gender, adddress, email, phone, username, "", role, note);

                            return e;
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
