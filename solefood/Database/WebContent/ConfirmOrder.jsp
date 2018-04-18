<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.bean.ItemBean"%>
<%@ page import="com.db.bean.PurchaseBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

		<form name="form2" Method="POST" action="ConfirmDetails.jsp">
			<div class="login-box animated fadeInUp">
				<div class="box-header">
					<h2>Details of your order</h2>
				</div>
				<%
					int item_id = (Integer) session.getAttribute("itemid");
					int customer_id = (Integer) session.getAttribute("customerid");
					int size = (Integer) session.getAttribute("size");
					int quantity = (Integer) session.getAttribute("quantity");
					PurchaseBean purchase = new PurchaseBean();
					ItemBean item = new ItemBean();
					item = purchase.getitemdetails(item_id, size, quantity);
				%>



				<label>Brand Name : <%=item.getBrand()%></label> <br /> <label>Item
					Name:<%=item.getItemName()%></label> <br /> <label>Size:<%=size%></label> <br />
				<label>Quantity:<%=quantity%></label> <br /> <label>Price:<%=item.getPrice()%></label>
				<br /> <label>Tax:<%=item.getTax()%></label> <br /> <label>Total:<%=item.getTotal()%></label>
				<br />

				<jsp:useBean id="purchasebean" class="com.db.bean.PurchaseBean"
					scope="page">
					<jsp:setProperty property="customerId" name="purchasebean"
						value='<%=customer_id%>' />
					<jsp:setProperty property="itemId" name="purchasebean"
						value='<%=item.getItemId()%>' />
					<jsp:setProperty property="quantity" name="purchasebean"
						value='<%=quantity%>' />
					<jsp:setProperty property="price" name="purchasebean"
						value='<%=item.getPrice()%>' />
				</jsp:useBean>

				<br />
				<button type="submit">Confirm Order</button>
				<br /> <a href="shop.jsp"><p class="small">Cancel</p></a>
			</div>
		</form>
		<%
			purchasebean.insertpurchasedetails(purchasebean);
		%>

	</div>
</body>
</html>