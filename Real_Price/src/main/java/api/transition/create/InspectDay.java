package api.transition.create;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class InspectDay {





	public static List<String> getFriday(){
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();


		List<String> inspd = new ArrayList<String>();

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");

		Calendar c = Calendar.getInstance();




		int week=1;
		for (int i = 0; i < 20; i++) {


			if(month < 0) {
				year = year-1;
				month = 12 + month;
			}

			c.set(Calendar.YEAR,year);

			c.set(Calendar.MONTH,month-1);

			c.set(Calendar.WEEK_OF_MONTH,week);

			c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);

			inspd.add(formatter.format(c.getTime()));

			month = month-6;

		}

		return inspd;



	}












//			public static void main(String[] args) {
//				LocalDate now = LocalDate.now();
//				int year = now.getYear();
//				int month = now.getMonthValue();
//				
//				System.out.println(getFriday().toString());
//		
//			}






}
