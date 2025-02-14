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

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String portid = request.getParameter("port_id");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		if (role.equals("seller")) {
			SellerModel seller = new SellerModel();
			seller.setSellerPortId(portid);
			seller.setPassword(password);
			seller.setLocation("");
			if (seller.authenticateSeller(seller)) {

				HttpSession session = request.getSession(true);
				session.setAttribute("port_id", portid);
				session.setAttribute("role", role);

				request.getRequestDispatcher("seller_dashboard.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else if (role.equals("consumer")) {
			ConsumerModel consumer = new ConsumerModel();
			consumer.setConsumerPortId(portid);
			consumer.setPassword(password);
			consumer.setLocation("");
			if (consumer.authenticateConsumer(consumer)) {
				HttpSession session = request.getSession(true);
				session.setAttribute("port_id", portid);
				session.setAttribute("role", role);
				request.getRequestDispatcher("ProductsShowController").forward(request, response);
			} else {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
