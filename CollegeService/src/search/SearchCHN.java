package search;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import util.DAO;
import beans.RequestBean;
import beans.School;

import com.opensymphony.xwork2.ModelDriven;

//@Validation()

public class SearchCHN extends Search implements ModelDriven {

	private HttpServletRequest request;

	private ArrayList<School> schoolList;
	private String searchCriteria;
	private int numOfSchools = 0;
	private String searchAction = null;

	public void setServletRequest(HttpServletRequest request) {

		this.request = request;
	}

	public String execute() throws Exception {

		schoolList = new ArrayList<School>();

		try {

			// Map session = ActionContext.getContext().getSession();
			searchCriteria = getRawQueryString();

			if (searchCriteria == null || searchCriteria.equals(""))
				return INPUT;

			String queryString = getQuery();

			schoolList = searchDB(queryString);

			if (schoolList != null) {
				numOfSchools = schoolList.size();
			}

			try {
				Collections.sort(schoolList, new comparator());
			} catch (Exception e) {
				return ERROR;
			}

			// session.put("SchoolList", SchoolList);
			// request.setAttribute("queryString", rawQuery);
			// rd =
			// this.getServletContext().getRequestDispatcher("/jsp/success.jsp");
		} catch (Exception e) {
			throw new Exception(
					"Error occured while getting the result due to ", e);

		}
		return SUCCESS;

	}

	public ArrayList<School> getschoolList() throws Exception {

		return schoolList;
	}

	public void setSchoolList(ArrayList<School> schoolList) {

		this.schoolList = schoolList;
	}

	public String getSearchCriteria() throws Exception {

		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {

		this.searchCriteria = searchCriteria;
	}

	public int getNumOfSchools() throws Exception {

		return numOfSchools;
	}

	public void setNumOfSchools(int numOfSchools) {

		this.numOfSchools = numOfSchools;
	}

	public String getSearchAction() throws Exception {

		return searchAction;
	}

	public void setSearchAction(String searchAction) {

		this.searchAction = searchAction;
	}

	protected String getQuery() {

		StringBuffer sb = new StringBuffer();

		Enumeration parameterList = request.getParameterNames();

		sb.append("SELECT * FROM ");
		sb.append("school WHERE ");

		String elementName = "";
		String elementValue = "";

		while (parameterList.hasMoreElements()) {

			elementName = parameterList.nextElement().toString();
			elementValue = request.getParameter(elementName);

			if (elementValue != null && !elementValue.equals("")
					&& !elementValue.equalsIgnoreCase("无倾向")
					&& !elementValue.equalsIgnoreCase("1")) {
				if (sb.indexOf("=") > 0)
					sb.append(" AND ");
				sb.append(elementName + "=");
				sb.append("\'" + elementValue + "\'");
				// if (parameterList.hasMoreElements())
				// sb.append(" AND ");
			}
			// if (parameterList.hasMoreElements())
			// sb.append(" AND ");
			// else

		}
		if (sb.length() > 0)
			sb.append(";");

		// return sb.toString();
		if (sb != null && sb.length() > 0)
			return refineQuery(sb.toString());
		else
			return null;
	}

	private String getRawQueryString() {

		StringBuffer sb = new StringBuffer();

		Enumeration parameterList = request.getParameterNames();

		String elementName = "";
		String elementValue = "";

		while (parameterList.hasMoreElements()) {

			elementName = parameterList.nextElement().toString();
			elementValue = request.getParameter(elementName);

			if (elementValue != null && !elementValue.equals("")
					&& !elementValue.equalsIgnoreCase("无倾向")
					&& !elementValue.equalsIgnoreCase("1")) {
				if (sb.indexOf("=") > 0)
					sb.append(", ");
				sb.append(elementName + "=");
				sb.append("\'" + elementValue + "\'");
			}
		}

		return sb.toString();

	}

	public String refineQuery(String st) {

		st = st.replaceAll("rank=", "Rank_Overall<=");
		st = st.replaceAll("tuitionFee=", "tuition_fee<");
		st = st.replaceAll("toefl=", "toefl<=");
		st = st.replaceAll("sat=", "SAT_1_25_percent<=");
		st = st.replaceAll("intlFinacialAid", "Int_Finacial_Aid");
		st = st.replaceAll("recommandLetter", "Recommand_Letter");

		st = st.replaceAll("少于 ", "");
		st = st.replaceAll("前", "");
		st = st.replaceAll("名", "");
		st = st.replaceAll("公立", "Public");
		st = st.replaceAll("私立", "Private");
		st = st.replaceAll("限于提供国际学生经济资助的学校", "yes");
		st = st.replaceAll("都市", "Urban");
		st = st.replaceAll("郊区", "Suburban");
		st = st.replaceAll("远郊", "Rural");
		st = st.replaceAll("需要", "Required");
		st = st.replaceAll("不需要", "Not Required");
		st = st.replaceAll("研究性大学", "National University");
		st = st.replaceAll("文理学院", "Liberal Arts College");
		st = st.replaceAll("size='大型：多于15000学生'", "size>15000");
		st = st.replaceAll("size='大型：多于15000学生';", "size>15000");
		st = st.replaceAll("size='中型：2000至15000学生'",
				"size BETWEEN 2000 AND 15000");
		st = st.replaceAll("size='中型：2000至15000学生';",
				"size BETWEEN 2000 AND 15000");
		st = st.replaceAll("size='小型：少于2000学生'", "size<2000");
		st = st.replaceAll("size='小型：少于2000学生';", "size<2000");

		if (st.indexOf("searchAction") >= 0) {

			if (searchAction != null) {
				st = st.replaceAll("searchAction='Top 300';",
						"category='National University' AND Rank_Overall <= 300");
				st = st.replaceAll("searchAction='Liberal Arts College';",
						"category='Liberal Arts College' AND Rank_Overall <= 300");
				st = st.replaceAll("searchAction='Foriegn_Student';",
						"Percent_Foriegn_Student>0");
				st = st.replaceAll("searchAction='Asian_Student';",
						"Percent_Asian_Student>0");
				st = st.replaceAll("searchAction='Low AcceptRate';",
						"Accept_Rate<50");
				st = st.replaceAll("searchAction='High AcceptRate';",
						"Accept_Rate>50");
				st = st.replaceAll("searchAction='Best_Value';",
						"Rank_Best_Value<=50");
			}
		}

		if (st != null && st.length() > 0 && st.indexOf("category") < 0) {
			st = st.replaceAll(";", " AND category='National University';");
		}

		return st;
	}

	private ArrayList searchDB(String query) throws Exception {

		ArrayList al = new ArrayList();

		DAO dao = new DAO();

		try {
			Connection con = dao.getDefaultDBConnection();
			ResultSet rs = dao.queryDB(con, query);
			al = dao.getResult(rs);
		} catch (Exception e) {
			throw e;

		}
		return al;
	}

	private RequestBean requestBean = new RequestBean();

	public RequestBean getModel() {
		return requestBean;
	}

	/*
	 * private String type, setting, intlFinacialAid, tuitionFee, category,
	 * rank, recommandLetter; private int toefl, sat;
	 * 
	 * //@IntRangeFieldValidator(type = ValidatorType.FIELD, shortCircuit =
	 * true, message = "Toefl score should be between 0-120", min = "0", max =
	 * "120")
	 * 
	 * public void setToefl(int toefl) { this.toefl = toefl; }
	 * 
	 * public void setSat(int sat) { this.sat = sat; }
	 * 
	 * public void setTuitionFee(String tuitionFee) { this.tuitionFee =
	 * tuitionFee; } public void setRank(String rank) { this.rank = rank; }
	 * public void setType(String type) { this.type = type; } public void
	 * setSetting(String setting) { this.setting = setting; } public void
	 * setIntlFinacialAid(String intlFinacialAid) { this.intlFinacialAid =
	 * intlFinacialAid; } public void setCategory(String category) {
	 * this.category = category; } public void setRecommandLetter(String
	 * recommandLetter) { this.recommandLetter = recommandLetter; }
	 * 
	 * 
	 * public String getType() { return type; } public String getRank() { return
	 * rank; } public String getSetting() { return setting; } public String
	 * getIntlFinacialAid() { return intlFinacialAid; } public int getToefl() {
	 * return toefl; } public int getSat() { return sat; } public String
	 * getTuitionFee() { return tuitionFee; } public String getCategory() {
	 * return category; } public String getRecommandLetter() { return
	 * recommandLetter; }
	 */

	/*
	 * private ArrayList<School> dummyTest() throws Exception {
	 * 
	 * ArrayList al = new ArrayList<School>();
	 * 
	 * School School = new School();
	 * 
	 * School.setName("name");
	 * 
	 * School.setType("type"); School.setSize("333"); School.setCity("city");
	 * School.setState("state"); School.setCost("3444"); School.setRank("2");
	 * School.setWebsite("website");
	 * 
	 * al.add(School);
	 * 
	 * return al;
	 * 
	 * }
	 */

	class comparator implements Comparator {

		public int compare(Object a, Object b) {

			String da = "", db = "";

			try {
				if (searchAction != null) {
					if (searchAction.equals("Foriegn_Student")) {
						da = ((School) a).getForiegnPercent();
						db = ((School) b).getForiegnPercent();
					} else if (searchAction.equals("Asian_Student")) {
						da = ((School) a).getAsianPercent();
						db = ((School) b).getAsianPercent();
					} else if (searchAction.endsWith("AcceptRate")) {
						da = ((School) a).getAcceptRate();
						db = ((School) b).getAcceptRate();
					}

					else {
						da = ((School) a).getRank();
						db = ((School) b).getRank();
					}
					if (searchAction.endsWith("High AcceptRate"))
						return (Float.valueOf(db).compareTo(Float.valueOf(da)));
					else
						return (Float.valueOf(da).compareTo(Float.valueOf(db)));
				} else {
					da = ((School) a).getName();
					db = ((School) b).getName();
					// da = ((School)a).getTuitionFee();
					// db = ((School)b).getTuitionFee();
				}
			} catch (Exception e) {

				e.printStackTrace();
				// throw e;
				return 0;
			}

			// return (Float.valueOf(da).compareTo(Float.valueOf(db)));
			return (da.compareTo(db));

		}
	}
}
