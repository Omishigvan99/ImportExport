package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.ReportedProductModel;

/**
 * Servlet implementation class RemoveReportedProductController
 */
@WebServlet("/RemoveReportedProductController")
public class RemoveReportedProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportedProductId = Integer.parseInt( request.getParameter("report_id"));
		
		// delete reported product
		ReportedProductModel reportedProductModel = new ReportedProductModel();
		reportedProductModel.removeReportedProduct(reportedProductId);
		
		response.sendRedirect("ReportedProductsShowController");
	}

}
