package com.thien.cineman827.servlet;

import com.thien.cineman827.dao.MovieStatisticDAO;
import com.thien.cineman827.model.MovieStatistic;
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

@WebServlet("/employee/movieStat")
public class MovieStatisticServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        try {
            startDate = sdf.parse(startDateStr);
            endDate = sdf.parse(endDateStr);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        MovieStatisticDAO md = new MovieStatisticDAO();
        MovieStatisticDAO movieStatisticDAO = new MovieStatisticDAO();
        ArrayList<MovieStatistic> res = movieStatisticDAO.getMovieStat(startDate, endDate);

        req.setAttribute("movieStats", res);
        req.setAttribute("startDate", startDateStr);
        req.setAttribute("endDate", endDateStr);

        int totalTickets = 0;
        float totalRevenue = 0;
        for (MovieStatistic movieStatic : res) {
            totalTickets += movieStatic.getSoldTickets();
            totalRevenue += movieStatic.getTotalRevenue();

        }

        req.setAttribute("totalTickets", totalTickets);
        req.setAttribute("totalRevenue", totalRevenue);

        req.getRequestDispatcher("/employee/movieStatisticView.jsp").forward(req, resp);

    }
}
