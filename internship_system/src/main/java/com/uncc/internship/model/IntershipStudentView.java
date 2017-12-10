package com.uncc.internship.model;

import java.io.Serializable;

/**
 * Entity implementation class for Entity: IntershipDetailsView
 *
 */

public class IntershipStudentView implements Serializable {

	private static final long serialVersionUID = 1L;

	public IntershipStudentView() {
		super();
	}

	/**
	 * CREATE OR REPLACE VIEW `InternshipStudent` AS select INTE.internshipID,
	 * INTE.TITLE, INTE.DESCRIPTION, CO.COMPANYNAME, INTE.NOOFOPENINGS,CO.INDUSTRY
	 * FROM COMPANY AS CO INNER JOIN INTERNSHIP AS INTE ON INTE.COMPANYID
	 * =CO.COMPANYID;
	 */

	private String title;
	private String description;

	private String companyName;
	private String noOfOpenings;
	private String industry;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getNoOfOpenings() {
		return noOfOpenings;
	}

	public void setNoOfOpenings(String noOfOpenings) {
		this.noOfOpenings = noOfOpenings;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

}
