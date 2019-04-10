package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") == null) {
			response.sendRedirect("LoginServlet");
			return;
		}

		String id = request.getParameter("id");

		UserDao userDao = new UserDao();
		User user = userDao.findUserInfo(id);

		request.setAttribute("user", user);

		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/update.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @param
	 * @param
	 * @param
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");

		UserDao userDao = new UserDao();


		if ("".equals(name) || ("".equals(birthDate)) || !(password.equals(password2))) {
			User u = new User();
			u.setId(id);
			u.setLoginId(loginId);
			u.setPassword(password);
			u.setName(name);
			u.setBirthDate(birthDate);

			request.setAttribute("errMsg", "入力された内容は正しくありません");

			request.setAttribute("user", u);

			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/update.jsp");
			dispatcher.forward(request, response);
			return;

		}

		int rs = 0;

		if ("".equals(password) && "".equals(password2)) {
			rs = userDao.updateExceptPassword(name, birthDate, id);
		} else {
			rs = userDao.UpdateUserInfo(password, name, birthDate, id);
		}



		if (rs != 1) {
			User u = new User();
			u.setId(id);
			u.setLoginId(loginId);
			u.setPassword(password);
			u.setName(name);
			u.setBirthDate(birthDate);

			request.setAttribute("errMsg", "入力された情報は正しくありません");

			request.setAttribute("user", u);

			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/update.jsp");
			dispatcher.forward(request, response);
			return;

		} else {
			response.sendRedirect("UserListServlet");
		}

	}
}
