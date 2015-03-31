
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

</head>

<body>

<table class="cust">
	<tr>
		<th>Name</th>
		<th>Age</th>
		<th>Email</th>
	</tr>
	<s:iterator value="customers" id="customer" status="cust_stat">
		<tr
			class="<s:if test="#cust_stat.odd == true">odd</s:if><s:else>even</s:else>">
			<td><s:property value="name" /></td>
			<td><s:property value="age" /></td>
			<td><s:property value="email" /></td>
		</tr>
	</s:iterator>
</table>

</body>
</html>
