<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.bean.CustomerBean"%>
<%@ page import="com.db.bean.PurchaseBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>


<body>

	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden">Sole Food</h1>
		</div>


		<%
			PurchaseBean purchasebean = new PurchaseBean();
			int customer_id = (Integer) session.getAttribute("customerid");
			CustomerBean bean = new CustomerBean();
			bean = purchasebean.getcustomerdetails(customer_id);
		%>


		<form name="form1" method="POST" action="final.jsp">
			<div class="login-box animated fadeInUp">
				<div class="box-header">
					<h2>Deliver To</h2>
				</div>

				<label>Address</label> <br />
				<textarea name="address" id="address"><%=bean.getaddress()%> </textarea>
				<br />
				<button type="submit">Confirm Address</button>
				<br /> <a href="shop.jsp"><p class="small">Cancel</p></a>
			</div>


		</form>

	</div>

</body>
</html>