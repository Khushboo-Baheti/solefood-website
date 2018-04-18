package com.db.bean;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.db.connection.ConnectMySQL;
import com.db.utils.EmailValidator;
import com.db.utils.MD5Hash;


public class Registration
{
    
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private long phone;
	private String address;
	private Connection connection = null;

	public boolean register() {
		// System.out.println("inside register");
		if (firstName == null || lastName == null || !EmailValidator.validate(email) || password == null || phone <= 0 || address == null)
			return false;
		connection = new ConnectMySQL().getConnection();
		try {
			connection.setAutoCommit(false);
			Statement st = connection.createStatement();

			String insertUser = "INSERT INTO user(email_id, password) VALUES('" + email + "','" + MD5Hash.getHash(password) + "')";
			st.executeUpdate(insertUser);

			String insertCustomer = "INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES('" + firstName
		    + "','" + lastName + "','" + email + "','" + phone + "','" + address + "')";
			st.executeUpdate(insertCustomer);

			connection.commit();
			connection.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
				connection.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return false;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public void setAddress(String address) {
		this.address = address;
	}
    
}