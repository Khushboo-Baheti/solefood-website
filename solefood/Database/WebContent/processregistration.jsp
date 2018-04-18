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

	<jsp:useBean id="registeruser" class="com.db.bean.Registration" scope="page">
		<jsp:setProperty name="registeruser" property="*"/>
	</jsp:useBean>

	<h1 style="text-align:center;">
	
		<%  
		boolean status = registeruser.register();
		if(status) {
		out.print("You are successfully registered");
		%>
		<a href="index.jsp">Login Here</a>
		<%
		} else {
		out.print("An error occurred during registration");
		%>
		<u><a href="index.jsp">Try again</a></u>
		<%
		}
		%> 
	</h1>
	</div>

</body>
</html>