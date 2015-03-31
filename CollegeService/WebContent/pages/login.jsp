<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Sign On</title>
<link href="<s:url value="/css/main.css"/>" rel="stylesheet"
	type="text/css" />
</head>

<body>
<center>
<table>
	<s:form action="Login" method="post">
		<tr>
			<td colspan="2">Please enter your user name and password</td>
		</tr>
		<tr>
			<td colspan="2"><s:actionerror /> <s:fielderror /></td>
		</tr>

		<s:textfield key="username" />
		<s:password key="password" />
		<s:submit align="center" />

	</s:form>
</table>
</center>
</body>
</html>