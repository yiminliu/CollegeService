<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Success Page</title>
<STYLE TYPE="text/css">
TD {
	font-family: Arial;
	font-size: 8pt;
}

TH {
	font-family: Arial;
	font-size: 8pt;
}
</STYLE>
</head>
<%@ page language="java" session="true"%>
<%@ page errorPage="searchError.jsp"%>

<body background="/CollegeService/images/search_bg3.jpg">
<TABLE bgcolor="#ff6600" cellSpacing="0" cellPadding="0" border="0"
	width="100%">
	<TR valign="middle">
		<s:if test="searchAction!=null">
			<TD align="center"><font size=5">Top <s:property
				value="searchAction" /> Colleges</font></TD>
		</s:if>
		<s:else>
			<TD align="center"><font size=5">College List</font></TD>
		</s:else>
	</TR>
</TABLE>
<hr>

<table id="results" align="center" border="4" cellspacing="2"
	cellpadding="3" frame="hsides" rules="all" bgcolor="#FFFF00">

	<table>
		<tr>
			<s:if test="searchAction==null">
				<td>search criteria:<s:property value="searchCriteria" /></td>
			</s:if>
		</tr>
		<tr>
			<s:if test="searchAction==null">
				<td><font size="3" color="red"><s:property
					value="numOfSchools" /></font> colleges retrieved based on your search
				criteria</td>
			</s:if>
		</tr>
	</table>
	<p>
	<table id="results" border="1" cellspacing="1" cellpadding="1"
		frame="hsides" rules="all" bgcolor="99FFFF">
		<!--<CAPTION>Coellege Information</CAPTION>-->

		<COLGROUP align="center">
			<TR>
				<TH scope="col">College</TH>
				<TH scope="col">Rank</TH>
				<!-- <TH scope="col">Size(Students)</TH>
    <TH scope="col">Type</TH>-->
				<TH scope="col">Tuition+Fees<font size="1">($)</font></TH>
				<TH scope="col">Room/Board<font size="1">($)</font></TH>
				<TH scope="col">Appl. Fee<font size="1">($)</font></TH>
				<TH scope="col">Appl. Deadline<font size="1">(mm-dd)</font></TH>
				<TH scope="col">TOEFL</TH>
				<TH scope="col">SAT I<font size="1">(25th - 75th%)</font></TH>
				<TH scope="col">SAT II</TH>
				<s:if test="searchAction==null">
					<TH scope="col">Major(<s:property value="major" />) Rank</TH>
				</s:if>
				<TH scope="col">Selectivity Rank</TH>
				<TH scope="col">Acceptance Rate<font size="1">(%)</font></TH>
				<TH scope="col">Location</TH>
				<TH scope="col">Finacial Aid for Int. Students</TH>
				<TH scope="col">More</TH>
			</TR>
			<s:iterator value="schoolList" id="school" status="school_stat">
				<tr>
					<td align="left"><a
						href="http://www.<s:property value="website"/>"><s:property
						value="name" /></a></td>
					<td align="center"><s:property value="rank" /></td>

					<!-- <td align="left"><s:property value="size" /></td>
<td align="left"><s:property value="type" /></td>-->
					<td align="left"><s:property value="tuitionFee" /></td>
					<td align="left"><s:property value="roomBoard" /></td>
					<td align="left"><s:property value="appFee" /></td>
					<td align="left"><s:property value="appDeadLine" /></td>
					<td align="left"><s:property value="toefl" /></td>
					<td align="left"><s:property value="sat1Min" /> - <s:property
						value="sat1Up" /></td>
					<td align="left"><s:property value="sat2" /></td>
					<s:if test="searchAction==null">
						<td align="left"><s:property value="majorRank" /></td>
					</s:if>
					<td align="left"><s:property value="selectivityRank" /></td>
					<td align="left"><s:property value="acceptRate" /></td>
					<td align="left"><s:property value="city" />, <s:property
						value="state" /></td>
					<td align="left"><s:property value="aid" /></td>
					<td align="left"><s:property value="more" /></td>
				</tr>
			</s:iterator>
	</table>
	<hr />
	<table align="center" cellspacing="8" cellpadding="2">
		<tr align="center">
			<td>
			<form><s:if test="searchAction!=null">
				<input type="button" value="Another search"
					onClick="window.location='/CollegeService/topCollegeList.jsp'" />
			</s:if> <s:else>
				<input type="button" value="Another search"
					onClick="window.location='/CollegeService/fineSearch.jsp'" />
			</s:else></form>
			</td>
			<td>
			<form><input type="button" value="Return to the main page"
				onClick="window.location='/CollegeService/searchLanding.jsp'" /></form>
			</td>
		</tr>
	</table>
</body>
</html>
