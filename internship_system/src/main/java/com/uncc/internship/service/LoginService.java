package com.uncc.internship.service;

import java.util.List;

import com.uncc.internship.form.PersonSession;
import com.uncc.internship.model.IntershipStudentView;

public interface LoginService {
	public boolean checkLogin(String userName, String userPassword, PersonSession user);
	public List<IntershipStudentView> internshipDetailsReport();
	 public List<IntershipStudentView> internshipDetailsReport(String searchValue);
}
