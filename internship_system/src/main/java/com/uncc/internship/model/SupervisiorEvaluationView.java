package com.uncc.internship.model;

import java.io.Serializable;

public class SupervisiorEvaluationView implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;
	/**
	 * CREATE OR REPLACE VIEW `SupervisorEvaluation` AS SELECT
	 * placement.placementid, person.name as 'student name', internship.title,
	 * semester, companyname, supervisor.supervisorid, supervisor.name as
	 * 'supervisor name', supervisorevaluation FROM placement, person, internship,
	 * company,paperwork, supervisor, application, student
	 */
	private String placementID;
	private String studentName;
	private String title;
	private String semester;
	private String companyName;
	private String supervisorID;
	private String supervisorName;
	private String supervisorEvaluation;

	public String getPlacementID() {
		return placementID;
	}

	public void setPlacementID(String placementID) {
		this.placementID = placementID;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getSupervisorID() {
		return supervisorID;
	}

	public void setSupervisorID(String supervisorID) {
		this.supervisorID = supervisorID;
	}

	public String getSupervisorName() {
		return supervisorName;
	}

	public void setSupervisorName(String supervisorName) {
		this.supervisorName = supervisorName;
	}

	public String getSupervisorEvaluation() {
		return supervisorEvaluation;
	}

	public void setSupervisorEvaluation(String supervisorEvaluation) {
		this.supervisorEvaluation = supervisorEvaluation;
	}
}
