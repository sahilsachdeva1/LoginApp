<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>

<%!public void jspInit() {
		// Reset hit counter.
		int hitCount = 0;
	}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" href="css/style.css" />

<title>Home Page</title>
</head>


<body>
	<center>
		<h2>Home Page</h2>
	</center>

<div><table style="width:100%">
  <tr>
    <th>Firstname</th>
    <th>Session ID </th> 
    <th>Last login time</th>
    <th>Home Page visited</th>
     <th>WebSite visited</th>
  </tr>
  <tr>
    <td><%=session.getAttribute("userName")%></td>
    <td> <%=session.getId()%></td> 
    <td><%=new Date(session.getLastAccessedTime())%></td>
    
     <td>
    <%
		Integer hitsCount = (Integer) request.getServletContext().getAttribute("hitCounter");
		if (hitsCount == null || hitsCount == 0) {
			/* First visit */
			out.println("You have vistied 1 time on Home page!");
			hitsCount = 1;
		} else {
			/* return visit */
					hitsCount += 1;
			out.println("You have vistied "+hitsCount+ " times on Home page!");
			
		}
		request.getServletContext().setAttribute("hitCounter", hitsCount);
	%>
    </td>
     <td><%= request.getServletContext().getAttribute("websiteCounter")%></td>
    
  </tr>
 
</table></div>


	<div style="text-align: right">
		<a href="LogoutServlet">Logout</a>
	</div>
</body>
</html>