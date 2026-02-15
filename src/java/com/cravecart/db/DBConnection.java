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

        // Remove mysql://
        rawUrl = rawUrl.replace("mysql://", "");

        String[] parts = rawUrl.split("@");
        String[] userPass = parts[0].split(":");
        String[] hostDb = parts[1].split("/");

        String username = userPass[0];
        String password = userPass[1];
        String hostPort = hostDb[0];
        String database = hostDb[1];

        String jdbcUrl = "jdbc:mysql://" + hostPort + "/" + database +
                "?useSSL=false&allowPublicKeyRetrieval=true";

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(jdbcUrl, username, password);

    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}

}
