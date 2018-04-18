<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP page </title>
		<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/bootstrap.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	</head>
<body onload="setDefault()">

<div class="container">
		<div class="top">
			<h1 id="title" class="hidden">Sole Food</h1>
		</div>

     <br><br><br>
		
		<div id="price"></div>
    		<%! String driverName = "com.mysql.jdbc.Driver";%>
        <%!String connectionURL = "jdbc:mysql://dbproject.cutpi1sw0djp.us-east-1.rds.amazonaws.com:3306/dbproject";%>
        <%!String getItemsSql = "SELECT * FROM items"; %>
        <%!String getSizeSqlTemplate = "SELECT size, stock FROM stock WHERE item_id={item_id}"; %>
        <div align=center>
        <div class="card"  style="width: 30rem;">
  <img  class="card-img-top" id="image" src="" width="300" height="300"/>
  <div class="card-body" align="left">
       
   <form action="AddToCart" method="post" id="shoeselector">
   

			<%
	           	Connection connection = null;
				PreparedStatement st = null;
				PreparedStatement st1 = null;
				try
				{
					Class.forName(driverName);
					connection = DriverManager.getConnection(connectionURL,"admin","opencloud");
					st = connection.prepareStatement(getItemsSql);
					ResultSet itemsResult = st.executeQuery(); 
			%>
			<p>Select Brand :
				<select name="brand" id="product" required>
					<option value=""></option>
					<%
						while(itemsResult.next())
						{
							String itemId = itemsResult.getString("item_id");
							String brand = itemsResult.getString("brand"); 
							String imageUrl = itemsResult.getString("image_url");
							
							// getting sizes for available stock
							String sizeSql = getSizeSqlTemplate.replace("{item_id}", itemId+"");
							st1 = connection.prepareStatement(sizeSql);
							ResultSet sizesResult = st1.executeQuery();
							
							// build size,stock pairs
							String sizeStockPairs = "";
							while(sizesResult.next()){
								
								String size = sizesResult.getString("size");
								String stock = sizesResult.getString("stock");
								
								if(sizeStockPairs.length() > 0) sizeStockPairs = sizeStockPairs + "#";
								sizeStockPairs = sizeStockPairs + size+"-"+stock;
							}
						
							String optionValue = itemId+","+imageUrl +"," + sizeStockPairs;
					%>
					<option value="<%=optionValue%>"><%=brand %></option>
					<%
						}
					%>
				</select>
			</p>
			<p>Size :
				<select name="sizes" id="sizes" required>
					<option value="">0</option>
				</select>
			</p>
			<%           
				}
				catch(SQLException sqe){ 
					out.println(sqe);
				}
			%>
			<p>Quantity :
			<input type="number" name="quantity" id="quantity"  min="1" max="50" required/>
			</p>
									
			<input type="submit"  class="btn btn-primary" value="Add To Cart"/>					
		</form>
  </div>
  </div>
</div>	</div>
	</body>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.js"></script>
		<script type="text/javascript">
		function setImage() {
			var values = this.value.split(",");
		    var url = values[1];
		    var sizes = values[2].split('#');
		    
			var img = document.getElementById("image");
		    img.src = url;
		    
		    // clear current sizes
		    var dropdown = document.getElementById('sizes');
		    for(i = dropdown.options.length - 1 ; i >= 0 ; i--)
		    {
		    		dropdown.remove(i);
		    }
		    
		    for (var i = 0; i < sizes.length; i++) {
		    		// get size and stock from value 
		    		var pair = sizes[i].split("-");
		    		var size = pair[0];
		    		var stock = pair[1];
		    		
		    		
		    		
		    		/* var optionValue = size + (stock == "0" ? " (OUT OF STOCK)" : "");
		    		var newSelect = document.createElement('option');
		    		newSelect.text = optionValue;
		    		newSelect.value = size;
		    		dropdown.add(newSelect); */
		    	
		    		
		    		if (parseInt(stock) > 0) {
		    			var newSelect = document.createElement('option');
			    		newSelect.text = size + "";
			    		newSelect.value = size;
			    		dropdown.add(newSelect);
		    		}
		    		
		    		
		    		
	        }
		    
		    return false;
		}
		
		document.getElementById("product").onchange = setImage;
		
		
		function setDefault(){
			var img = document.getElementById("image");
		    img.src = "images/startshop.jpg";
		}
	</script>
</html>
             
        
       
	