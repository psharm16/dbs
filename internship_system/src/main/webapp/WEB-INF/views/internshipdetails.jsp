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
<tbody>
<tr><td><b><u>Complete Details</u></b></td></tr>
<!-- psh:add if student -->
<tr><td><b><u>Click Apply to be considered for Job Position</u></b></td></tr>
<c:forEach var="detail" items="${internshipDetail}"  varStatus="status">  
    <tr>  
     <td>${detail.TITLE}</td>  
     <td>${detail.DESCRIPTION}</td>  
     <td>${detail.COMPANYNAME}</td>  
     <td>${detail.NOOFOPENINGS}</td>  
     <td>${detail.INDUSTRY}</td>  
    
   
    </tr>  
   </c:forEach> 
   <tr>
   <!-- psh:add if student -->
    <td><form:form method = "post" action = "/internship_system/apply.html">
         <table>
            <tr>
               <td>
                  <input type = "submit" value = "Apply"/>
               </td>
            </tr>
         </table>  
      </form:form></td></tr>
   </tbody> 
   </table>
</body>
</html>