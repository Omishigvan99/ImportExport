package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.model.ProductModel;

@WebServlet("/ProductsShowController")
public class ProductsShowController extends HttpServlet {

	/**
	 * 
	 */
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
		
		if(role.equals("seller")) {
            // get all products of seller
            ProductModel productModel = new ProductModel();
            productModel.setSellerId(portId);
            List<ProductModel> products= productModel.getSellerProducts(portId);
            
            // display all products to seller_dashboard.jsp
            request.setAttribute("products", products);
            request.setAttribute("sellerId", portId);
            request.getRequestDispatcher("seller_product_management.jsp").forward(request, response);
		
		} else if(role.equals("consumer")) {
			// get all products of all sellers
            ProductModel productModel = new ProductModel();
            List<ProductModel> products= productModel.getProducts();
            
            // display all products to buyer_dashboard.jsp
            request.setAttribute("products", products);
            request.getRequestDispatcher("consumer_dashboard.jsp").forward(request, response);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
