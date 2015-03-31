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

TR { # .schools tr.odd {background-color:#fafbff;
	
}

#
.schools tr.even {
	background-color: #f4f4ff;
}
}
</STYLE>
</head>
<%@ page language="java" session="true"%>
<%@ page errorPage="searchError.jsp"%>

<body background="/CollegeService/images/search_bg3.jpg">
<TABLE class="schools" bgcolor="#ff6600" cellSpacing="0" cellPadding="0"
	border="0" width="100%">
	<s:set name="action" value="searchAction" />

	<TR valign="middle">
		<s:if test="#action=='Top 300'">
			<TD align="center"><font size=5">2008年最佳全国性大学排名</font></TD>
		</s:if>
		<s:elseif test="#action=='Liberal Arts College'">
			<TD align="center"><font size=5">2008年最佳文理学院排名</font></TD>
		</s:elseif>
		<s:elseif test="#action=='Low AcceptRate'">
			<TD align="center"><font size=5">2008年前100所录取率最低的大学</font></TD>
		</s:elseif>
		<s:elseif test="#action=='High AcceptRate'">
			<TD align="center"><font size=5">2008年前100所录取率最高的大学</font></TD>
		</s:elseif>
		<s:else>
			<TD align="center"><font size=5">大学名单</font></TD>
		</s:else>
	</TR>
</TABLE>
<hr>

<table id="results" align="center" border="4" cellspacing="2"
	cellpadding="3" frame="hsides" rules="all" bgcolor="#6698FF">
	<p>
	<table id="results" border="1" cellspacing="1" cellpadding="1"
		frame="hsides" rules="all">
		<!--<CAPTION>Coellege Information</CAPTION>-->

		<COLGROUP align="center">
			<TR BGCOLOR="#A0CFEC">
				<TH scope="col">学校</TH>
				<s:if test="#action=='Low AcceptRate' | #action=='High AcceptRate'">
					<TH scope="col">录取率<font size="1">(%)</font></TH>
				</s:if>
				<TH scope="col">综合排名</TH>
				<TH scope="col">学术指数</TH>
				<!-- <TH scope="col">Size(Students)</TH>
    <TH scope="col">Type</TH>-->
				<TH scope="col">学费/年<font size="1">($)</font></TH>
				<TH scope="col">食宿费/年<font size="1">($)</font></TH>
				<TH scope="col">申请费<font size="1">($)</font></TH>
				<TH scope="col">申请截至日<font size="1">(月-日)</font></TH>
				<TH scope="col">托福分数线</TH>
				<!--<TH scope="col">SAT/ACT分数<font size="1">(25th - 75th%)</font></TH>-->
				<TH scope="col">SAT/ACT分数</TH>
				<TH scope="col">SAT-II</TH>
				<!--<s:if test="searchAction==null">  
      <TH scope="col">Major(<s:property value="major" />) Rank</TH>
    </s:if>-->
				<s:if test="#action!='High AcceptRate' && #action!='Low AcceptRate'">
					<TH scope="col">录取率<font size="1">(%)</font></TH>
				</s:if>
				<!-- <TH scope="col">竞争程度</TH>-->
				<TH scope="col">本科学生数</TH>
				<TH scope="col">学校所在地</TH>
				<TH scope="col">对国际学生资助</TH>
				<!-- <TH scope="col">More</TH>-->
			</TR>
			<s:push value="schoolList">
				<s:iterator value="schoolList" id="school" status="school_stat">
					<s:if test="#school_stat.odd == true">
						<tr BGCOLOR="#99FFFF">
					</s:if>
					<s:else>
						<tr>
					</s:else>
					<td align="left"><a
						href="http://www.<s:property value="website"/>"><s:property
						value="name" /></a></td>
					<s:if
						test="#action=='Low AcceptRate' || #action=='High AcceptRate'">
						<td align="center"><s:property value="acceptRate" /></td>
					</s:if>
					<td align="center"><s:property value="rank" /></td>
					<td align="center"><s:property value="reputationScore" /></td>
					<!-- <td align="left"><s:property value="size" /></td>
                     <td align="center"><s:property value="type" /></td>-->
					<td align="center"><s:property value="tuitionFee" /></td>
					<td align="center"><s:property value="roomBoard" /></td>
					<td align="center"><s:property value="appFee" /></td>
					<td align="center"><s:property value="appDeadLine" /></td>
					<td align="center"><s:property value="toefl" /></td>
					<td align="center"><s:property value="sat1Min" /> - <s:property
						value="sat1Up" /></td>
					<td align="center"><s:property value="sat2" /></td>
					<!--<s:if test="searchAction==null">
<td align="center"><s:property value="majorRank" /></td>
</s:if>
<td align="center"><s:property value="selectivityRank" /></td>-->
					<s:if
						test="#action!='High AcceptRate' && #action!='Low AcceptRate'">
						<td align="center"><s:property value="acceptRate" /></td>
					</s:if>
					<!-- <td align="center"><s:property value="selectivityRank" /></td>-->
					<td align="center"><s:property value="size" /></td>
					<td align="center"><s:property value="location" /></td>
					<td align="center"><s:property value="aid" /></td>
					<!-- <td align="left"><s:property value="more" /></td>-->

				</s:iterator>
			</s:push>
	</table>
	<hr />
	<font size="1">注： SAT/ACT分数为所录取新生中25%至75%的 SAT/ACT分数</font> <br />
	<table align="center" cellspacing="8" cellpadding="2">
		<tr align="center">
			<td>
			<form><input type="button" value="返回主页"
				onClick="window.location='/CollegeService/mainSearchCHN.jsp'" /></form>
			</td>
		</tr>
	</table>
	<!-- Copyright information -->
	<hr>
	<%@ include file="/pages/footer.jsp"%>
</body>
</html>
