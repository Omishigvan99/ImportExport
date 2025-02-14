package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.ProductModel;

@WebServlet("/ProductAddController")
public class ProductAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name= request.getParameter("pname");
		double price= Double.parseDouble(request.getParameter("pprice"));
		int quantity= Integer.parseInt(request.getParameter("pquantity"));
		String sellerId= request.getParameter("sellerId");
		
		ProductModel productModel= new ProductModel();
		
		productModel.setProductName(name);
		productModel.setProductPrice(price);
		productModel.setProductQuantity(quantity);
		productModel.setSellerId(sellerId);
		
		productModel.addProduct(productModel);
			
		response.sendRedirect("ProductsShowController");
		
	}
}
