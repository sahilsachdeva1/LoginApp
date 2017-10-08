package com.mvc.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;

import com.mvc.model.UserModel;

public class LoginDao {
	public String authenticateUser(UserModel loginBean) {
		FileInputStream fileInputStream;
		UserModel model = null;
		ObjectInputStream objectInputStream = null;
		try {
			fileInputStream = new FileInputStream("c://user.ser");

			objectInputStream = new ObjectInputStream(fileInputStream);

			model = (UserModel) objectInputStream.readObject();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {

			try {
				objectInputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		if (loginBean.getUserName().equals(model.getUserName())
				&& loginBean.getPassword().equals(model.getPassword())) {
			return "SUCCESS";
		}

		return "Invalid";
	}
}