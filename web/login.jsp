<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<html>
<head>
<title>Login</title>
<style>
body{background:#f2f2f2;font-family:Segoe UI}
.box{
    width:350px;
    margin:120px auto;
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
}
</style>
</head>
<body>

<div class="box">
<h2>User Login</h2>

<form method="post">
<input type="email" name="email" placeholder="Email" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Login</button>
</form>

<%
String e=request.getParameter("email");
String p=request.getParameter("password");

if(e!=null){
    Connection con=DBConnection.getConnection();
    PreparedStatement ps=con.prepareStatement(
    "SELECT * FROM users WHERE email=? AND password=?");
    ps.setString(1,e);
    ps.setString(2,p);
    ResultSet rs=ps.executeQuery();

    if(rs.next()){
        session.setAttribute("userId",rs.getInt("user_id"));
        session.setAttribute("userName",rs.getString("name"));
        response.sendRedirect("menu.jsp");
    }else{
        out.println("<p style='color:red'>Invalid Login</p>");
    }
}
%>

</div>
</body>
</html>
