package com.thien.cineman827.dao;

import com.thien.cineman827.model.MovieStatistic;
import jakarta.servlet.http.HttpServlet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.ArrayList;
import java.io.*;

public class MovieStatisticDAO extends DAO {
    public MovieStatisticDAO() {
        super();
    }

    public ArrayList<MovieStatistic> getMovieStat(Date startDate, Date endDate){
        ArrayList<MovieStatistic> list = new ArrayList<>();
        String sql = """
            SELECT 
                m.id, 
                m.title, 
                m.genre,
                m.duration,
                m.language,
                m.ageRestriction,
                m.director,
                m.description,
                SUM(t.finalPrice) AS total_revenue,
                COUNT(t.id) AS sold_tickets
            FROM tblMovie m
            JOIN tblShowtime st ON st.tblMovieid = m.id
            JOIN tblTicket t ON t.tblShowtimeid = st.id
            WHERE st.startTime BETWEEN ? AND ?
            GROUP BY m.id
            ORDER BY total_revenue DESC
        """;

//        with discount SUM(t.finalPrice * (1 - COALESCE(b.discountPercent, 0) / 100)) AS total_revenue,

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(endDate);
            cal.add(Calendar.DATE, 1);
            Timestamp endTs = new Timestamp(cal.getTimeInMillis() - 1);

            ps.setTimestamp(1, new java.sql.Timestamp(startDate.getTime()));
            ps.setTimestamp(2, endTs);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id =  rs.getInt("id");
                String title = rs.getString("title");
                String genre = rs.getString("genre");
                int duration = rs.getInt("duration");
                String language = rs.getString("language");
                String ageRestriction = rs.getString("ageRestriction");
                String director = rs.getString("director");
                String description = rs.getString("description");
                float totalRevenue = rs.getFloat("total_revenue");
                int soldTickets = rs.getInt("sold_tickets");

                MovieStatistic ms = new MovieStatistic(totalRevenue, soldTickets, id, title, genre, duration, language, ageRestriction, director, description);
                list.add(ms);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    };

    public static void main(String[] args) {
        try {
            MovieStatisticDAO dao = new MovieStatisticDAO();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            Date startDate = sdf.parse("2025-01-01");
            Date endDate = sdf.parse("2025-12-31");

            ArrayList<MovieStatistic> res = dao.getMovieStat(startDate, endDate);
            for (MovieStatistic ms : res) {
                System.out.println(ms.getTitle() + " " + ms.getTotalRevenue());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
