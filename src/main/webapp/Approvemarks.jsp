<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="dto.Markscard"%>
<%@page import="dto.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.Studentdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Studentdao dao = new Studentdao();
List<Student> list=dao.fetchAll();
%>
<table border="1">
<tr>
<th>Register number</th>
<th>Name</th>
<th>Standard</th>
<th>Mathematics</th>
<th>Science</th>
<th>Kannada</th>
<th>English</th>
<th>Social science</th>
<th>Percentage</th>
<th>Result</th>
<th>Status</th>
<th>Change Status</th>
<th>Edit</th>
</tr>
<%for(Student student:list){
	List<Markscard> list1=student.getMarkscard();
	%>
	<%for(Markscard markscard:list1){ %>
	<tr>
	<th><%=student.getRegno() %></th>
	<th><%=student.getName() %></th>
	<th><%=markscard.getStandard() %></th>
	<th><%=markscard.getMathmetics() %></th>
	<th><%=markscard.getScience() %></th>
	<th><%=markscard.getEnglish() %></th>
	<th><%=markscard.getHindi() %></th>
	<th><%=markscard.getSocialscience() %></th>
	<th><%=markscard.getKannada() %></th>
	<th><%=markscard.getPercentage()%></th>
	<th><%=markscard.getResult()%></th>
	<th><%=markscard.isStatus()%></th>
	<th><a href="changestatus?id=<%=markscard.getId()%>"><button>Change Status</button></a></th>
<th><a href="Edit.jsp?reg=<%=student.getRegno()%>&id=<%=markscard.getId()%>"><button>Edit</button></a></th>
	</tr>
	<%} %>
	<%} %>
</table>
<br>
<a href="Teacherhome.html"><button>Home</button></a>
</body>
</html>