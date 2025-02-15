package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.SalesModel;

/**
 * Servlet implementation class SalesReportController
 */
@WebServlet("/SalesReportController")
public class SalesReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			response.sendRedirect("login.jsp");
		} else {
			String sellerId = (String) session.getAttribute("port_id");
			String reportType = request.getParameter("report_type");
			int year = Integer.parseInt(request.getParameter("year"));
			int month = Integer.parseInt(request.getParameter("month"));

			SalesModel salesModel = new SalesModel();
			salesModel.setSellerId(sellerId);
			salesModel.setReportType(reportType);
			salesModel.setYear(year);
			salesModel.setMonth(month);

			double[] result = null;
			if (reportType.equals("annual")) {
				result = salesModel.getYearlySales(salesModel);
				request.setAttribute("totalsales", result[0]);
				request.setAttribute("totalorders", result[1]);
			} else if (reportType.equals("monthly")) {
				result = salesModel.getMonthlySales(salesModel);
				request.setAttribute("totalsales", result[0]);
				request.setAttribute("totalorders", result[1]);
			}

			request.getRequestDispatcher("seller_dashboard.jsp").forward(request, response);
		}
	}
}
