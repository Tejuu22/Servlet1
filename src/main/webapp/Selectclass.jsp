<%@page import="dto.Markscard"%>
<%@page import="dto.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Class</title>
</head>
<body>
	<%
	if (session.getAttribute("student") == null) {
		response.getWriter().print("<h1>Session Expired Login Again</h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	}
	%>

	<%
	Student student = (Student) session.getAttribute("student");
	int std = student.getStandard();
	%>
	<%
	boolean flag1 = true;
	boolean flag2 = false;
	boolean flag3 = false;
	if (std > 8) {
		flag2 = true;
	}
	if (std > 9) {
		flag3 = true;
	}
	for (Markscard card : student.getMarkscard()) {
		if (card.getStandard() == 8) {
			flag1 = false;
		}
		if (card.getStandard() == 9) {
			flag2 = false;
		}
		if (card.getStandard() == 10) {
			flag3 = false;
		}
	}
	%>
	<%
	if (flag1 || flag2 || flag3) {
	%>
	<h1>Select Class for which You want to Add Marks</h1>
	<br>

	<form action="Addmarks.jsp">
		Select Class: <select name="standard">
			<%
			if (flag1) {
			%>
			<option>8</option>
			<%
			}
			%>
			<%
			if (flag2) {
			%>
			<option>9</option>
			<%
			}
			%>
			<%
			if (flag3) {
			%>
			<option>10</option>
			<%
			}
			%>
		</select> <br> <br>
		<button>Submit</button>
	</form>
	<br>
	<br>
	<a href="Studenthome.html"><button>Home</button></a>
	<%
	} else {
	response.getWriter().print("<h1>Already Marks are Upto Date</h1>");
	request.getRequestDispatcher("Studenthome.html").include(request, response);
	}
	%>
</body>
</html>