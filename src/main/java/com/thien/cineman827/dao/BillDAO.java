package com.thien.cineman827.dao;

import com.thien.cineman827.model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class BillDAO extends DAO{

    public BillDAO(){
        super();
    }

    public ArrayList<Bill> getBillByShowtime(Showtime showtime){
        ArrayList<Bill> bills = new ArrayList<>();
        String sql = """
            SELECT b.id, b.createdAt, b.type, b.note, b.totalPrice, b.tblEmployeeId, b.tblCustomerId
            FROM tblBill b
            WHERE EXISTS (
                SELECT 1 FROM tblTicket tk
                WHERE tk.tblBillId = b.id AND tk.tblShowtimeid = ?
            )
            ORDER BY b.createdAt DESC;        
        """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, showtime.getId());

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int billId = rs.getInt("id");
                Date createAt = rs.getTimestamp("createdAt");
                float totalPrice = rs.getFloat("totalPrice");
                String type = rs.getString("type");
                String note = rs.getString("note");
                int customerId = rs.getInt("tblCustomerId");
                int employeeId = rs.getInt("tblEmployeeId");

                // lay list ticket
                String sql1 = """
                    SELECT DISTINCT tk.id, tk.finalPrice, tk.description,
                           s.id AS seatId, s.name AS seatName, s.type AS seatType, s.extraPrice AS extraPrice, s.description AS seatDescription
                    FROM tblTicket tk
                    JOIN tblSeat s ON tk.tblSeatid = s.id
                    WHERE tk.tblBillid = ?
                """;

                ArrayList<Ticket> tickets = new ArrayList<>();
                try (PreparedStatement ps2 = con.prepareStatement(sql1)) {
                    ps2.setInt(1, billId);

                    ResultSet rs2 = ps2.executeQuery();
                    while (rs2.next()) {
                        int ticketId = rs2.getInt("id");
                        float finalPrice = rs2.getFloat("finalPrice");
                        String tkDescription = rs2.getString("description");
                        int seatId = rs2.getInt("seatId");
                        String seatName = rs2.getString("seatName");
                        String seatType = rs2.getString("seatType");
                        float  extraPrice = rs2.getFloat("extraPrice");
                        String seatDescription = rs2.getString("seatDescription");

                        Seat seat = new Seat(seatId, seatName, seatType, extraPrice, seatDescription);
                        Ticket tk = new Ticket(ticketId, tkDescription, seat, showtime, finalPrice);
                        tickets.add(tk);
                    }
                }

                //Lay customer
                String sql2 = """
                    SELECT DISTINCT c.customerCode, m.fullName, m.id
                    FROM tblCustomer c 
                    JOIN tblMember m ON c.tblMemberId = m.id
                    WHERE m.id = ?
                """;

                Customer customer = new Customer();
                try (PreparedStatement ps3 = con.prepareStatement(sql2)) {
                    ps3.setInt(1, customerId);
                    ResultSet rs3 = ps3.executeQuery();
                    if (rs3.next()) {
                        int id = rs3.getInt("id");
                        String customerCode = rs3.getString("customerCode");
                        String customerName = rs3.getString("fullName");

                        customer.setCustomerCode(customerCode);
                        customer.setId(id);
                        customer.setFullName(customerName);
                    }
                }

                //Lay employee
                String sql3 = """
                    SELECT DISTINCT e.position, m.fullName, m.id
                    FROM tblEmployee e
                    JOIN tblMember m ON e.tblMemberId = m.id
                    WHERE m.id = ?
                """;
                Employee employee = new Employee();
                try (PreparedStatement ps4 = con.prepareStatement(sql3)) {
                    ps4.setInt(1, employeeId);
                    ResultSet rs4 = ps4.executeQuery();
                    if (rs4.next()) {
                        int id = rs4.getInt("id");
                        String position = rs4.getString("position");
                        String fullName = rs4.getString("fullName");
                        employee.setId(id);
                        employee.setFullName(fullName);
                        employee.setPosition(position);
                    }
                }

                Bill bill = new Bill(billId, totalPrice, createAt, type, note, tickets, employee, customer);
                bills.add(bill);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }

        return bills;
    }
}
