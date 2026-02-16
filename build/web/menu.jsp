<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<%
if(session.getAttribute("userId")==null){
    response.sendRedirect("login.jsp");
    return;
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
    box-shadow:0 2px 5px rgba(0,0,0,0.1);
}
button{
    background:#ff6f00;
    color:white;
    border:none;
    padding:8px;
    width:100%;
    cursor:pointer;
}
button:hover{
    background:#e65100;
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
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    con = DBConnection.getConnection();

    if(con == null){
        out.println("<h2>Database connection failed!</h2>");
        return;
    }

    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM food_items");

    while(rs.next()){
%>

<div class="card">
<h3><%=rs.getString("food_name")%></h3>
<p>? <%= rs.getDouble("price") %></p>

<form action="order.jsp" method="post">
<input type="hidden" name="food_id" value="<%=rs.getInt("food_id")%>">
<input type="number" name="qty" value="1" min="1">
<button type="submit">Order</button>
</form>
</div>

<%
    }

} catch(Exception e){
    out.println("<h3>Error loading menu.</h3>");
    e.printStackTrace(new java.io.PrintWriter(out));

} finally {

    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(st != null) st.close(); } catch(Exception e){}
    try { if(con != null) con.close(); } catch(Exception e){}
}
%>

</body>
</html>
