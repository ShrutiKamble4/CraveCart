package com.cravecart.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get Railway MySQL full URL
            String url = System.getenv("MYSQL_URL");

            if (url == null) {
                System.out.println("MYSQL_URL is NULL. Check Railway variables.");
                return null;
            }

            // Connect using Railway provided URL
            con = DriverManager.getConnection(url);

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {
            System.out.println("Database Connection Failed!");
            e.printStackTrace();
        }

        return con;
    }
}
