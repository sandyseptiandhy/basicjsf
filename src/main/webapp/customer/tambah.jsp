<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tambah Customer</title>
</head>
<body>
<form action="save" method="post">
	<table>
		<tr> 
		<td>Nama Depan					: </td>
		<td><input type="text" name="first_name"/> </td> 
		</tr>
		<tr>
		<td>Nama Belakang				: </td>
		<td><input type="text" name="last_name"/> </td>
		</tr>
		<tr>
		<td>Email						: </td>
		<td><input type="text" name="email"/> </td>
		</tr>
		<tr>
		<td>Telp Rumah					: </td>
		<td><input type="text" name="home_phone"/> </td>
		</tr>
		<tr>
		<td>Telp Genggam				: </td>
		<td><input type="text" name="mobile_phone"/> </td>
		</tr>
		<tr>
		<td>Kata sandi					: </td>
		<td><input type="password" name="password"/> </td>
		</tr>
		<tr>
		<td>Tanggal lahir (dd-MM-yyyy)	: </td>
		<td><input type="text" name="birth_date"/> </td>
		</tr>
		<tr>
		<td>Alamat						: </td>
		<td><input type="text" name="street"/> </td>
		</tr>
		<tr>
		<td>Kota 						: </td>
		<td><input type="text" name="city"/> </td>
		</tr>
		<tr>
		<td>Kode pos					: </td>
		<td><input type="text" name="postal_code"/> </td>
		</tr>
		<tr>
		<td><button type="submit">Kirim</button>
	<button type="button" onclick="window.location.href='/basicjsf/customer/list'"  align="center" >Batal</button>
		
	</td>
		</tr>
		</table>
		
		<input type="hidden" name="action" value="create" />
	</form>
	
	
</body>
</html>