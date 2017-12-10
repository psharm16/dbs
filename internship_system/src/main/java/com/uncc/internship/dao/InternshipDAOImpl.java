package com.uncc.internship.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;

@Component("internshipDAO")
public class InternshipDAOImpl implements InternshipDAO {
	@Autowired
	JdbcTemplate template;

	@Override
	public List getIntershipDetails(String description) {
		String sql = "SELECT * FROM internship LEFT JOIN (skills, internshipskill, paidintern, unpaidintern,company)"
				+ " ON (skills.SkillID = internshipskill.SkillID AND internshipskill.InternshipID = "
				+ " internship.InternshipId AND paidintern.InternshipId = internship.InternshipId"
				+ " and unpaidintern.InternshipID=internship.InternshipId and company.CompanyId=internship.CompanyID)"
				+ " where internship.description like '%" + description + "%';";

		/*
		 * List<Object> internshipDetails = template.query( sql, new
		 * ArrayList<Object>());
		 */

		return new ArrayList();// internshipDetails;
	}

	@Override
	public List getCompaniesIntershipOffer(String companyId) {
		String sql = "SELECT * FROM internship LEFT JOIN (skills, internshipskill, paidintern, unpaidintern,company)"
				+ " ON (skills.SkillID = internshipskill.SkillID AND internshipskill.InternshipID = "
				+ " internship.InternshipId AND paidintern.InternshipId = internship.InternshipId"
				+ " and unpaidintern.InternshipID=internship.InternshipId and company.CompanyId=internship.CompanyID)"
				+ " where internship.companyid = '" + companyId + "';";
		/*
		 * List<Object> internshipDetails = template.query( sql, new
		 * ArrayList<Object>());
		 */

		return new ArrayList();// internshipDetails;
	}
}
