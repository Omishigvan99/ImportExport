package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.ProductModel;

@WebServlet("/ProductRemoveController")
public class ProductRemoveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get product id from seller_product_management.jsp
		int productId = Integer.parseInt(request.getParameter("productId"));

		// create product model object and set product id
		ProductModel productModel = new ProductModel();
		productModel.setProductId(productId);

		// delete product
		productModel.deleteProduct(productModel);;

		// redirect to ProductsShowController
		response.sendRedirect("ProductsShowController");
	}

}
