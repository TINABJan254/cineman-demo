package com.thien.cineman827.servlet;

import com.thien.cineman827.dao.MovieStatisticDAO;
import com.thien.cineman827.dao.ShowtimeDAO;
import com.thien.cineman827.model.Movie;
import com.thien.cineman827.model.Showtime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/employee/showtimeStat")
public class ShowtimeStatisticServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int movieId = Integer.parseInt(req.getParameter("id"));
        String startDateStr = req.getParameter("sd");
        String endDateStr = req.getParameter("ed");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        try {
            startDate = sdf.parse(startDateStr);
            endDate = sdf.parse(endDateStr);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        ShowtimeDAO showtimeDAO = new ShowtimeDAO();
        ArrayList<Showtime> showtimeStats = showtimeDAO.getShowtimeByMovie(new Movie(movieId), startDate, endDate);

        req.setAttribute("showtimeStats", showtimeStats);
        req.setAttribute("startDate", startDate);
        req.setAttribute("endDate", endDate);

        // tính tổng doanh thu, tổng vé bán ra của tất cả các showtime
        float revenueMovie = 0;
        int totalTickets = 0;
        for (Showtime sts : showtimeStats){
            revenueMovie += sts.getTotalRevenue();
            totalTickets += sts.getSoldTickets();

            System.out.println(sts.getId());

        }
        req.setAttribute("revenueMovie", revenueMovie);
        req.setAttribute("totalTickets", totalTickets);

        req.getRequestDispatcher("/employee/showtimeStatisticView.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

}
