package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.ConsumerModel;
import com.model.SellerModel;


@WebServlet("/ChangePasswordController")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session == null) {
		    request.getRequestDispatcher("login.jsp").forward(request, response);
		    return;
		}
		
		String role = (String) session.getAttribute("role");
		String portid = (String) session.getAttribute("port_id");
		
		if (role == null || portid == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		
		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		String confirmPassword = request.getParameter("confirm_password");
		
		if (newPassword.equals(confirmPassword)) {
			
			if (role.equals("seller")) {
                SellerModel seller = new SellerModel();
                seller.setSellerPortId(portid);
                seller.setPassword(oldPassword);
                seller.changeSellerPassword(portid, oldPassword, newPassword);
                session.invalidate();
                request.getRequestDispatcher("login.jsp").forward(request, response);
                
            } else if (role.equals("consumer")) {
                ConsumerModel consumer = new ConsumerModel();
                consumer.setConsumerPortId(portid);
                consumer.setPassword(oldPassword);
                consumer.changeConsumerPassword(portid, oldPassword, newPassword);
                session.invalidate();
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
		}
	}

}
