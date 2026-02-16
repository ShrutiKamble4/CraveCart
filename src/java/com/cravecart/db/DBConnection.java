package com.cravecart.db;

import java.sql.*;
import java.net.URI;

public class DBConnection {

    public static Connection getConnection() {
        try {

            String rawUrl = System.getenv("MYSQL_URL");

            if (rawUrl == null) {
                System.out.println("MYSQL_URL is NULL");
                return null;
            }

            URI uri = new URI(rawUrl);

            String username = uri.getUserInfo().split(":")[0];
            String password = uri.getUserInfo().split(":")[1];

            String host = uri.getHost();
            int port = uri.getPort();
            String database = uri.getPath().replaceFirst("/", "");

            String jdbcUrl = "jdbc:mysql://" + host + ":" + port + "/" + database
                    + "?useSSL=false&allowPublicKeyRetrieval=true";

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(jdbcUrl, username, password);

        } catch (Exception e) {
            System.out.println("Database Connection Failed!");
            e.printStackTrace();
            return null;
        }
    }
}
