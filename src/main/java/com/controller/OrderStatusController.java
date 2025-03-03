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
 * Servlet implementation class OrderStatusController
 */
@WebServlet("/OrderStatusController")
public class OrderStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		String role = (String) session.getAttribute("role");

		if (role == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		String status = request.getParameter("status");
		int orderId = Integer.parseInt(request.getParameter("order_id"));

		if (role.equals("seller")) {

			OrderModel orderModel = new OrderModel();

			if (status.equals("shipped")) {
				orderModel.setOrderShipped(true);
				orderModel.setOrderId(orderId);
				orderModel.updateShippedStatus(orderModel);
				response.sendRedirect("OrdersShowController");
			} else if (status.equals("outfordelivery")) {
				orderModel.setOrderId(orderId);
				orderModel.setOrderOutForDelivery(true);
				orderModel.updateOutForDelivery(orderModel);
				response.sendRedirect("OrdersShowController");
			} else if (status.equals("delivered")) {
				orderModel.setOrderId(orderId);
				orderModel.setOrderDelivered(true);
				orderModel.updateDelivered(orderModel);
				response.sendRedirect("OrdersShowController");
			}
		}

	}

}
