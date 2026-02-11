<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<html>
<head>
<title>Admin Login</title>
<style>
body{
    font-family:Segoe UI;
    background:linear-gradient(to right,#232526,#414345);
}
.card{
    width:350px;
    margin:120px auto;
    background:white;
    padding:25px;
    border-radius:10px;
    text-align:center;
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
</style>
</head>
<body>

<div class="card">
<h2>Admin Login</h2>

<form method="post">
<input type="text" name="username" placeholder="Username" required>
<input type="password" name="password" placeholder="Password" required>
<button>Login</button>
</form>

<%
String u=request.getParameter("username");
String p=request.getParameter("password");

if(u!=null){
    Connection con=DBConnection.getConnection();
    PreparedStatement ps=con.prepareStatement(
    "SELECT * FROM admin WHERE username=? AND password=?");
    ps.setString(1,u);
    ps.setString(2,p);
    ResultSet rs=ps.executeQuery();

    if(rs.next()){
        session.setAttribute("admin",u);
        response.sendRedirect("adminDashboard.jsp");
    }else{
        out.println("<p style='color:red'>Invalid Login</p>");
    }
}
%>

</div>
</body>
</html>
