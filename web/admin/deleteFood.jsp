<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<html>
<head>
<title>Delete Food</title>
<style>
body{font-family:Segoe UI;background:#f2f2f2}
.card{
    width:600px;
    margin:60px auto;
    background:white;
    padding:25px;
    border-radius:10px;
}
a{color:red;text-decoration:none}
</style>
</head>
<body>

<div class="card">
<h2>Delete Food Items</h2>

<%
Connection con=DBConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM food_items");

while(rs.next()){
%>
<p>
<b><%=rs.getString("food_name")%></b> <%=rs.getDouble("price")%>
<a href="deleteFood.jsp?id=<%=rs.getInt("food_id")%>">Delete</a>
</p>
<%
}

String id=request.getParameter("id");
if(id!=null){
    PreparedStatement ps=con.prepareStatement(
    "DELETE FROM food_items WHERE food_id=?");
    ps.setInt(1,Integer.parseInt(id));
    ps.executeUpdate();
    response.sendRedirect("deleteFood.jsp");
}
%>

</div>
</body>
</html>
