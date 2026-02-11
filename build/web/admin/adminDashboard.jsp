<%
if(session.getAttribute("admin")==null){
    response.sendRedirect("adminLogin.jsp");
}
%>

<html>
<head>
<title>Admin Dashboard</title>
<style>
body{
    font-family:Segoe UI;
    background:#f2f2f2;
}
.box{
    width:500px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    text-align:center;
}
a{
    display:block;
    margin:15px;
    padding:12px;
    background:#232526;
    color:white;
    text-decoration:none;
    border-radius:6px;
}
a:hover{background:#ff6f00;}
</style>
</head>
<body>

<div class="box">
<h2>Welcome Admin</h2>

<a href="addFood.jsp">Add Food Item</a>
<a href="deleteFood.jsp">Delete Food Item</a>
<a href="viewOrders.jsp">View Orders</a>
<a href="../logout.jsp">Logout</a>
</div>

</body>
</html>
