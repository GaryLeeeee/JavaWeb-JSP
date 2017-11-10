package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Example7_10_Bean;

public class Example7_10_Servlet extends HttpServlet {

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
			if(testBean==null){
				testBean = new Example7_10_Bean();
				session.setAttribute("testBean", testBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			testBean = new Example7_10_Bean();
			session.setAttribute("testBean", testBean);
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setCharacterEncoding("gb2312");
		String id = request.getParameter("id");
		if(id==null||id.length()==0){
			notify(request,response,"必须给出学号");
			return;
		}
		testBean.setId(id);
		int testAmount = testBean.getTestAmount();
		Connection con;
		Statement sql;
		ResultSet rs;
		try{
			//String  uri = ""jdbc:mysql://127.0.0.1:3306/CJGL", "root", "19961219"";
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school", "root", "19961219");
			sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = sql.executeQuery("select * from test");
			rs.last();
			int recordAmount = rs.getRow();
			testAmount = Math.min(recordAmount, testAmount);
			@SuppressWarnings("unchecked")
			LinkedList<Integer> list = (LinkedList<Integer>)session.getAttribute("list");
			if(list==null||list.size()==0){
				list = new LinkedList<Integer>();
				for(int i=1;i<=recordAmount;i++)
					list.add(i);
				session.setAttribute("list", list);
			}
			int m=-1;
			int index = -1;
			if(list.size()>=0){
				m = (int)(Math.random()*list.size());
				index = list.get(m);
				list.remove(m);
				session.setAttribute("list", list);
				int tihao = testBean.getNumber();
				if(tihao<testAmount){
					String studentAnswer = testBean.getAnswer();
					if(studentAnswer!=null&&studentAnswer.length()>=1){
						if(studentAnswer.equalsIgnoreCase(testBean.getCorrectAnswer())){
							float score = testBean.getScore();
							score++;
							testBean.setScore(score);
						}
					}
					tihao++;
					testBean.setNumber(tihao);
					rs.absolute(index);
					testBean.setQuestions(rs.getString(2));
					testBean.setChoiceA(rs.getString(3));
					testBean.setChoiceB(rs.getString(4));
					testBean.setChoiceC(rs.getString(5));
					testBean.setChoiceD(rs.getString(6));
					testBean.setImage(rs.getString(7));
					testBean.setCorrectAnswer(rs.getString(8).trim());
					testBean.setMess("题目进度:"+tihao+"/"+testAmount);
					con.close();
				}
				else{
					testBean.setMess("答题结束，单击“交卷”按钮查看分数");
					String studentAnswer = testBean.getAnswer();
					if(studentAnswer!=null&studentAnswer.length()>=1){
						if(studentAnswer.equalsIgnoreCase(testBean.getCorrectAnswer())){
							float score = testBean.getScore();
							score++;
							testBean.setScore(score);
						}
					}
					testBean.setAnswer("");
					testBean.setNumber(0);
					testBean.setQuestions("");
					testBean.setChoiceA("");
					testBean.setChoiceB("");
					testBean.setChoiceC("");
					testBean.setChoiceD("");
					testBean.setImage("");
				}
			}
			else{
				testBean.setMess("没有抽到题目");
			}
			response.sendRedirect("example7_10_examination.jsp");
		}catch(SQLException e){
			notify(request,response,e.toString());
		}
	}

	private void notify(HttpServletRequest request, HttpServletResponse response, String backNews) {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=gb2312");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>"+backNews+"</h2>");
			//out.println("返回");
			out.println("<a href=example7_10.jsp>返回</a>");
			out.println("</body></html>");
		} catch (IOException e) {
			// TODO: handle exception
		}
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}
	
}
