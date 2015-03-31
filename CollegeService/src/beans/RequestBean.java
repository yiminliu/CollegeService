package beans;


	import java.util.Enumeration;
	import java.util.Collections;
	import java.util.Comparator;
	import java.util.ArrayList;
	import java.util.Map;
import java.sql.*;

	public class RequestBean {
		
		//String searchCriteria;
		
		private String type, setting, intlFinacialAid, tuitionFee, category, rank, size, recommandLetter;
	    private int toefl, sat;
		
	    public RequestBean(){};
	    		
	    public void setToefl(int toefl)
		{
		   this.toefl = toefl;
		}
		
		public void setSat(int sat)
		{
		   this.sat = sat;
		}

		public void setTuitionFee(String tuitionFee)
		{
			this.tuitionFee = tuitionFee;
		}
		public void setRank(String rank)
		{
	        this.rank = rank;	
		}
		public void setType(String type)
		{
			this.type = type;
		}
		public void setSize(String size)
		{
			this.size = size;
		}
		public void setSetting(String setting)
		{
			this.setting = setting;
		}
		public void setIntlFinacialAid(String intlFinacialAid)
		{
			this.intlFinacialAid = intlFinacialAid;
		}
		public void setCategory(String category)
		{
			this.category = category;
		}
		public void setRecommandLetter(String recommandLetter)
		{
			this.recommandLetter = recommandLetter;
		}	
		public String getType()
		{
			return type;		
		}
		public String getSize()
		{
			return size;		
		}
		public String getRank()
		{
			return rank;		
		}
		public String getSetting()
		{
			return setting;		
		}
		public String getIntlFinacialAid()
		{
			return intlFinacialAid;		
		}
		public int getToefl()
		{
			return toefl;
		}
		public int getSat()
		{
			return sat;		
		}
		public String getTuitionFee()
		{
			return tuitionFee;		
		}
		public String getCategory()
		{
			return category;
		}
		public String getRecommandLetter()
		{
			return recommandLetter;
		}
		
	}
