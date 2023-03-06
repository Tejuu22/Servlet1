<%@page import="dto.Markscard"%>
<%@page import="dao.Marksdao"%>
<%@page import="dto.Student"%>
<%@page import="dao.Studentdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
<% 
int regno=Integer.parseInt(request.getParameter("reg")); 
Studentdao dao=new Studentdao();
Student student=dao.find(regno);
int id=Integer.parseInt(request.getParameter("id")); 
Marksdao marksdao=new Marksdao();
Markscard markscard=marksdao.find(id);
%>
<h1>Enter Updated Details</h1>

<form action="updatemarks" method="post">

Name:<input type="text" name="name" value=<%=student.getName()%> readonly="readonly"><br>
Register Number:<input type="text" name="reg" value=<%=student.getRegno()%> readonly="readonly"><br>
Marks Id:<input type="text" name="id" value=<%=markscard.getId()%> readonly="readonly"><br>
Class:<input type="text" name="std" value=<%=markscard.getStandard()%> readonly="readonly"><br>
Mathematics Marks:<input type="number" name="maths" value="<%=markscard.getMathmetics()%>"><br>
English :<input type="number" name="english" value="<%=markscard.getEnglish()%>"><br>
Science :<input type="number" name="science" value="<%=markscard.getScience()%>"><br>
Kannada :<input type="number" name="kannada" value="<%=markscard.getKannada()%>"><br>
Hindi :<input type="number" name="hindi" value="<%=markscard.getHindi()%>"><br>
Social Science :<input type="number" name="socialscience" value="<%=markscard.getSocialscience()%>"><br>
<br>
<button type="reset">Cancel</button>
<button>Update</button>
</form>

</body>
</html>