package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Studentdao;
import dao.Teacherdao;
import dto.Student;

@WebServlet("/studentsignup")
@MultipartConfig
public class Studentsignup extends HttpServlet {
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String email=req.getParameter("email");
			long mobile=Long.parseLong(req.getParameter("mob"));
			
			Studentdao dao=new Studentdao();
			Teacherdao dao2=new Teacherdao();
			if(dao.find(email) == null && dao.find(mobile)==null && dao2.find(email) == null && dao2.find(mobile)==null)
			{
			Student student=new Student();
			student.setName(req.getParameter("name"));
			student.setMobile(mobile);
			student.setEmail(email);
			student.setPassword(req.getParameter("password"));
			student.setStandard(Integer.parseInt(req.getParameter("standard")));

			byte[] pic = null;
			Part filepart = req.getPart("pic");
			if (filepart != null) {
				InputStream inputStream = filepart.getInputStream();
				pic = new byte[inputStream.available()];
				inputStream.read(pic);
			}

			student.setPicture(pic);

			dao.save(student);

			Student student2 = dao.find(student.getEmail());

			int reg = student2.getRegno();
			resp.getWriter().print("<h1>Account Created Succesfully and Your Register Number is " + reg + "</h1>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			resp.getWriter().print("<h1>Account Already Exists Check and try again</h1>");
		
	}

	}
}

