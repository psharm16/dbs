<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table>
<tr><td><b><u>Internship Opportunities</u></b></td></tr>

<tbody>
<tr><td>Search Job Title<form:form action="/internship_system/searchTitle.html" method="post">
<input type="text" name="search" /><input type="submit" value="Enter" />
</form:form></td></tr>
<c:forEach var="internView" items="${internView}"  varStatus="status">  
    <tr>  
     <td>${internView.TITLE}</td>  
     <td>${internView.DESCRIPTION}</td>  
     <td>${internView.COMPANYNAME}</td>  
     <td>${internView.NOOFOPENINGS}</td>  
     <td>${internView.INDUSTRY}</td>  
     <td><a href="<c:url value='/internship_system/internshipdetails/${internView[status.index].DESCRIPTION}' />" >Details</a></td>
   
    </tr>  
   </c:forEach> 
   </tbody> 
   </table>
</body>
</html>