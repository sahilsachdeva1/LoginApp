package com.mvc.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.LoginDao;
import com.mvc.model.UserModel;

/**
 * THis is login controller it will talk to DAO that is data base object.
 * 
 * @author ssachdev
 *
 */
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public LoginServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		UserModel loginBean = new UserModel();
		loginBean.setUserName(userName);
		loginBean.setPassword(password);

		LoginDao loginDao = new LoginDao();
		String userValidate = loginDao.authenticateUser(loginBean);
		if (userValidate.equals("SUCCESS")) {
			request.getSession().setAttribute("userName", userName);
			 response.getWriter().write("{ 'success': true, 'location': 'Home.jsp' }");
			
		} else {
			
			response.getWriter().write("{ 'success': false, 'location': 'Login.jsp' }");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			System.out.println("sdssdsdsdsdsds");
		
	}
}