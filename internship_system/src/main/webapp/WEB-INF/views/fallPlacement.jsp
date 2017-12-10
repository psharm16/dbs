<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<tbody>
<tr><td>Placement View</td></tr>
<c:forEach var="placementview" items="${placementview}"  varStatus="status">  
    <tr>  
     <td>${placementview.TITLE}</td>  
     <td>${placementview.DESCRIPTION}</td>  
     <td>${placementview.COMPANYNAME}</td>  
     <td>${placementview.NOOFOPENINGS}</td>  
     <td>${placementview.INDUSTRY}</td>  
    
   
    </tr>  
   </c:forEach> 
   </tbody> 
   </table>
</body>
</html>