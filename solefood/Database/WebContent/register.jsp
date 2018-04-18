<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <link href="css/dbstyle.css" rel="stylesheet" type="text/css">
    <body>
    <div class="bg" align="center">
        <form method="POST" action="processregistration.jsp">
         
            <table border="1"  cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="firstName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lastName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="phone" value="" /></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" value="" /></td>
                    </tr>
                    </table>
                    <h1></h1>
                        <input type="submit" value="Submit" class="stylesub"  />
                    <h3></h3>
                        Already registered? <a href="index.jsp">Login Here</a>
            
        </form>
        </div>
    </body>
</html> --%>


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
		<form method="POST" action="processregistration.jsp">
			<div class="login-box animated fadeInUp" style="max-width:450px;">
				<div class="box-header">
					<h2>Register</h2>
				</div>
				<table style="width:100%;">
				<tr>
					<td><label>First Name</label></td>
					<td><input type="text" name="firstName" value="" style="margin:0;"/></td>
				</tr>
				<tr>
					<td><label>Last Name</label></td>
					<td><input type="text" name="lastName" value="" style="margin:0;"/></td>
				</tr>
				<tr>
					<td><label>Email</label></td>
					<td><input type="text" name="email" value="" style="margin:0;"/></td>
				</tr>
				<tr>
					<td><label>Password</label></td>
					<td><input type="password" name="password" value="" style="margin:0;"/></td>
				</tr>
				<tr>
					<td><label>Phone</label></td>
					<td><input type="text" name="phone" value="" style="margin:0;"/></td>
				</tr>
				<tr>
					<td><label>Address</label></td>
					<td><input type="text" name="address" value="" style="margin:0;"/></td>
				</tr>
				</table>
				<br/>
				<button type="submit">Register</button>
				<button type="reset">Reset</button>				
				<br/>
				<p class="small">Already Registered? <a href="index.jsp">Login Here</a></p>
			</div>
		</form>
		<%} else {
		%>
		<%

    response.sendRedirect("shop.jsp");
%>
		<%-- <h1 style="text-align:center;">
		Welcome <%=session.getAttribute("customername")%>
		<u><a href="shop.jsp"></a></u>
		</h1> --%>
		<%
		}
		%>
	</div>
</body>

</html>