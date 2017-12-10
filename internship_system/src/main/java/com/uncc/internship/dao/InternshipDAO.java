package com.uncc.internship.dao;

import java.util.List;

public interface InternshipDAO {
	public List getIntershipDetails(String description); 
	
	public List getCompaniesIntershipOffer(String companyId); 
	
	}
