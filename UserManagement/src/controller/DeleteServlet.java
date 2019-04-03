package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO
		String id = request.getParameter("id");

		UserDao userDao = new UserDao();
		User user = userDao.findUserInfo(id);

		request.setAttribute("user", user);



		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/delete.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @param
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO
		request.setCharacterEncoding("UTF-8");

		UserDao userDao = new UserDao();
		String id = request.getParameter("id");


		int rs = userDao.deleteUserInfo(id);

		if(rs == 1) {

			response.sendRedirect("UserListServlet");

		}

	}

}
