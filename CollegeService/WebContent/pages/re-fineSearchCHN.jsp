<html>
<head>
<title>Search Page</title>
<STYLE TYPE="text/css">
TD {
	font-family: Arial;
	font-size: 9pt;
}

TH {
	font-family: Arial;
	font-size: 9pt;
}
</STYLE>
<link rel="shortcut icon"
	href="http://www.usacollegesearch.com/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="author" content="usa college search" />
<meta name="netinsert" content="0.0.1.3.4.4.1" />
<meta name="description" content="US College Search " />
<meta name="Keywords" content="college search, american colleges" />
</head>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language='java'%>
<%@ page errorPage="/pages/searchError.jsp"%>
<%@ include file="/pages/titleCHN_search.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<body background="/CollegeService/images/search_bg3.jpg">

<center>
<h4><font color="#999999ff"></font></h4>
</center>

<hr>
<center>
<h4><font color="#999999ff"></font></h4>
</center>
<table align="center" border="0" frame="hsides" rules="bottom">
	<tr>
		<td>
		<center><font color="red" size=5">输入错误， 请按下列条目输入你的搜索条件</font></center>
		</td>
	</tr>
</table>

<s:form name="search" method="POST" action="/search/SearchCHN.action"
	validate="true">
	<table align="center" id="search" border="2" cellspacing="2"
		cellpadding="3" frame="hsides" rules="all" bgcolor="99FFFF">
		<tr>
			<s:textfield label="托福分数" name="toefl" size="13" maxlength="10"
				value="" />
		</tr>
		<tr>
			<s:textfield label="SAT-I 分数" name="sat" size="13" maxlength="10"
				value="" />
		</tr>
		<tr>
			<s:select label="学校排名" name="rank" size="1" headerKey="1"
				headerValue="-- 请选择 --"
				list="{'前 25','前 50','前 75','前 100','前 150', '前 200','无倾向'}" />
		</tr>
		<tr>
			<s:select label="学费($)" name="tuitionFee" size="1" headerKey="1"
				headerValue="-- 请选择 --"
				list="{'少于 5000','少于 10000','少于 15000','少于 20000','少于 25000','少于 30000','少于 35000','少于 40000', '少于 45000','无倾向'}" />
		</tr>
		<tr>
			<s:select label="学校类别" name="type" size="1" headerKey="1"
				headerValue="-- 请选择 --" list="{'公立','私立','无倾向'}" />
		</tr>
		<tr>
			<s:select label="学校所处环境" name="setting" size="1" headerKey="1"
				headerValue="-- 请选择 --" list="{'都市','郊区','远郊','无倾向'}" />
		</tr>
		<tr>
			<s:select label="推荐信" name="recommandLetter" size="1" headerKey="1"
				headerValue="-- 请选择 --" list="{'不需要','需要','无倾向'}" />
		</tr>
		<tr>
			<s:select label="学校种类" name="category" size="1" headerKey="1"
				headerValue="-- 请选择 --" list="{'研究性大学','文理学院','无倾向'}" />
		</tr>
		<tr>
			<s:select label="经济资助" name="intlFinacialAid" size="1" headerKey="1"
				headerValue="-- 请选择 --" list="{'限于提供国际学生经济资助的学校','无倾向'}" />
		</tr>
		<tr>
			<td><s:submit align="center" value="提交" /></td>
		</tr>
		<!--<s:reset align="center" value="重填" />-->
	</table>
</s:form>
<!-- Copyright information -->
<hr>
<%@ include file="/pages/footer.jsp"%>
</body>
</html>
