
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="id.co.skyforce.basicjsf.domain.Customer" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
td{
	padding-right:9px;
	padding-left:5px;
}
th {
    text-align: center;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th	{
    background-color: grey;
    color: white;
}
table#t01 td{
	font-family: Times New Roman;
	
}

button {
    background:none!important;
     border:none; 
     padding:0!important;
    /*border is optional*/
     border-bottom:0.5px solid #444; 
     cursor: pointer;
	font-family: Times New Roman;
	font-weight: bold;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daftar Customer</title>
</head>
<body>

<br>


<div align="center">
<h1 >Customer Management</h1>
		<table id="t01">
		<tr> 
		<th>ID</th>
		<th>Name</th>
		<th>Email</th>
		<th>Birth Date</th>
		<th colspan="2">Action</th>
		</tr>
        <% 
        SimpleDateFormat formatter =  new SimpleDateFormat("dd-MM-yyyy");
        
        List<Customer> customers =  (List<Customer>) request.getAttribute("customers");
		for(Customer cus:customers){
		%>
			<tr>
				<td> <% out.print(cus.getId()); %></td>
				<td> <% out.print(cus.getFirstName()+" "+cus.getLastName()); %></td>
				<td> <% out.print(cus.getEmail()); %></td>
				<% String bD = formatter.format(cus.getBirthDate()); %>
				<td> <% out.print(bD); %></td>
				
				<form action="update.jsp" method="post" >
				<input type="hidden" name="idCustomer" value="<%=cus.getId()%>"> 
				<input type="hidden" name="firstName" value="<%=cus.getFirstName()%>">
				<input type="hidden" name="lastName" value="<%=cus.getLastName()%>">
				<input type="hidden" name="email" value="<%=cus.getEmail()%>">
				<input type="hidden" name="homePhone" value="<%=cus.getHomePhone()%>">
				<input type="hidden" name="mobilePhone" value="<%=cus.getMobileNo()%>">
				<input type="hidden" name="password" value="<%=cus.getPassword()%>">
				<input type="hidden" name="birthDate" value="<%=bD%>">
				<input type="hidden" name="street" value="<%=cus.getAddress().getStreet()%>">
				<input type="hidden" name="city" value="<%=cus.getAddress().getCity()%>">
				<input type="hidden" name="postalCode" value="<%=cus.getAddress().getPostalCode()%>">
				<td><button type="submit" value="Edit">Edit</button></td>
				</form>	
				
				<form action="" method="post" >
				<input type="hidden" name="id_customer" value="<%=cus.getId()%>"> 
				<input type="hidden" name="action" value="delete" />
				<td><button type="submit" value="Hapus" >Hapus</button></td>
				</form>	
				

				
			</tr>
		<%} %>
		
	
		</table>
		<br>
	<a href="tambah.jsp">Add Customer</a>
		

</div>
</body>
</html>