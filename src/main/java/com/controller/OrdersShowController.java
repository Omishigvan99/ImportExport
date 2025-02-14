package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.model.OrderModel;

@WebServlet("/OrdersShowController")
public class OrdersShowController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		OrderModel orderModel = new OrderModel();

		HttpSession session = request.getSession(false);

		String role = (String) session.getAttribute("role");
		String portId = (String) session.getAttribute("port_id");

		if (role == null || portId == null) {
			response.sendRedirect("login.jsp");
		}

		if (role.equals("consumer")) {
			List<OrderModel> orders = orderModel.getConsumerOrders(portId);
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("consumer_orders.jsp").forward(request, response);
		} else {
			List<OrderModel> orders = orderModel.getSellerOrders(portId);
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("seller_orders.jsp").forward(request, response);
		}

	}

}
