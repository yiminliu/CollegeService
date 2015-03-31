package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import beans.School;

/**
 * This is an utility class for establishing batabase connections.
 * <p>
 * 
 * @version %I%, %G%
 * @since 1.0
 */

public class DAO {

	private static final String USERNAME = "root";
	private static final String PASSWORD = "password";
	// private static final String PASSWORD = "ren2ucsf";

	private static String dataSource = "jdbc:mysql://localhost:3306/schools";
	private static String dbDriver = "com.mysql.jdbc.Driver";
	// Oracle thin driver
	// dbDriver = "oracle.jdbc.driver.OracleDriver";
	// dataSource = "jdbc:oracle:thin:@ams.mis.earthlink.net:1521:ams";
	// DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	private Connection conn = null;

	public static void main(String[] arg) {

		DAO db = new DAO();
		Connection conn = null;
		try {
			conn = db.getConnectToDb(dbDriver, dataSource, USERNAME, PASSWORD);

		} catch (Exception pe) {
			System.out.println("Exception: " + pe.getMessage());
		}
		if (conn != null)
			// System.out.println("Connected to "+DBName);
			System.out.println("Connected");
		try {

			Statement stat = conn.createStatement();
			String query = "Select * from School";
			ResultSet result = db.queryDB(conn, query);
			ArrayList<School> al = db.getResult(result);
			// ResultSet result = stat.executeQuery(query);
			db.showResult(al);

		} catch (Exception pe) {
			System.out.println("PopException: " + pe.getMessage());
		}
	}

	public DAO() {
	}

	public Connection getDefaultDBConnection() {

		try {

			Class.forName(dbDriver);// jdbc-odbc bridge
			// Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}

		try {

			conn = DriverManager.getConnection(dataSource, USERNAME, PASSWORD);
		}

		catch (SQLException e) {

			e.printStackTrace();
		}

		if (conn != null)

			return conn;

		else

			return null;

		// throw new PopException ("Unable to connect to database ");

	}

	/** constructor with dbDriver and dataSource parameters */
	public DAO(String dbDriver, String dataSorce) {
		this.dbDriver = dbDriver;
		this.dataSource = dataSource;

	}

	public Connection getConnectToDb(String dbDriver, String dataSource,
			String userName, String password) {

		try {

			// Class.forName(dbDriver);
			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}

		try {

			conn = DriverManager.getConnection(dataSource, userName, password);
		}

		catch (SQLException e) {

			e.printStackTrace();
		}

		if (conn != null)

			return conn;

		else

			return null;

		// throw new PopException ("Unable to connect to database ");

	}

	public ResultSet queryDB(Connection con, String queryString) {

		ResultSet result = null;
		try {
			Statement stat = con.createStatement();
			// String query = "Select * from School";
			// result = stat.executeQuery(query);
			result = stat.executeQuery(queryString);
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}

	public ArrayList getResult(ResultSet rs) {

		if (rs == null)
			return null;

		ArrayList al = new ArrayList<School>();

		// SchoolBean SchoolBean = new SchoolBean();

		String name, type, location, state, setting, aid, calendar, rLetter, category, website, selectivityRank = null;
		int size, cost, tuitionFee, roomBoard, appFee, toefl, sat1Min, sat1Up, sat2, acceptRate, rank = 0;
		String appDeadLine;
		float reputationScore;

		try {
			while (rs.next()) {

				School School = new School();

				name = rs.getString("name");
				type = rs.getString("type");
				size = rs.getInt("size");
				location = rs.getString("location");
				setting = rs.getString("setting");
				// cost = rs.getInt("cost");
				// appDeadLine = rs.getDate("Application_Deadline");
				appDeadLine = rs.getString("Application_Deadline");
				tuitionFee = rs.getInt("tuition_fee");
				roomBoard = rs.getInt("room_board");
				appFee = rs.getInt("application_fee");
				toefl = rs.getInt("toefl");
				sat1Min = rs.getInt("SAT_1_25_percent");
				sat1Up = rs.getInt("SAT_1_75_percent");
				sat2 = rs.getInt("sat_2");
				acceptRate = rs.getInt("Accept_Rate");
				rank = rs.getInt("Rank_Overall");
				aid = rs.getString("int_finacial_aid");
				// rLetter = rs.getString("recommand_letter");
				category = rs.getString("category");
				calendar = rs.getString("calendar");
				website = rs.getString("website");
				selectivityRank = rs.getString("Selectivity");
				reputationScore = rs.getFloat("Reputation_Score");

				School.setName(name);
				School.setType(type);
				School.setSize(String.valueOf(size));
				School.setLocation(location);
				// School.setCity(city);
				// School.setState(state);
				School.setSetting(setting);
				// schoolBenBean.setCost(String.valueOf(cost));
				School.setRank(String.valueOf(rank));
				School.setTuitionFee(String.valueOf(tuitionFee));
				School.setRoomBoard(String.valueOf(roomBoard));
				School.setAppFee(String.valueOf(appFee));
				School.setToefl(String.valueOf(toefl));
				School.setSat1Min(String.valueOf(sat1Min));
				School.setSat1Up(String.valueOf(sat1Up));
				School.setSat2(String.valueOf(sat2));
				School.setAcceptRate(String.valueOf(acceptRate));
				School.setCalendar(calendar);
				School.setAid(aid);
				// School.setRecommandLetter(rLetter);
				School.setCategory(category);
				School.setAppDeadLine(appDeadLine);
				School.setWebsite(website);
				School.setReputationScore(String.valueOf(reputationScore));
				School.setSelectivityRank(selectivityRank);

				al.add(School);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return al;
	}

	public void showResult(ArrayList<School> al) {

		School sb = new School();

		Iterator ir = al.iterator();
		while (ir.hasNext()) {
			sb = (School) ir.next();
			System.out.println("name = " + sb.getName());
			System.out.println("type = " + sb.getType());
			System.out.println("size = " + sb.getSize());

		}
	}

}
