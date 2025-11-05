package com.thien.cineman827.servlet;

import com.thien.cineman827.dao.CustomerDAO;
import com.thien.cineman827.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role  = request.getParameter("role");

        System.out.println(fullName + " " + dob + " " + gender + " " + address + " " + email + " " + phone);

        Customer customer = new Customer("",  fullName, dob, gender, address, email, phone, username, password, role);

        CustomerDAO customerDAO = new CustomerDAO();
        try {
            customerDAO.addCustomer(customer);
        } catch (SQLException e){
            e.printStackTrace();
        }

        response.sendRedirect("/member/homeView.jsp");

    }
}
