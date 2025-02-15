package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.ReportedProductModel;

/**
 * Servlet implementation class ReportProductController
 */
@WebServlet("/ReportProductController")
public class ReportProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			response.sendRedirect("login.jsp");
		}
		
		String role = (String) session.getAttribute("role");
		String portId = (String) session.getAttribute("port_id");
		
		if (role == null || portId == null) {
			response.sendRedirect("login.jsp");
		}
		
		int productId = Integer.parseInt(request.getParameter("product_id"));
		String issueType = request.getParameter("issue_type");
		
		if (role.equals("consumer")) {
            // report product
            ReportedProductModel reportedProductModel = new ReportedProductModel();
            reportedProductModel.setProductId(productId);
            reportedProductModel.setConsumerPortId(portId);
            reportedProductModel.setIssueType(issueType);
            reportedProductModel.reportProduct(reportedProductModel);
            response.sendRedirect("ReportedProductsShowController");
        } else {
            response.sendRedirect("login");
        }
		
	}

}
