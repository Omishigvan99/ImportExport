package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.ConsumerModel;
import com.model.SellerModel;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String port_id= request.getParameter("port_id");
		String password= request.getParameter("password");
		String confirm_password= request.getParameter("confirm_password");
		String role= request.getParameter("role");
		
		if (password.equals(confirm_password)) {
			if (role.equals("seller")) {
				SellerModel sellerModel = new SellerModel();
				sellerModel.setSellerPortId(port_id);
				sellerModel.setPassword(password);
				sellerModel.setConfirmPassword(password);
				sellerModel.setLocation("");
				
				if (sellerModel.registerSeller(sellerModel)) {
					response.sendRedirect("login.jsp");
				} else {
					// show error message
					response.sendRedirect("register.jsp?error=Falied to register. Try again");
				}
				
				
			} else if (role.equals("consumer")) {
				
				ConsumerModel consumerModel = new ConsumerModel();
				consumerModel.setConsumerPortId(port_id);
				consumerModel.setPassword(password);
				consumerModel.setConfirmPassword(password);
				consumerModel.setLocation("");
				
				if (consumerModel.registerConsumer(consumerModel)) {
					response.sendRedirect("login.jsp");
				} else {
					// show error message
					response.sendRedirect("register.jsp?error=Falied to register. Try again");
				}
			}
			else {
				// show error message
				response.sendRedirect("register.jsp?error=Invalid role selected");
			}
		} else {
			// show error message
			response.sendRedirect("register.jsp?error= Passwords do not match");
		}
	}
}
