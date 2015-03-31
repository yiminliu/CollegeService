<html>
<head>
<title>Main Search Landing Page</title>
</head>
<%@ page language='java'%>
<%@ page errorPage="/pages/searchError.jsp"%>
<%@ include file="/pages/title.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<body background="http://localhost:8080/StrutsApp/images/search_bg3.jpg">


<center>
<h4><font color="#999999ff"></font></h4>
</center>

<table id="results" align="center" border="2" cellspacing="2"
	cellpadding="3" frame="border" rules="all">
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

<table align="center" border="1" cellspacing="2" cellpadding="3"
	frame="vsides" rules="all" bgcolor="#FFFF00">
	<font color="#9999ff" size=5">Search Colleges with Your Own
	Criteria</font>
</table>
<br>
<table id="top" align="center">
	<tr>
		<input type="image" id="fineSearch"
			src="http://localhost:8080/StrutsApp/images/btn_startnow.gif"
			width="196" height="35" alt="College Search"
			onClick="window.location='http://localhost:8080/StrutsApp/fineSearch.jsp'" />
	</tr>
</table>


<table align="center" border="1" cellspacing="2" cellpadding="3"
	frame="vsides" rules="all" bgcolor="#FFFF00">
	<font color="#9999ff" size=5">Click below to Find The Best
	Colleges</font>
</table>
<br>
<table align="center">
	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=100">Top
			100 Colleges (Overal Ranking)</a></li>
		</ul>
		</td>
		<td>
		<ul>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Liberal Arts College">Top
			Liberal Arts Colleges</a></li>
		</ul>
		</td>
	</tr>

	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Business Colleges</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Accounting</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Entrepreneurship</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Finance</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Insurance</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			International Business</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Management</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Management Information Systems</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Marketing</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Production/Operations Management</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Quantitative Analysis</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Real Estate</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Supply Chain Management/Logistics</a></li>
		</ul>
		</td>
		<td>
		<ul>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Engineering">Top
			Colleges in Engineering Programs</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Aerospace/Aeronautical/Astronautical</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Agricultural</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Biomedical/Biomedical Engineering</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Chemical</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Civil</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Computer Engineering</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Electrical/Electronic/Communications</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Engineering Science/Engineering Physics</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Environmental / Environmental Health</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Industrial/Manufacturing</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Materials</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Business">Top
			Mechanical</a></li>

		</ul>
		</td>
	</tr>

	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Agriculture">Best
			Value Colleges(quality/price ratio and the scholarships or grants</a></li>
		</ul>
		</td>
	</tr>
	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Forien_Student">Top
			100 Colleges with Lowest acceptance rates</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Forien_Student">Top
			100 Colleges with Most International Students</a></li>
		</ul>
		</td>
		<td>
		<ul>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Forien_Student">Top
			100 Colleges with Highest acceptance rates</a></li>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Asian_Student">Top
			100 Colleges with Most Asian-American Students</a></li>
		</ul>
		</td>
	</tr>

	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="http://localhost:8080/StrutsApp/search/Search.action?searchAction=Agriculture">No
			SAT/ACT Required Colleges</a></li>
		</ul>
		</td>
	</tr>
</table>
<!-- Copyright information -->
<hr>
<%@ include file="/pages/copyrightfooter.jsp"%>
</body>
</html>
