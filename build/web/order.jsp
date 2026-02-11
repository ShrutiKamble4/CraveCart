<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<%
int userId=(int)session.getAttribute("userId");
int foodId=Integer.parseInt(request.getParameter("food_id"));
int qty=Integer.parseInt(request.getParameter("qty"));

Connection con=DBConnection.getConnection();

PreparedStatement ps1=con.prepareStatement(
"SELECT price FROM food_items WHERE food_id=?");
ps1.setInt(1,foodId);
ResultSet rs=ps1.executeQuery();
rs.next();

double total=rs.getDouble(1)*qty;

PreparedStatement ps2=con.prepareStatement(
"INSERT INTO orders(user_id,food_id,quantity,total_price) VALUES(?,?,?,?)");
ps2.setInt(1,userId);
ps2.setInt(2,foodId);
ps2.setInt(3,qty);
ps2.setDouble(4,total);
ps2.executeUpdate();

response.sendRedirect("myorders.jsp");
%>
