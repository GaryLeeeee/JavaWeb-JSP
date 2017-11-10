package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Example7_10_Bean;

public class Example7_10_End_Servlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Example7_10_Bean testBean = null;
		HttpSession session = request.getSession(true);
		try {
			testBean = (Example7_10_Bean)session.getAttribute("testBean");
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("example7_10.jsp");
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setCharacterEncoding("gb2312");
		String id = testBean.getId();
		Connection con;
		Statement sql;
		String condition = "insert into student values"+"("+"'"+id+"',"+testBean.getScore()+")";
		try {
//			String uri = "jdbc:mysql://127.0.0.1//school?"+"user=root&password=&characterEncoding=gb2312";
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school", "root", "19961219");
			sql = con.createStatement();
			sql.executeUpdate(condition);
			float score = testBean.getScore();
			notify(request,response,"考试结束!<br>"+"学号:"+id+"<br>最后得分:"+score+"<br>正确率:"+score/testBean.getTestAmount());
			session.invalidate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	private void notify(HttpServletRequest request, HttpServletResponse response, String backNews) {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=gb2312");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>"+backNews+"</h2>");
			out.println("<a href=example7_10.jsp>重新考试</a>");
			out.println("</body></html>");
		} catch (IOException e) {
			// TODO: handle exception
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}

}
