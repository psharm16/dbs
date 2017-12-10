package com.uncc.internship.dao;

import java.util.List;

import com.uncc.internship.form.PersonSession;
import com.uncc.internship.model.IntershipStudentView;
import com.uncc.internship.model.Login;

public interface LoginDAO {
	public boolean checkLogin(String userName, String userPassword,PersonSession user);
	 void save(Login user,PersonSession users);
	 public List<IntershipStudentView> internshipDetailsReport();
	 public List<IntershipStudentView> internshipDetailsReport(String searchValue);
}
