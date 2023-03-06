package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Marksdao;
import dto.Markscard;
@WebServlet("/changestatus")
public class Changestatus  extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		Marksdao marksdao=new Marksdao();
		Markscard markscard=marksdao.find(id);
		if(markscard.isStatus())
		{
			markscard.setStatus(false);
		} else {
			markscard.setStatus(true);
		}
		marksdao.update(markscard);
		resp.getWriter().print("<h1>Status updated</h1>");
		req.getRequestDispatcher("Approvemarks.jsp").include(req, resp);
		
		
	}

}
