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
 * Servlet implementation class PlaceOrderController
 */
@WebServlet("/PlaceOrderController")
public class PlaceOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		
		if (httpSession == null) {
			response.sendRedirect("login.jsp");
		}

		String role = (String) httpSession.getAttribute("role");
		String port_id = (String) httpSession.getAttribute("port_id");

		if (role == null || port_id == null) {
			response.sendRedirect("login.jsp");
		}

		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int productId = Integer.parseInt(request.getParameter("product_id"));

		if (role.equals("consumer")) {
			OrderModel order = new OrderModel();
			order.setConsumerId(port_id);
			order.setQuantity(quantity);
			order.setProductId(productId);
			order.placeOrder(order);
			
			response.sendRedirect("OrdersShowController");
		}
	}

}
