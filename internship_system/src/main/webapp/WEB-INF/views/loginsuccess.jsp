<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tbody>
			<tr>
				<td><c:choose>
						<c:when test="${user.access_right}=='14'">
							<a href="<c:url value='/internship_system/editInternships.html'/>" target="_blank">Edit Internships</a> 
							<a href="<c:url value='/internship_system/editApplication.html'/>" target="_blank">Edit Applications</a>
							<a href="<c:url value='/internship_system/addNewStudent.html'/>" target="_blank">Add Student</a>  
							<a href="<c:url value='/internship_system/addFaculty.html'/>" target="_blank">Add Faculty</a>  
							<a href="<c:url value='/internship_system/addAdmin.html'/>" target="_blank">Add Admin</a>  
						</c:when>
						<c:otherwise>
							<c:if test="${user.isStudent}">
															
								<a href="<c:url value='/internship_system/addEvaluation'/>" target="_blank">Add Evaluation</a> 
								<a href="<c:url value='/internship_system/seeApplications'/>" target="_blank">See Applications</a>
							</c:if>
						</c:otherwise>
					</c:choose></td>
				<td>
					<table>
						<tr>
							<td>Internship Opportunities</td>
						</tr>
						<tr>
							<td>Search Job Title<form:form
									action="/internship_system/searchTitle.html" method="post">
									<input type="text" name="search" />
									<input type="submit" value="Enter" />
								</form:form></td>
						</tr>
						<tr>
							<td>Title</td>
							<td>Description</td>
							<td>Paid</td>
							<td>No Of Openings</td>
							<td>Company Name</td>
							<td>Industry</td>
							<td>More...</td>
						</tr>
						<c:forEach var="internView" items="${internView}"
							varStatus="status">

							<tr>
								<td>${internView.title}</td>
								<td>${internView.description}</td>
								<td>${internView.paidOrNo}</td>
								<td>${internView.noOfOpenings}</td>
								<td>${internView.companyname}</td>
								<td>${internView.industry}</td>
								<td><a
									href="<c:url value='/internship_system/internshipdetails/${internView[status.index].internshipID}' />">Details</a></td>

							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>