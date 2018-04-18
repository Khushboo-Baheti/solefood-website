<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Sole Food</title>

	<!-- Google Fonts -->
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
		<%
	    if ((session.getAttribute("customerid") == null) || (session.getAttribute("customerid") == "")) {
		%>
		<form method="post" action="login">
			<div class="login-box animated fadeInUp">
				<div class="box-header">
					<h2>Log In</h2>
				</div>
				<label>Username</label>
				<br/>
				<input type="text" name="email">
				<br/>
				<label>Password</label>
				<br/>
				<input type="password" name="password">
				<br/>
				<button type="submit">Sign In</button>
				<button type="reset">Reset</button>				
				<br/>
				<a href="register.jsp"><p class="small">Not Registered?</p></a>
			</div>
		</form>
		<%} else {
		%>
		<%

    response.sendRedirect("shop.jsp");
%>
		<%-- <h1 style="text-align:center;">
		Welcome <%=session.getAttribute("customername")%>
		<u><a href="logout.jsp">Log out</a></u>
		</h1> --%>
		<%
		}
		%>
	</div>
</body>

</html>