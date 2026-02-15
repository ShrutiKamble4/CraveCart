<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<html>
<head>
<title>Register</title>
<style>
body{font-family:Segoe UI;background:#f2f2f2}
.card{
    width:400px;
    margin:80px auto;
    background:white;
    padding:25px;
    border-radius:10px;
}
input,button{
    width:100%;
    padding:10px;
    margin:8px 0;
}
button{
    background:#ff6f00;
    color:white;
    border:none;
    border-radius:5px;
}
button:hover{background:#e65100;}
.msg{
    color:red;
    margin-top:10px;
}
</style>
</head>
<body>

<div class="card">
<h2>User Registration</h2>

<form method="post">
<input type="text" name="name" placeholder="Full Name" required>
<input type="email" name="email" placeholder="Email" required>
<input type="password" name="password" placeholder="Password" required>
<input type="text" name="phone" placeholder="Phone">
<button type="submit">Register</button>
</form>

<%
String message = "";

if("POST".equalsIgnoreCase(request.getMethod())){

    String n = request.getParameter("name");
    String e = request.getParameter("email");
    String p = request.getParameter("password");
    String ph = request.getParameter("phone");

    Connection con = null;
    PreparedStatement ps = null;

    try{
        con = DBConnection.getConnection();

        if(con == null){
            message = "Database connection failed. Check Railway variables.";
        } else {

            ps = con.prepareStatement(
            "INSERT INTO users(name,email,password,phone) VALUES(?,?,?,?)");

            ps.setString(1,n);
            ps.setString(2,e);
            ps.setString(3,p);
            ps.setString(4,ph);

            ps.executeUpdate();

            response.sendRedirect("login.jsp");
        }

    } catch(Exception ex){
        ex.printStackTrace();
        message = "Registration failed: " + ex.getMessage();
    } finally {
        try{
            if(ps!=null) ps.close();
            if(con!=null) con.close();
        } catch(Exception e1){
            e1.printStackTrace();
        }
    }
}
%>

<% if(!message.equals("")){ %>
    <div class="msg"><%= message %></div>
<% } %>

</div>

</body>
</html>
