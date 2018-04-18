package com.db.bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.connection.ConnectMySQL;
import com.db.utils.EmailValidator;
import com.db.utils.MD5Hash;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("inside login");

        response.setContentType("text/html");  
        HttpSession session = request.getSession();
		PrintWriter pw = response.getWriter(); 

		String email = request.getParameter("email");  
		String password = request.getParameter("password");
		if (!EmailValidator.validate(email) || password == null) {
	        pw.println("Invalid email or password <a href='index.jsp'>Try again</a>");
	        return;
		}

		Connection connection = new ConnectMySQL().getConnection();
		try {
			Statement st = connection.createStatement();
			String loginQuery = "SELECT * from user WHERE email_id='" + email + "' AND password='" + MD5Hash.getHash(password) + "'";
			ResultSet rs = st.executeQuery(loginQuery);
			if(rs.next()) {
				String customerQuery = "SELECT * from customer WHERE email_id='" + email + "'";
				ResultSet customerResult = st.executeQuery(customerQuery);
				if (customerResult.next()) {
					session.setAttribute("customerid", customerResult.getObject("customer_id"));
					session.setAttribute("customername", customerResult.getObject("first_name") + " " + customerResult.getObject("last_name") );
					response.sendRedirect("shop.jsp");
				} else {
					pw.println("Looks like there is no such customer <a href='index.jsp'>Try again</a>");
				}
			} else {
		        pw.println("Either email or password is incorrect <a href='index.jsp'>Try again</a>");
		    }
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
