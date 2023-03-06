package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Marksdao;
import dao.Studentdao;
import dto.Markscard;
import dto.Student;
@WebServlet("/Savemarks")
public class Savemarks extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int maths=Integer.parseInt(req.getParameter("maths"));
	int kannada=Integer.parseInt(req.getParameter("kannada"));
	int English=Integer.parseInt(req.getParameter("english"));
	int Hindi=Integer.parseInt(req.getParameter("hindi"));
	int Science=Integer.parseInt(req.getParameter("science"));
	int Social=Integer.parseInt(req.getParameter("socialscience"));
	int standard=Integer.parseInt(req.getParameter("std"));
	String result=" ";	
	double percenatge = 0;

	if (maths > 100 || Science > 100 || English > 100 || kannada > 100 || Hindi > 100 || Social > 100) {
		resp.getWriter().print("<h1>Enter Proper Marks</h1>");
		req.getRequestDispatcher("Addmarks.jsp?standard=" + standard).include(req, resp);
	} else {
		percenatge = (maths + English + Hindi + kannada + Science + Social) / 6;
		if (maths < 35 || Science < 35 || English < 35 || kannada < 35 || Hindi < 35 || Social < 35) {
			result = "Fail";
		} else {

			if (percenatge < 35) {
				result = "Fail";
			} else if (percenatge < 60) {
				result = "Second Class";
			} else if (percenatge < 85) {
				result = "First Class";
			} else {
				result = "Distinction";
			}
		}
		Markscard card = new Markscard();
		card.setEnglish(English);
		card.setHindi(Hindi);
		card.setKannada(kannada);
		card.setMathmetics(maths);
		card.setPercentage(percenatge);
		card.setStandard(standard);
		card.setSocialscience(Social);
		card.setScience(Science);
		card.setResult(result);

		Student student = (Student) req.getSession().getAttribute("student");

		Marksdao marksdao = new Marksdao();
		marksdao.save(card);

		List<Markscard> list = student.getMarkscard();
		list.add(card);

		student.setMarkscard(list);

		Studentdao dao = new Studentdao();
		dao.update(student);

		resp.getWriter().print("<h1>Marks Added Succesfully");
		req.getRequestDispatcher("Studenthome.html").include(req, resp);
}
	}
}