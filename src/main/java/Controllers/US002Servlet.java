package Controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class US002Servlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);

		cleanCookie(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);

		cleanCookie(req, resp);
	}

	// 清除快取
	protected void cleanCookie(HttpServletRequest req, HttpServletResponse resp) {
		try{
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					cookie.setValue("");
					cookie.setPath("/");
					cookie.setMaxAge(0);
					resp.addCookie(cookie);
				}
			}
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/login.jsp");
//			dispatcher.forward(req, resp);
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
