package Controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.US001Model;
import Models.User;

/**
 * Servlet implementation class US001Servlet
 */
@WebServlet("/US001Servlet")
public class US001Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public US001Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType( "text/html; charset=BIG5");
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		execute(request, response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("BIG5");
		
		String userId = request.getParameter("username") == null ? "" : request.getParameter("username");
		String passwd = request.getParameter("password") == null ? "" : request.getParameter("password");
		
		User userModel = new US001Model().getUS001_Users(userId, passwd); 
		request.setAttribute("userModel", userModel);
		request.setAttribute("sent", true);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/login.jsp");
		dispatcher.forward(request, response);
	}

}
