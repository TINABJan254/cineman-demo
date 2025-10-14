package com.thien.cineman827.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DAO {
    protected Connection con;

    public DAO() {
        try {
            Properties props = new Properties();
            InputStream input = getClass().getClassLoader().getResourceAsStream("config.properties");
            if (input == null) {
                throw new RuntimeException("Config.properties file not found");
            }
            props.load(input);

            // read config.properties
            String host = props.getProperty("db.host");
            String port = props.getProperty("db.port");
            String dbname = props.getProperty("db.dbname");
            String username = props.getProperty("db.username");
            String password = props.getProperty("db.password");
            String driver = props.getProperty("db.driver");

            //jdbc:mysql://host:port/dbname
            String url = String.format("jdbc:mysql://%s:%s/%s", host, port, dbname);

            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Connect to db success");

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Fail to connect to db: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
    }

}
