<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Enter<%=request.getParameter("standard") %>Class details</h1>
<form action ="Savemarks" method="post">
Class:<input type="text" name="std" value=<%=request.getParameter("standard") %> readonly="readonly">
Mathematics Marks:<input type="text" name="maths"><br>
English :<input type="text" name="english"><br>
Science :<input type="text" name="science"><br>
Kannada :<input type="text" name="kannada"><br>
Hindi :<input type="text" name="hindi"><br>
Social Science :<input type="text" name="socialscience"><br>
<br>
<button type="reset">Cancel</button>
<button>Save</button>
</form>
<br>
<a href="Studenthome.html"><button>Home</button></a>
</body>

</form>
</body>
</html>