
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.util.List"%>
<%@page import="dto.Markscard"%>
<%@page import="dto.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarksCard</title>
</head>
<body>
	<%
	Student student = (Student) session.getAttribute("student");
	Markscard card = null;
	int std = Integer.parseInt(request.getParameter("std"));
	List<Markscard> list = student.getMarkscard();
	for (Markscard card2 : list) {
		if (card2.getStandard() == std) {
			card = card2;
		}
	}
	%>
	<h1>
		MarksCard for Class
		<%=card.getStandard()%></h1>
	<br>
	<br>

	<%
	String base64 = Base64.encodeBase64String(student.getPicture());
	%>
	<img height="100" width="100" alt="unknown"
		src="data:image/jpeg;base64,<%=base64%>">

	<br>
	<br>
	<h1>
		Name:
		<%=student.getName()%><br> Register Number:
		<%=student.getRegno()%><br>
	</h1>
	<br>
	<table border="1">
		<tr>
			<th>Subject</th>
			<th>Total Marks</th>
			<th>Marks Obtained</th>
		</tr>
		<tr>
			<th>Kannada</th>
			<th>100</th>
			<th><%=card.getKannada()%></th>
		</tr>
		<tr>
			<th>English</th>
			<th>100</th>
			<th><%=card.getEnglish()%></th>
		</tr>
		<tr>
			<th>Hindi</th>
			<th>100</th>
			<th><%=card.getHindi()%></th>
		</tr>
		<tr>
			<th>Mathematics</th>
			<th>100</th>
			<th><%=card.getMathmetics()%></th>
		</tr>
		<tr>
			<th>Science</th>
			<th>100</th>
			<th><%=card.getScience()%></th>
		</tr>
		<tr>
			<th>Social Science</th>
			<th>100</th>
			<th><%=card.getSocialscience()%></th>
		</tr>
	</table>
	<br>
	<br>
	<h1>
		Percentage:
		<%=card.getPercentage()%><br> Result:
		<%=card.getResult()%>
	</h1>

</body>
</html>