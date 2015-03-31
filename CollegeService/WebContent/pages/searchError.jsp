<%-- JSP container forwards request to this jsp, if any exceptions in processing --%>
<html>
<head>
<title>Search Error Page</title>
</head>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language='java'%>
<%@ page language='java'%>
<%@ page isErrorPage="true"%>
<%@ include file="title.jsp"%>

<body>
<% if (exception == null) { %>
<center>
<h3>搜索出现错误</h3>
</center>
<% } else { %>
<center>
<h3>Your search failed due to the following reason:</h3>
</center>
<center>
<h4>
<% exception.getMessage(); %>
</h4>
</center>
<% } %>
<p>
<p>
<center><a href="/CollegeService/fineSearchCHN.jsp">重新搜索?</a>
<center>
<p>
</body>
</html>

