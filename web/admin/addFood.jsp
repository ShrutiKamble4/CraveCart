<%@ page import="java.sql.*" %>
<%@ page import="com.cravecart.db.DBConnection" %>

<html>
<head>
<title>Add Food</title>
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
}
</style>
</head>
<body>

<div class="card">
<h2>Add Food Item</h2>

<form method="post">
<input type="text" name="name" placeholder="Food Name" required>
<input type="text" name="category" placeholder="Category">
<input type="number" name="price" placeholder="Price" required>
<button>Add Food</button>
</form>

<%
String n=request.getParameter("name");
String c=request.getParameter("category");
String p=request.getParameter("price");

if(n!=null){
    Connection con=DBConnection.getConnection();
    PreparedStatement ps=con.prepareStatement(
    "INSERT INTO food_items(food_name,category,price) VALUES(?,?,?)");
    ps.setString(1,n);
    ps.setString(2,c);
    ps.setDouble(3,Double.parseDouble(p));
    ps.executeUpdate();
    out.println("<p style='color:green'>Food Added Successfully</p>");
}
%>

</div>
</body>
</html>
