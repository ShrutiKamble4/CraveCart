<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">

<title>My Orders</title>
<style>
body{font-family:Segoe UI;background:#f2f2f2}
table{
    width:80%;
    margin:50px auto;
    background:white;
    border-collapse:collapse;
}
th,td{
    padding:12px;
    border-bottom:1px solid #ccc;
}
th{background:#ff6f00;color:white}
</style>
</head>
<body>

<table>
<tr>
<th>Food</th><th>Qty</th><th>Total</th><th>Date</th>
</tr>

<%
int uid=(int)session.getAttribute("userId");
Connection con=DBConnection.getConnection();
PreparedStatement ps=con.prepareStatement(
"SELECT f.food_name,o.quantity,o.total_price,o.order_date " +
"FROM orders o JOIN food_items f ON o.food_id=f.food_id WHERE o.user_id=?");
ps.setInt(1,uid);
ResultSet rs=ps.executeQuery();

while(rs.next()){
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getInt(2)%></td>
<td>₹<%=rs.getDouble(3)%></td>
<td><%=rs.getTimestamp(4)%></td>
</tr>
<% } %>
</table>

</body>
</html>
