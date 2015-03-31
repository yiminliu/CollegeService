<html>
<head>
<title>Search Page</title>
</head>
<%@ page language='java'%>
<%@ page errorPage="searchError.jsp"%>
<%@ include file="title.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<body>
<body>
<table id="error" align="center" border="0" cellspacing="1"
	cellpadding="1">
	<tr>
		<td><font color="red" size=5">An Error Occured with Your
		Input</font></td>
	</tr>
</table>
<p>
<table id="results" align="center" border="4" cellspacing="2"
	cellpadding="3" frame="hsides" rules="all" bgcolor="#FFFF00">
	<font color="#9999ff" size=5">Please Fill in the Following
	College Search Criteria</font>
</table>


<s:form name="search" method="POST" action="Search" validate="true">
	<table align="center" id="search" border="2" cellspacing="2"
		cellpadding="3" frame="hsides" rules="all" bgcolor="99FFFF">
		<tr>
			<s:textfield label="TOEFL Score" name="toefl_score" size="19"
				maxlength="10" />
		</tr>
		<tr>
			<s:select label="Tuition & Fees($)" name="tuition_fee" size="1"
				headerKey="1" headerValue="-- Please Select --"
				list="{'Less than 5000','Less than 10000','Less than 15000','Less than 20000','Less than 25000','Less than 30000','Less than 35000','Less than 40000','No Preference'}" />
		</tr>
		<tr>
			<s:select label="School Type" name="type" size="1" headerKey="1"
				headerValue="-- Please Select --"
				list="{'Public School','Private School','No Preference'}" />
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
			<s:select label="Financial Aid" name="Int_Finacial_Aid" size="1"
				headerKey="1" headerValue="-- Please Select --"
				list="{'only offer financial aid for international students','No Preference'}" />
		</tr>
		<tr>
			<td></td>
			<s:submit align="center" value="Submit" />
		</tr>
		<!-- 
  <tr>
     <s:textfield label="SAT Score" name="english_score" size="19" maxlength="10" />
  </tr>
  <tr>
   <td><b>Your SAT Math Score:</b></td>
   	<td><input type="text" name="math_score" value="" size="19" ></td>
  </tr>
<tr>
  <td><b>Your GPA:</b></td>
   <td><input type = "text" name="gpa" value=""  size="19" ><td>
   </td>
  </tr>
  <tr>
   <td><b>Major:</b></td>
   <td>
    <input type="text" name="major" value="" size="19" ></td>
  </tr>
  <tr>
   <s:select label="SAT Requirement" name="sat_requirement" size="1" headerKey="1" headerValue="-- Please Select --"
    list="{'Only SAT I required','1 SAT II Required','2 SAT II Required','3 SAT II Required''No Preferance'}" />
  </tr>
  <tr>
   <s:select label="Size" name="size" size="1" headerKey="1" headerValue="-- Please Select --"
    list="{'Large (more than 15,000 students)','Medium (2,000 - 15,000 students)','Small (fewer than 2,000 students)','No Preference'}" />
  </tr>
  <tr>
   <s:select label="Percent of Applicants Accepted" name="selectivity" size="1" headerKey="1" headerValue="-- Please Select --"
    list="{'Less than 25% accepted','25%-50% accepted','25%-75% accepted','100% accepted','No Preference'}" />
  </tr>
  -->
	</table>
</s:form>

<hr>
<%@ include file="copyrightfooter.jsp"%>
</body>
</html>
