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
 * Servlet implementation class ProfileShowController
 */
@WebServlet("/ProfileShowController")
public class ProfileShowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		String role = (String) session.getAttribute("role");
		String portId = (String) session.getAttribute("port_id");
		
		if (role == null || portId == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		if (role.equals("consumer")) {
			ConsumerModel consumerModel = new ConsumerModel();
			consumerModel.setConsumerPortId(portId);
			ConsumerModel consumerProfile = consumerModel.getConsumerProfile(consumerModel);
			request.setAttribute("consumerProfile", consumerProfile);
			request.getRequestDispatcher("profile.jsp").forward(request, response);
		} else if (role.equals("seller")) {
			SellerModel sellerModel = new SellerModel();
			sellerModel.setSellerPortId(portId);
			SellerModel sellerProfile = sellerModel.getSellerProfile(sellerModel);
			request.setAttribute("sellerProfile", sellerProfile);
			request.getRequestDispatcher("profile.jsp").forward(request, response);
		} else {
			response.sendRedirect("error.jsp");
		}
	}

}
