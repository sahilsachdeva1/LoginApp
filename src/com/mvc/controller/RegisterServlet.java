package com.mvc.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.model.UserModel;

/**
 * This is our register controller In every servler we are providing serial
 * version ID because servler extends http servlet which implements seriaizable
 * interface
 */
public class RegisterServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserModel user = new UserModel();
		user.setUserName(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setGender(request.getParameter("gender"));
		user.setLang(request.getParameter("lang"));
		FileOutputStream fileOutputStream = new FileOutputStream("c://user.ser");
		ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileOutputStream);
		objectOutputStream.writeObject(user);
		objectOutputStream.close();
		out.print("Registration Successfull!" + "You can Login page");

	}
}