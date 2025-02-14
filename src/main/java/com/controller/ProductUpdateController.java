package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.ProductModel;

/**
 * Servlet implementation class ProductUpdateController
 */
@WebServlet("/ProductUpdateController")
public class ProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get product details from update_product.jsp
		int productId = Integer.parseInt(request.getParameter("productId"));
		String name = request.getParameter("pname");
		double price = Double.parseDouble(request.getParameter("pprice"));
		int quantity = Integer.parseInt(request.getParameter("pquantity"));
		String sellerId = request.getParameter("sellerId");

		// create product model object and set values
		ProductModel productModel = new ProductModel();
		productModel.setProductId(productId);
		productModel.setProductName(name);
		productModel.setProductPrice(price);
		productModel.setProductQuantity(quantity);
		productModel.setSellerId(sellerId);

		// update product
		productModel.updateProduct(productModel);

		// redirect to ProductsShowController
		response.sendRedirect("ProductsShowController");
	}

}
