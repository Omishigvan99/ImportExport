package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.ConsumerModel;
import com.model.SellerModel;

/**
 * Servlet implementation class UpdateProfileController
 */
@WebServlet("/UpdateProfileController")
public class UpdateProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		String role = (String) session.getAttribute("role");
		String portId = (String) session.getAttribute("port_id");

		if (role == null || portId == null) {
			response.sendRedirect("login.jsp");
		}

		String location = request.getParameter("location");

		if (role.equals("seller")) {
			SellerModel sellerModel = new SellerModel();
			sellerModel.setSellerPortId(portId);
			sellerModel.setLocation(location);
			sellerModel.updateSellerProfile(sellerModel);
			response.sendRedirect("seller_dashboard.jsp");
		} else if (role.equals("consumer")) {
			 ConsumerModel consumerModel = new ConsumerModel();
			 consumerModel.setConsumerPortId(portId);
			 consumerModel.setLocation(location);
			 consumerModel.updateConsumerProfile(consumerModel);
			 response.sendRedirect("ProductsShowController");
		} else {
			response.sendRedirect("error.jsp");
		}
	}

}
