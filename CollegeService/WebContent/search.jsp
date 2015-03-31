<html>
<head>
<title>Search Page</title>
</head>
<%@ page language='java'%>
<%@ page errorPage="/pages/searchError.jsp"%>
<%@ include file="/pages/title.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<body background="http://localhost:8080/StrutsApp/images/search_bg3.jpg">

<center>
<h4><font color="#999999ff"></font></h4>
</center>

<table id="results" align="center" cellspacing="2" cellpadding="3">
	<tr>
		<td align="left"><IMG
			src="http://localhost:8080/StrutsApp/images/coll2.jpg" width="110"
			height="68" /></td>
		<td><IMG src="http://localhost:8080/StrutsApp/images/coll1.jpg"
			width="110" height="68" /></td>
		<td><IMG src="http://localhost:8080/StrutsApp/images/coll4.jpg"
			width="110" height="68" /></td>
		<td align="right"><IMG
			src="http://localhost:8080/StrutsApp/images/Oxford.jpg" width="110"
			height="68" /></td>
	</tr>
</table>
<hr>
<center>
<h4><font color="#999999ff"></font></h4>
</center>

<table id="results" align="center" border="4" cellspacing="2"
	cellpadding="3" frame="hsides" rules="all" bgcolor="#FFFF00">
	<font color="#9999ff" size=5">Please Fill in the Following
	College Search Criteria</font>
</table>

<s:form name="search" method="POST" action="/search/Search.action"
	validate="true">
	<table align="center" id="search" border="2" cellspacing="2"
		cellpadding="3" frame="hsides" rules="all" bgcolor="99FFFF">
		<tr>
			<s:textfield label="TOEFL Score" name="toefl" size="19"
				maxlength="10" />
		</tr>
		<tr>
			<s:select label="Tuition & Fees($)" name="tuition_fee" size="1"
				headerKey="1" headerValue="-- Please Select --"
				list="{'Less than 5000','Less than 10000','Less than 15000','Less than 20000','Less than 25000','Less than 30000','Less than 35000','Less than 40000', 'Less than 45000','No Preference'}" />
		</tr>
		<tr>
			<s:select label="Type" name="type" size="1" headerKey="1"
				headerValue="-- Please Select --"
				list="{'Public School','Private School','No Preference'}" />
		</tr>
		<tr>
			<s:select label="Category" name="category" size="1" headerKey="1"
				headerValue="-- Please Select --"
				list="{'Research University','Liberal Arts','No Preference'}" />
		</tr>
		<tr>
			<s:select label="Setting" name="setting" size="1" headerKey="1"
				headerValue="-- Please Select --"
				list="{'Urban','Suburban','Rural','No Preference'}" />
		</tr>
		<tr>
			<s:select label="Rank(US News)" name="rank" size="1" headerKey="1"
				headerValue="-- Please Select --"
				list="{'Top 25','Top 50','Top 75','Top 100','Top 150','No Preference'}" />
		</tr>
		<tr>
			<s:select label="Recommandation Letters" name="recommand_letter"
				size="1" headerKey="1" headerValue="-- Please Select --"
				list="{'Not Required','Required','No Preference'}" />
		</tr>
		<tr>
			<s:select label="Financial Aid" name="Int_Finacial_Aid" size="1"
				headerKey="1" headerValue="-- Please Select --"
				list="{'only offer financial aid for international students','No Preference'}" />
		</tr>
		<tr>
			<td></td>
			<s:submit align="center" value="Submit" />
		</tr>
	</table>
</s:form>
</body>
</html>
