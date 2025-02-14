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
 * Servlet implementation class RemoveProfileController
 */
@WebServlet("/RemoveProfileController")
public class RemoveProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		String role = (String) session.getAttribute("role");
		String portid = (String) session.getAttribute("port_id");

		if (role == null || portid == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

		String password = request.getParameter("password");

		if (role.equals("seller")) {
			SellerModel seller = new SellerModel();
			seller.setSellerPortId(portid);
			seller.setPassword(password);

			seller.deleteSellerProfile(seller);
			
			session.invalidate();
			request.getRequestDispatcher("login.jsp").forward(request, response);

		} else if (role.equals("consumer")) {
			ConsumerModel consumer = new ConsumerModel();
			consumer.setConsumerPortId(portid);
			consumer.setPassword(password);
			consumer.deleteConsumerProfile(consumer);
			
			session.invalidate();
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
