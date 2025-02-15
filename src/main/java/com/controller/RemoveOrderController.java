package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.OrderModel;

/**
 * Servlet implementation class RemoveOrderController
 */
@WebServlet("/RemoveOrderController")
public class RemoveOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null) {
			response.sendRedirect("login.jsp");
		}

		String role = (String) session.getAttribute("role");
		String portId = (String) session.getAttribute("port_id");

		if (role == null || portId == null) {
			response.sendRedirect("login.jsp");
		}

		int orderId = Integer.parseInt(request.getParameter("order_id"));

		if (role.equals("consumer")) {
			OrderModel orderModel = new OrderModel();
			orderModel.setOrderId(orderId);
			orderModel.removerConsumerOrder(orderModel);
			response.sendRedirect("OrdersShowController");
		}
	}
}
