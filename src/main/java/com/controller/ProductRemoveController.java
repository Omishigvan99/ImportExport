package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.ProductModel;

@WebServlet("/ProductRemoveController")
public class ProductRemoveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get product id from seller_product_management.jsp
		int productId = Integer.parseInt(request.getParameter("productId"));

		HttpSession session = request.getSession();
		
		if (session == null) {
			response.sendRedirect("login.jsp");
		}
		
		String role = (String) session.getAttribute("role");
		String portId = (String) session.getAttribute("port_id");
		
		if (role == null || portId == null) {
			response.sendRedirect("login.jsp");
		}
		
		
		if (role.equals("seller")) {
			ProductModel product = new ProductModel();
			product.setProductId(productId);
			product.setSellerId(portId);
			product.deleteProduct(product);
			request.getRequestDispatcher("ProductsShowController").forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}
	}

}
