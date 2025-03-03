package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.ProductModel;

@WebServlet("/ProductAddController")
public class ProductAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("pname");
		double price = Double.parseDouble(request.getParameter("pprice"));
		int quantity = Integer.parseInt(request.getParameter("pquantity"));

		HttpSession session = request.getSession();

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

		if (role.equals("seller")) {
			ProductModel product = new ProductModel();
			product.setProductName(name);
			product.setProductPrice(price);
			product.setProductQuantity(quantity);
			product.setSellerId(portId);
			product.addProduct(product);

			response.sendRedirect("ProductsShowController");
		} else {
			response.sendRedirect("login.jsp");
		}
	}
}
