<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hapus Customer</title>
</head>
<body>
<form action="save" method="post">
	<table>
		<tr>
		<td>Id Customer 				:</td>
		<td><input type="text" name="id_customer"/> </td>
		<td><button type="submit">Kirim</button></td>
		</tr>
		
		</table>
		<input type="hidden" name="action" value="delete" />
	</form>
</body>
</html>