<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.daoimpl.CartItemsDAO"%>
<%@page import="com.petshop.model.Customers"%>
<%@page import="com.petshop.model.CartItems"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
<link rel="stylesheet" href="MyCart.css">
</head>
<body>
	<%
	CartItemsDAO cartItemDao = new CartItemsDAO();
	Customers customerDetails = new Customers();
	customerDetails = (Customers) session.getAttribute("customer");
	List<CartItems> cartList = new ArrayList<CartItems>();
	
	cartList = cartItemDao.showMyCart(customerDetails);
	
	
	session.setAttribute("cartList", cartList);
	%>
	
	<div class="head">
		<div class="navigation">
			<h1>PET Shop</h1>
			<ul id="menu">
				<li><a href="myprofile.jsp">My Profile</a></li>
				<li><a href="mycart.jsp">My cart</a></li>
				<li><a href="myorders.jsp">My orders</a></li>
				<li><a href="AddItem.jsp">Add item</a></li>
				<li><a href="home.jsp">Home</a></li>
			</ul>
		</div>
	</div>
	<table>
		<%
		double totalAmount = 0;
		for (CartItems cartItems : cartList) {
			totalAmount += cartItems.getTotalPrice();
		%>
		<tr>
			<td><img src="<%=cartItems.getPet().getPetImage()%> alt="petimage"></td>

			<td><p>
					Item id:<%=cartItems.getItemId()%></p>
				<p>
					Pet id:<%=cartItems.getPet().getPetId()%></p>
				<p>
					Pet Type:<%=cartItems.getPet().getPetType()%></p>
				<p>
					Pet Name:<%=cartItems.getPet().getPetName()%></p>
				<p>
					Quantity:<%=cartItems.getQuantity()%></p>
				<p>
					Unit_price:<%=cartItems.getUnitPrice()%></p>
				<p>
				
				   Total price:<%=cartItems.getTotalPrice()%></p>
				
				<p>
					<a
						href="PetDescription.jsp?petid=<%=cartItems.getPet().getPetId()%>"><button>View</button></a>
					<a href="BuyNow?petid=<%=cartItems.getPet().getPetId()%>"><button>Buy
							Now</button></a>
				</p></td>

		</tr>
		<%
		}
		session.setAttribute("totalCartAmount", totalAmount);
		%>
	</table>
    <button id="buyall" onclick="buyAll(<%=cartList.size()%>)">Buy all</button>
     <script type="text/javascript">
     function buyAll(let size){  
     	console.log("called");
     	
     	for(int i=0;i<size;i++){
     		
     	}
     	var url="BuyAll.jsp";  
     	if(window.XMLHttpRequest){  
     		request=new XMLHttpRequest();  
     		}  
     		else if(window.ActiveXObject){  
     		request=new ActiveXObject("Microsoft.XMLHTTP");  
     		}  
     	try  
     	{  
     	request.onreadystatechange=getInfo();  
     	request.open("GET",url,true);  
     	request.send();  
     	}  
     	catch(e)  
     	{  
     	alert("Unable to connect to server");  
     	}  
     	}  
     
     function getInfo(){  
     	if(request.readyState==4){  
     	var val=request.responseText;  
     	document.getElementById('message').innerHTML=val;  
     	}  
     	}  
     }</script>
</body>
</html>