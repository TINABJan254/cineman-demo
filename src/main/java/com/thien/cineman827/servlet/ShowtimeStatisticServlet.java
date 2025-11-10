package com.thien.cineman827.servlet;

import com.thien.cineman827.dao.ShowtimeDAO;
import com.thien.cineman827.model.Movie;
import com.thien.cineman827.model.MovieStatistic;
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

@WebServlet("/manager/showtimeStat")
public class ShowtimeStatisticServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        int movieId = Integer.parseInt(req.getParameter("id"));
        String startDateStr = req.getParameter("sd");
        String endDateStr = req.getParameter("ed");

        Movie movie = null;
        ArrayList<MovieStatistic> movieStats = (ArrayList<MovieStatistic>) session.getAttribute("movieStats");
        for (MovieStatistic m : movieStats) {
            if (m.getId() == movieId) {
                movie = m;
                break;
            }
        }

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
        ArrayList<Showtime> showtimeStats = showtimeDAO.getShowtimeByMovie(movie, startDate, endDate);

        req.setAttribute("showtimeStats", showtimeStats);
        req.setAttribute("startDate", startDate);
        req.setAttribute("endDate", endDate);
        session.setAttribute("showtimeStats", showtimeStats);

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

        req.getRequestDispatcher("/manager/showtimeStatisticView.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

}
