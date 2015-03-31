package search;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;

import util.DAO;
import util.HibernateUtil;
import beans.School;

//@Validation()

public class GetListsCHN extends Search {

	private static final int MAX_RESULTS = 25;
	private HttpServletRequest request;

	private List<School> schoolList;
	private int numOfSchools = 0;
	private String searchAction = null;

	public static void main(String[] args) {
		GetListsCHN g = new GetListsCHN();
		try {
			g.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void setServletRequest(HttpServletRequest request) {

		this.request = request;
	}

	public String execute() throws Exception {

		// schoolList;

		try {

			// String queryString = getQuery();
			// schoolList = searchDB(queryString);

			schoolList = getSchools();

			if (schoolList != null) {

				numOfSchools = schoolList.size();
			}

			try {
				if ("High AcceptRate".equalsIgnoreCase(searchAction))
					Collections.sort(schoolList, new compAcptRateDec());
				else if ("Low AcceptRate".equalsIgnoreCase(searchAction))
					Collections.sort(schoolList, new compAcptRateInc());
				else if ("Accounting".equalsIgnoreCase(searchAction))
					Collections.sort(schoolList, new compAcptRateInc());
				// else
				// Collections.sort(schoolList, new comparator());
			} catch (Exception e) {
				return ERROR;
			}
		} catch (Exception e) {
			// throw new Exception(
			// "Error occured while getting the result due to ", e);
			e.printStackTrace();
			return ERROR;
		}

		Iterator it = schoolList.iterator();

		while (it.hasNext()) {

			System.out.println("school name = "
					+ ((School) it.next()).getName());
		}

		// System.out.println("numOfSchools = " + numOfSchools);
		return SUCCESS;

	}

	public List<School> getschoolList() throws Exception {

		return schoolList;
	}

	public void setSchoolList(List<School> schoolList) {

		this.schoolList = schoolList;
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

		sb.append("SELECT * FROM SCHOOL WHERE ");
		// sb.append("from SCHOOL where ");

		// sb.append("Top_List school WHERE ");

		String elementName = "";
		String elementValue = "";

		while (parameterList.hasMoreElements()) {

			elementName = parameterList.nextElement().toString();
			elementValue = request.getParameter(elementName);

			if (elementValue != null && !elementValue.equals("")) {
				if (sb.indexOf("=") > 0)
					sb.append(" AND ");
				sb.append(elementName + "=");
				sb.append("\'" + elementValue + "\'");
			}
		}
		if (sb.length() > 0)
			sb.append(";");

		if (sb != null && sb.length() > 0) {
			System.out.println("query string = " + refineQuery(sb.toString()));
			return refineQuery(sb.toString());
		} else
			return null;
	}

	protected String getQueryString() {

		StringBuffer sb = new StringBuffer();

		Enumeration parameterList = request.getParameterNames();

		sb.append("select * from school where ");
		// sb.append("from school");

		String elementName = "";

		String elementValue = "";

		while (parameterList.hasMoreElements()) {

			elementName = parameterList.nextElement().toString();
			elementValue = request.getParameter(elementName);

			if (elementValue != null && !elementValue.equals("")) {
				if (sb.indexOf("=") > 0)
					sb.append(" AND ");
				sb.append(elementName + "=");
				sb.append("\'" + elementValue + "\'");
			}
		}
		if (sb.length() > 0)
			sb.append(";");

		if (sb != null && sb.length() > 0) {
			System.out.println("query string = " + refineQuery(sb.toString()));
			return refineQuery(sb.toString());
		} else
			return null;
	}

	public String refineQuery(String st) {

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
			// for test
			st = st.replaceAll("searchAction='Accounting';",
					"Rank_Best_Value<=50");

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

	public List<School> getSchools() {

		Session session = HibernateUtil.getSessionFactory().openSession();

		String queryString = getQueryString();

		// if (!queryString.endsWith(";"))
		// queryString = queryString + ";";

		// queryString =
		// "select name from school where category='National University' and Rank_Overall <= 300";
		Query query = session.createSQLQuery(queryString).addEntity(
				School.class);
		;
		query.setTimeout(10);
		query.setReadOnly(true);
		query.setCacheable(true);
		query.setMaxResults(MAX_RESULTS);

		session.beginTransaction();

		List<School> schools = query.list();

		System.out.println("schools size =" + schools.size());

		session.getTransaction().commit();

		session.close();

		return schools;
	}

	class comparator implements Comparator {

		public int compare(Object a, Object b) {

			String da = "", db = "";

			try {
				da = ((School) a).getRank();
				db = ((School) b).getRank();
				// da = ((School)a).getName();
				// db = ((School)b).getName();
				// da = ((School)a).getTuitionFee();
				// db = ((School)b).getTuitionFee();
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return (Float.valueOf(da).compareTo(Float.valueOf(db)));
			// return (da.compareTo(db));

		}
	}

	class compAcptRateInc implements Comparator {
		public int compare(Object a, Object b) {
			String da = "", db = "";
			try {
				da = ((School) a).getAcceptRate();
				db = ((School) b).getAcceptRate();
				// da = ((School)a).getTuitionFee();
				// db = ((School)b).getTuitionFee();
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return (Float.valueOf(da).compareTo(Float.valueOf(db)));
			// return (da.compareTo(db));
		}
	}

	class compAcptRateDec implements Comparator {

		public int compare(Object a, Object b) {

			String da = "", db = "";
			try {
				da = ((School) a).getAcceptRate();
				db = ((School) b).getAcceptRate();
				// da = ((School)a).getTuitionFee();
				// db = ((School)b).getTuitionFee();
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return (Float.valueOf(db).compareTo(Float.valueOf(da)));
			// return (da.compareTo(db));
		}
	}
}
