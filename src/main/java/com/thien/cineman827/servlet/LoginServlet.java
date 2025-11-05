package com.thien.cineman827.servlet;

import com.thien.cineman827.model.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/member/loginView.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username =  request.getParameter("username");
        String password = request.getParameter("password");

        Member member = new Member();
        member.setRole("MANAGER");
        if (member != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", member);

            if (member.getRole().equals("MANAGER")) {
                response.sendRedirect(request.getContextPath() + "/employee/managerHomeView.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login?error=true");
        }

    }
}
