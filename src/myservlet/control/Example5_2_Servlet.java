package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example5_2_Servlet extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
	}
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		String string = request.getParameter("billMess");
		if(string==null||string.length()==0)
			return;
		String[] price = string.split("[^0123456789.]+");
		double sum = 0;
		try {
			for (int i = 0; i < price.length; i++) {
				if (price[i].length()>=1) {
					sum += Double.parseDouble(price[i]);
				}
			}
		} catch (NumberFormatException e) {
			// TODO: handle exception
			out.print(""+e);
		}
		out.print("\""+string+"\"µÄÏû·Ñ¶î:"+sum+"Ô²");
		out.println("</body></html>");
	}
}
