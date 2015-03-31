package search;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;

import util.HibernateUtil;
import beans.School;

import com.opensymphony.xwork2.ActionSupport;

//@Validation()

public abstract class Search extends ActionSupport implements
		ServletRequestAware {

	protected HttpServletRequest request;

	private ArrayList<School> schoolList;
	private int numOfSchools = 0;

	public void setServletRequest(HttpServletRequest request) {

		this.request = request;
	}

	public abstract String execute() throws Exception;

	protected abstract String getQuery();

	protected abstract String refineQuery(String st);

	public void setSchoolList(ArrayList<School> schoolList) {

		this.schoolList = schoolList;
	}

	public int getNumOfSchools() throws Exception {

		return numOfSchools;
	}

	public void setNumOfSchools(int numOfSchools) {

		this.numOfSchools = numOfSchools;
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
					&& !elementValue.equalsIgnoreCase("No Preference")
					&& !elementValue.equalsIgnoreCase("1")) {
				if (sb.indexOf("=") > 0)
					sb.append(", ");
				sb.append(elementName + "=");
				sb.append("\'" + elementValue + "\'");
			}
		}

		return sb.toString();

	}

	/*
	 * private ArrayList searchDB(String query) throws Exception { // String
	 * result = ""; ArrayList al = new ArrayList();
	 * 
	 * DAO dao = new DAO();
	 * 
	 * try {
	 * 
	 * Connection con = dao.getDefaultDBConnection(); ResultSet rs =
	 * dao.queryDB(con, query); al = dao.getResult(rs); } catch (Exception e) {
	 * throw e;
	 * 
	 * } return al;
	 * 
	 * }
	 */

	public List<School> getSchools(String queryString) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		List<School> schools = session.createQuery(queryString).list();

		session.getTransaction().commit();
		session.close();

		return schools;
	}

}