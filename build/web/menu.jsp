<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<%
if(session.getAttribute("userId")==null){
    response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>Menu</title>
<style>
body{font-family:Segoe UI;background:#fafafa}
.header{
    background:#ff6f00;
    color:white;
    padding:15px;
}
.card{
    background:white;
    margin:20px;
    padding:15px;
    border-radius:8px;
    display:inline-block;
    width:250px;
}
button{
    background:#ff6f00;
    color:white;
    border:none;
    padding:8px;
    width:100%;
}
</style>
</head>
<body>

<div class="header">
Welcome, <%=session.getAttribute("userName")%>
 | <a href="myorders.jsp" style="color:white">My Orders</a>
 | <a href="logout.jsp" style="color:white">Logout</a>
</div>

<%
Connection con=DBConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM food_items");

while(rs.next()){
%>
<div class="card">
<h3><%=rs.getString("food_name")%></h3>
<p> <%= rs.getDouble("price") %>
</p>
<form action="order.jsp" method="post">
<input type="hidden" name="food_id" value="<%=rs.getInt("food_id")%>">
<input type="number" name="qty" value="1" min="1">
<button>Order</button>
</form>
</div>
<% } %>

</body>
</html>
