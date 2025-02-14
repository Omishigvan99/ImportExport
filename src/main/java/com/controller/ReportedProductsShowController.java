package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.model.ReportedProductModel;

/**
 * Servlet implementation class ReportedProductsShowController
 */
@WebServlet("/ReportedProductsShowController")
public class ReportedProductsShowController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReportedProductModel reportedProductModel = new ReportedProductModel();
		
		HttpSession session = request.getSession(false);

		String role = (String) session.getAttribute("role");
		String portId = (String) session.getAttribute("port_id");

		if (role == null || portId == null) {
			response.sendRedirect("login.jsp");
		}
		
		if (role.equals("consumer")) {
			List<ReportedProductModel> reportedProductList = reportedProductModel.getConsumerReportedProducts(portId);
			request.setAttribute("reportedProductList", reportedProductList);
			request.getRequestDispatcher("consumer_reported_products.jsp").forward(request, response);
		} else if (role.equals("seller")) {
			List<ReportedProductModel> reportedProductList = reportedProductModel.getSellerReportedProducts(portId);
			request.setAttribute("reportedProductList", reportedProductList);
			request.getRequestDispatcher("seller_reported_products.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		
	}

}
