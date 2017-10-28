package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Example6_2_Bean;

public class Example6_2_Servlet extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Example6_2_Bean digitBean = null;
		HttpSession session = req.getSession(true);
		try {
			digitBean = (Example6_2_Bean) session.getAttribute("digitBean");
			if (digitBean == null) {
				digitBean = new Example6_2_Bean();
				session.setAttribute("digitBean", digitBean);
			}
		} catch (Exception exp) {
			// TODO: handle exception
			digitBean = new Example6_2_Bean();
			session.setAttribute("digitBean", digitBean);
		}
		String str1 = req.getParameter("numberOne");
		String str2 = req.getParameter("numberTwo");
		if (str1 == null || str2 == null)
			return;
		if (str1.length() == 0 || str2.length() == 0)
			return;
		double numberOne = Double.parseDouble(str1);
		double numberTwo = Double.parseDouble(str2);
		String operator = req.getParameter("operator");
		double result = 0;
		if (operator.equals(" + "))
			result = numberOne + numberTwo;
		else if (operator.equals(" - "))
			result = numberOne - numberTwo;
		else if (operator.equals(" * "))
			result = numberOne * numberTwo;
		else if (operator.equals(" / "))
			result = numberOne / numberTwo;
		else if (operator.equals(" % "))
			result = numberOne % numberTwo;
		else if (operator.equals("  +  "))
			result = Math.abs(numberOne) + Math.abs(numberTwo);
		else if (operator.equals(" ^ "))
			result = Math.pow(numberOne, numberTwo);
		else if (operator.equals(" sqrt "))
			result = Math.pow(numberTwo, 1/numberOne);
		else if (operator.equals(" log "))
			result = Math.log(numberTwo)/Math.log(numberOne);
		
		digitBean.setNumberOne(numberOne);
		digitBean.setNumberTwo(numberTwo);
		digitBean.setOperator(operator);
		digitBean.setResult(result);
		resp.sendRedirect("example6_2.jsp");
	}

}
