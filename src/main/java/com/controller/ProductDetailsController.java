package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.ProductModel;

/**
 * Servlet implementation class ProductDetailsController
 */
@WebServlet("/ProductDetailsController")
public class ProductDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productId = Integer.parseInt(request.getParameter("product_id"));
		
		// get product details
		ProductModel product = new ProductModel().getProduct(productId);
		
		request.setAttribute("product", product);
		
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}

}
