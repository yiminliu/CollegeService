<html>
<head>
<title>Main Search Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META name="Keywords" content="留学,出国留学,留学网,出国留学网,美国留学" />
</head>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/pages/mainSearchErrorCHN.jsp"%>
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

<table align="center" border="1" cellspacing="2" cellpadding="3"
	frame="vsides" rules="all" bgcolor="#FFFF00">
	<center><font color="#9999ff" size=5">搜索引擎--按照你的条件搜索你的大学</font></center>
</table>
<br>
<table id="top" align="center">
	<tr align="center">
		<center><input type="image" id="fineSearch"
			src="/CollegeService/images/search_button.jpg" width="176"
			height="30" alt="College Search"
			onClick="window.location='/CollegeService/getSchoolsCHN.jsp'" /></center>
	</tr>
</table>
<br>
<TABLE align="center">
	<IMG src="/CollegeService/images/bar1.jpg" width=100% height="7" />
</TABLE>
<br>
<table align="center" border="1" cellspacing="2" cellpadding="3"
	frame="vsides" rules="all" bgcolor="#FFFF00">
	<center><font color="#9999ff" size=5">2008年美国大学排名</font></center>
</table>
<br>
<table align="center">
	<s:url action="SearchCHN" id="nationalTop" namespace="/search">
		<s:param name="searchAction" value="Top300" />
	</s:url>
	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="/CollegeService/search/GetListCHN.action?searchAction=Top 300">最佳全国性大学</a></li>
			<!-- <li><a href='<s:property value="#nationalTop" />'>最佳全国性大学</a></li>-->
		</ul>
		</td>
		<td>
		<ul>
			<li><a
				href="/CollegeService/search/GetListCHN.action?searchAction=Liberal Arts College">最佳文理学院</a></li>
		</ul>
		</td>
	</tr>

	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="/CollegeService/search/GetListCHN.action?searchAction=Low AcceptRate">前100所录取率最低的大学</a></li>
		</ul>
		</td>
		<td>
		<ul>
			<li><a
				href="/CollegeService/search/GetListCHN.action?searchAction=High AcceptRate">前100所录取率最高的大学</a></li>
		</ul>
		</td>
	</tr>
	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestBusiness">最佳商学院</a></li>
			<ul>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestAccounting">最佳会计专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestEntrepreneurship">最佳工业企业专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestFinance">最佳金融专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestInsurance">最佳保险专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestInternational">最佳国际商务专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestManagement">最佳管理专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestInformation">最佳信息系统管理专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestMarketing">最佳市场行销专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestProduction_Operations">最佳生产及运营管理专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestQuantitative_Analysis">最佳数字化分析专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestReal_Estate">最佳房地产专业</a></li>
				<li><a
					href="/CollegeService/search/GetBestSchoolsInMajorCHN.action?searchAction=BestLogistics">最佳物流专业</a></li>
			</ul>
		</ul>
		</td>
		<td>
		<ul>
			<li><a
				href="/CollegeService/search/GetListCHN.action?searchAction=Engineering">最佳工学院</a></li>
			<ul>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestAerospace">最佳航天航空专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestAgricultural">最佳农业工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestBiomedical">最佳生物医学及生物医学工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestChemical">最佳化学工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestCivil">最佳土木建筑工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestComputer">最佳计算机工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestEE">最佳电气/电子/通讯工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestEngineeringScience">最佳工程科学及工程物理工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestEnvironmental">最佳环境及环境卫生工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestIndustrialManufacturing">最佳工业制造专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestMaterials">最佳材料工程专业</a></li>
				<li><a
					href="/CollegeService/search/GetListCHN.action?searchAction=BestMechanical">最佳机械工程专业</a></li>
			</ul>
		</ul>
		</td>
	</tr>

	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="/CollegeService/search/GetListCHN.action?searchAction=Best_Value">最具价值大学<font
				size="2">(较高质量/学费比和获得奖学金机会)</font></a></li>
		</ul>
		</td>
	</tr>


	<tr aline="center">
		<td>
		<ul>
			<li><a
				href="/CollegeService/search/GetListCHN.action?searchAction=Agriculture">无需
			SAT/ACT成绩的学校</a></li>
		</ul>
		</td>
	</tr>
</table>
<!-- Copyright information -->
<hr>
<%@ include file="/pages/footer.jsp"%>
</body>
</html>
