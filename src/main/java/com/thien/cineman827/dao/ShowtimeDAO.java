package com.thien.cineman827.dao;

import com.thien.cineman827.model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class ShowtimeDAO extends DAO {

    public ShowtimeDAO(){
        super();
    }

    public ArrayList<Showtime> getShowtimeByMovie(Movie movie, Date startDate, Date endDate) {
        ArrayList<Showtime> showtimes = new ArrayList<>();
        String sql = """
            SELECT
                st.id,
                st.startTime,
                st.endTime,
                st.basePrice,
                st.description,
                r.id as room_id,
                r.name as room_name,
                COALESCE(SUM(t.finalPrice), 0) AS total_revenue,
                COUNT(t.id) AS sold_tickets
              FROM tblShowtime st
              LEFT JOIN tblTicket t ON t.tblShowtimeid = st.id
              JOIN tblscreeningroom r ON st.tblscreeningroomid = r.id
              WHERE st.tblMovieid = ?  AND st.startTime BETWEEN ? AND ?
              GROUP BY st.id
              ORDER BY st.startTime DESC
        """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(endDate);
            cal.add(Calendar.DATE, 1);
            Timestamp endTs = new Timestamp(cal.getTimeInMillis() - 1);

            ps.setInt(1, movie.getId());
            ps.setTimestamp(2, new java.sql.Timestamp(startDate.getTime()));
            ps.setTimestamp(3, endTs);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id =  rs.getInt("id");
                Date startTime = rs.getTimestamp("startTime");
                Date endTime = rs.getTimestamp("endTime");
                float basePrice = rs.getFloat("basePrice");
                String description = rs.getString("description");
                int roomId = rs.getInt("room_id");
                String roomName = rs.getString("room_name");

                float totalRevenue = rs.getFloat("total_revenue");
                int soldTickets = rs.getInt("sold_tickets");

                Showtime st = new Showtime(id, startTime, endTime, basePrice, description, totalRevenue, soldTickets,new ScreeningRoom(roomId, roomName), movie);
                showtimes.add(st);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return showtimes;
    }

    ArrayList<Ticket> getTicketByShowtime(Showtime showtime) {
        ArrayList<Ticket> tickets = new ArrayList<>();
        String sql = """
            SELECT * FROM tblTicket t WHERE t.tblShowtimeid = ?
        """;
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, showtime.getId());

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                float finalPrice = rs.getFloat("finalPrice");
                String description = rs.getString("description");



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tickets;
    }

    public static void main(String[] args) {
        try {
            ShowtimeDAO dao = new ShowtimeDAO();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            Date startDate = sdf.parse("2025-01-01");
            Date endDate = sdf.parse("2025-12-31");

            Movie movie = new Movie();
            movie.setId(3);

            ArrayList<Showtime> res = dao.getShowtimeByMovie(movie, startDate, endDate);
            for (Showtime ms : res) {
                System.out.println(ms.getId());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
