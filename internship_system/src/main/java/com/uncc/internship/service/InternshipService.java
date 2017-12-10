package com.uncc.internship.service;

import java.util.List;

public interface InternshipService {
	public List getCompaniesIntershipOffer(String companyId);
	public List getIntershipDetails(String description);
}
