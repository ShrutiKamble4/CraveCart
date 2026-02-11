<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<html>
<head>
<title>View Orders</title>
<style>
body{font-family:Segoe UI;background:#f2f2f2}
table{
    width:90%;
    margin:50px auto;
    background:white;
    border-collapse:collapse;
}
th,td{
    padding:12px;
    border-bottom:1px solid #ccc;
}
th{
    background:#232526;
    color:white;
}
</style>
</head>
<body>

<table>
<tr>
<th>Order ID</th>
<th>User</th>
<th>Food</th>
<th>Qty</th>
<th>Total</th>
<th>Date</th>
</tr>

<%
Connection con=DBConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(
"SELECT o.order_id,u.name,f.food_name,o.quantity,o.total_price,o.order_date " +
"FROM orders o JOIN users u ON o.user_id=u.user_id " +
"JOIN food_items f ON o.food_id=f.food_id");

while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getInt(4)%></td>
<td>?<%=rs.getDouble(5)%></td>
<td><%=rs.getTimestamp(6)%></td>
</tr>
<% } %>

</table>

</body>
</html>
