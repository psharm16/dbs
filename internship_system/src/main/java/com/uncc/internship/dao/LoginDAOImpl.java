package com.uncc.internship.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.uncc.internship.form.PersonSession;
import com.uncc.internship.model.IntershipStudentView;
import com.uncc.internship.model.Login;

@Component("loginDAO")
public class LoginDAOImpl implements LoginDAO {
 
	@Autowired
	JdbcTemplate template;
	@Override
	public void save(Login user,PersonSession users) {
		users.setAccess_rights(user.getAccess_rights());
		users.setUsername(user.getLoginId());
		return;
	}

	@Override
	public boolean checkLogin(String userName, String userPassword,PersonSession users) {

		Login user = getUserById(userName, userPassword);
		
		if (user != null) {
			save(user,users);
			return true;

		}
		return false;
	}

	public Login getUserById(String userName, String userPassword) {
		String sql= "select * from login where loginid = '"+userName+"' and password='"+userPassword+"'";
		List<Login> logins  = template.query(sql,
				new BeanPropertyRowMapper(Login.class));
	return logins.get(0);
	}
	
	public List<IntershipStudentView> internshipDetailsReport() {
		String sql= "select * from IntershipStudent";
		List<IntershipStudentView> internshipview  = template.query(sql,
				new BeanPropertyRowMapper(IntershipStudentView.class));
	return internshipview;
	}
	public List<IntershipStudentView> internshipDetailsReport(String title) {
		String sql= "select * from IntershipStudent where title ='" +title+"'";
		List<IntershipStudentView> internshipview  = template.query(sql,
				new BeanPropertyRowMapper(Login.class));
	return internshipview;
	}
	/*
	 * private static SessionFactory factory; public boolean checkLogin(String
	 * userName, String userPassword) { boolean success= false; try { factory = new
	 * AnnotationConfiguration(). configure(). //addPackage("com.xyz") //add package
	 * if used. addAnnotatedClass(Login.class). buildSessionFactory(); } catch
	 * (Throwable ex) { System.err.println("Failed to create sessionFactory object."
	 * + ex); throw new ExceptionInInitializerError(ex); } listEmployees(userName,
	 * userPassword); return success; }
	 * 
	 * Method to READ all the employees public boolean listEmployees(String
	 * userName, String userPassword ){ Session session = factory.openSession();
	 * Transaction tx = null;
	 * 
	 * try { tx = session.beginTransaction(); String query =
	 * "FROM Login  where LoginId=" + userName +" and Password=" + userPassword;
	 * List loginList = session.createQuery(query).list(); if (loginList.size() >0 )
	 * { Login login = (Login) loginList.get(0); return true; }
	 * 
	 * tx.commit(); } catch (HibernateException e) { if (tx!=null) tx.rollback();
	 * e.printStackTrace(); } finally { session.close(); } return false; }
	 */

	/*
	 * @Autowired DataSource datasource;
	 * 
	 * @Autowired JdbcTemplate jdbcTemplate;
	 * 
	 * private static EntityManagerFactory factory;
	 * 
	 * private static final String PERSISTENCE_UNIT_NAME = "Login";
	 */

	/*
	 * public boolean validateUsercheckLogin(String userName, String userPassword) {
	 * String sql = "select * from users where LoginId='" + userName +
	 * "' and Password='" + userPassword + "'"; List<Login> login =
	 * jdbcTemplate.query(sql, new UserMapper()); return users.size() > 0 ?
	 * users.get(0) : null; }
	 */

	/*
	 * public boolean checkLogin(String userName, String userPassword) {
	 * System.out.println("In Check login"); boolean userFound = false; factory =
	 * Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME); EntityManager
	 * em = factory.createEntityManager(); Query q = em.
	 * createQuery("SELECT u FROM Login u WHERE u.LoginId = :login AND u.Password = :pass"
	 * ); q.setParameter("login", userName); q.setParameter("pass", userPassword);
	 * try { Login login = (Login) q.getSingleResult(); if
	 * (userName.equalsIgnoreCase(login.getLoginId()) &&
	 * userPassword.equals(login.getPassword())) { userFound = true; } } catch
	 * (Exception e) { return false; }
	 * 
	 * return userFound; }
	 * 
	 * 
	 * class LoginMapper implements RowMapper<Login> { public Login mapRow(ResultSet
	 * rs, int arg1) throws SQLException { Login login = new Login();
	 * login.setLoginId(rs.getString("loginid"));
	 * login.setPassword(rs.getString("password")); login.setSecurity_Question(new
	 * SecurityQuestion(rs.getString("security_question")));
	 * login.setSecurity_Answer(rs.getString("security_answer"));
	 * login.setAccess_Rights(rs.getString("access_rights"));
	 * 
	 * return login; }
	 */
}
