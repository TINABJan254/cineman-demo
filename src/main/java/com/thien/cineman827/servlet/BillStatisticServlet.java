package com.thien.cineman827.servlet;

import com.thien.cineman827.dao.BillDAO;
import com.thien.cineman827.dao.ShowtimeDAO;
import com.thien.cineman827.model.Bill;
import com.thien.cineman827.model.Movie;
import com.thien.cineman827.model.Showtime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/manager/billStat")
public class BillStatisticServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        int showtimeId =  Integer.parseInt(req.getParameter("id"));
        ArrayList<Showtime> showtimes = (ArrayList<Showtime>)session.getAttribute("showtimeStats");
        Showtime showtime = null;
        for (Showtime st : showtimes) {
            if (st.getId() == showtimeId) {
                showtime = st;
            }
        }

        BillDAO billDAO = new BillDAO();
        ArrayList<Bill> billStats = billDAO.getBillByShowtime(showtime);

        int totalTickets = 0;
        float revenueShowtime = 0;
        for (Bill bill : billStats) {
            totalTickets += bill.getTotalTickets();
            revenueShowtime += bill.getTotalPrice();
        }

        req.setAttribute("showtime", showtime);
        req.setAttribute("billStats", billStats);
        req.setAttribute("totalTickets", totalTickets);
        req.setAttribute("revenueShowtime", revenueShowtime);

        req.getRequestDispatcher("/manager/billStatisticView.jsp").forward(req, resp);
    }
}
