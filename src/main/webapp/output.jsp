<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Name</title>
</head>
<body>

	
	<% 
		
		String name = (String) request.getAttribute("name");
		String age = (String) request.getAttribute("age");
	%>
	
	Hello <% out.print(name); %> This is my first servlet.
	You are <% out.print(age); %> years old.
</body>
</html>