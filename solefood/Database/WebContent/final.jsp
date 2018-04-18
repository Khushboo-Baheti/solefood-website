<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
 	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
<div class="container">
		<div class="top">
			<h1 id="title" class="hidden">Sole Food</h1>
		</div>
<jsp:useBean id="purchasebean" class="com.db.bean.PurchaseBean" scope="page"></jsp:useBean>
<%
int customer_id=(Integer)session.getAttribute("customerid");
String address = request.getParameter("address");
purchasebean.updateaddress(address,customer_id);%>
<div align="center">
<h1 align="center">Thank you for ordering!!</h1>

<h3><u><a href="logout.jsp">Log out</a></u></h3>

<h3><u><a href="shop.jsp">Go To Home</a></u></h3>
</div>
</div>
</body>
</html>