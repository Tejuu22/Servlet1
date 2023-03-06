<%@page import="dto.Markscard"%>
<%@page import="java.util.List"%>
<%@page import="dto.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select MarksCard</title>
</head>
<body>
<%if(session.getAttribute("student")==null){
	response.getWriter().print("<h1>Session Expired Login Again</h1>");
	request.getRequestDispatcher("Login.html").include(request, response);
}%>
<%
Student student=(Student)session.getAttribute("student");
List<Markscard> list=student.getMarkscard();
%>

<form action="MarksCard.jsp">
<select name="std">
<%for(Markscard card:list){
	if(card.isStatus())
	{%>
<option><%=card.getStandard()%></option>
<%} %>
<%} %>
</select><br><br>
<button>submit</button>
</form><br><br>
	<a href="Studenthome.html"><button>Home</button></a>
</body>
</html>