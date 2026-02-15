package com.cravecart.db;

import java.sql.*;
import java.net.URI;

public class DBConnection {

    public static Connection getConnection() {
        try {

            String mysqlUrl = System.getenv("MYSQL_URL");

            if (mysqlUrl == null) {
                System.out.println("MYSQL_URL is NULL");
                return null;
            }

            URI uri = new URI(mysqlUrl);

            String userInfo = uri.getUserInfo();
            String username = userInfo.split(":")[0];
            String password = userInfo.split(":")[1];

            String jdbcUrl = "jdbc:mysql://" + uri.getHost() + ":" + uri.getPort() + uri.getPath() +
                    "?useSSL=false&allowPublicKeyRetrieval=true";

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(jdbcUrl, username, password);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
