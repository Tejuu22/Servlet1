package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Studentdao;
import dao.Teacherdao;
import dto.Teacher;

@WebServlet("/Teachersignup")
public class Teachersignup extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Teacherdao dao = new Teacherdao();
		Studentdao dao2=new Studentdao();
		String email = req.getParameter("email");
		long mobile=Long.parseLong(req.getParameter("mob"));
		if (dao.find(email) == null && dao.find(mobile)==null && dao2.find(email) == null && dao2.find(mobile)==null) {
			Teacher teacher = new Teacher();
			teacher.setName(req.getParameter("name"));
			teacher.setMobile(mobile);
			teacher.setEmail(email);
			teacher.setPassword(req.getParameter("password"));
			teacher.setSubject(req.getParameter("subject"));

			dao.save(teacher);

			Teacher teacher2 = dao.find(teacher.getEmail());
			int empid = teacher2.getEmpid();

			resp.getWriter().print("<h1>Account Created Succesfully and your Employee Id is : " + empid + "</h1>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			resp.getWriter().print("<h1>Account Already Exists Check and try again</h1>");
			req.getRequestDispatcher("Teachersignup.html").include(req, resp);
		}
	}
}