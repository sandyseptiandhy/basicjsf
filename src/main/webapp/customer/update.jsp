<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update customer</title>
</head>
<body>
<form action="update" method="post">
	<table>
	<%String idC=request.getParameter("idCustomer"); 
	  String fName=request.getParameter("firstName");
	  String lName=request.getParameter("lastName");
	  String ema=request.getParameter("email");
	  String hPhone=request.getParameter("homePhone");
	  String mPhone=request.getParameter("mobilePhone");
	  String p=request.getParameter("password");
	  String bDate=request.getParameter("birthDate");
	  String st=request.getParameter("street");
	  String ci=request.getParameter("city");
	  String pCode=request.getParameter("postalCode");
	%>
<!-- 		<tr> --> 
<!-- 		<td>Id Customer 				:</td> -->
<%-- 		<td><% out.print("<input type=\"text\" name=\"id_customer\" value=\""+idC+"\">" );%></td> --%>
<!-- 		</tr> -->
		<tr>
		<td>Id Customer 				:</td>
		<td><input type="text" name="id_customer" value="<%=idC%>" readonly> </td>
		</tr>
		<tr> 
		<td>Nama Depan					: </td>
		<td><input type="text" name="first_name" value="<%=fName%>"/> </td> 
		</tr>
		<tr>
		<td>Nama Belakang				: </td>
		<td><input type="text" name="last_name" value="<%=lName%>"/> </td>
		</tr>
		<tr>
		<td>Email						: </td>
		<td><input type="text" name="email" value="<%=ema%>"/> </td>
		</tr>
		<tr>
		<td>Telp Rumah					: </td>
		<td><input type="text" name="home_phone" value="<%=hPhone%>"/> </td>
		</tr>
		<tr>
		<td>Telp Genggam				: </td>
		<td><input type="text" name="mobile_phone" value="<%=mPhone%>"/> </td>
		</tr>
		<tr>
		<td>Kata sandi					: </td>
		<td><input type="text" name="password" value="<%=p%>"/> </td>
		</tr>
		<tr>
		<td>Tanggal lahir (dd-MM-yyyy)	: </td>
		<td><input type="text" name="birth_date" value="<%=bDate%>"/> </td>
		</tr>
		<tr>
		<td>Alamat						: </td>
		<td><input type="text" name="street" value="<%=st%>"/> </td>
		</tr>
		<tr>
		<td>Kota 						: </td>
		<td><input type="text" name="city" value="<%=ci%>"/> </td>
		</tr>
		<tr>
		<td>Kode pos					: </td>
		<td><input type="text" name="postal_code" value="<%=pCode%>"/> </td>
		</tr>
		<tr>
		<td><button type="submit">Kirim</button>
		<form action="/basicjsf/customer/list" method="get"><input type="submit" value="Batal" name="Submit" align="center" /> </form></td>
		</tr>
		</table>
		
		<input type="hidden" name="action" value="update" />
	</form>
</body>
</html>