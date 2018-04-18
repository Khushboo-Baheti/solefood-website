package com.db.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.db.bean.CustomerBean;
import com.db.bean.ItemBean;
import com.db.bean.PurchaseBean;

public class ConnectMySQL {
	private Connection connection = null;
	private ResultSet rs = null;
	private Statement st = null;
	// cloud db
	// :"jdbc:mysql://dbproject.cutpi1sw0djp.us-east-1.rds.amazonaws.com:3306/dbproject"
	// admin opencloud;
	// local db
	// "jdbc:mysql://localhost:3306/dbproject"
	// root root

	String connectionURL = "jdbc:mysql://dbproject.cutpi1sw0djp.us-east-1.rds.amazonaws.com:3306/dbproject";

	private void createconnection() {
		try {
			// Load the database driver
			Class.forName("com.mysql.jdbc.Driver");
			// Get a Connection to the database
			connection = DriverManager.getConnection(connectionURL, "admin",
			    "opencloud");

		} catch (Exception e) {
			System.out.println("Exception is ;" + e);
		}

	}

	public Connection getConnection() {
		try {
			// Load the database driver
			Class.forName("com.mysql.jdbc.Driver");
			// Get a Connection to the database
			connection = DriverManager.getConnection(connectionURL, "admin",
			    "opencloud");


		} catch (Exception e) {
			System.out.println("Exception is ;" + e);
		}
		return connection;

	}

	public void insertpurchasedetails(PurchaseBean bean) {


		String query = "INSERT INTO purchase"
		    + "(customer_id,item_id,quantity,price) VALUES"
 + "(?,?,?,?)";
		
		// System.out.println("query is" + query);
		createconnection();
		PreparedStatement preparedStmt;
		try {
			preparedStmt = connection.prepareStatement(query);
			preparedStmt.setInt(1, bean.getcustomerId());
			preparedStmt.setInt(2, bean.getitemId());
			preparedStmt.setInt(3, bean.getquantity());
			preparedStmt.setDouble(4, bean.getprice());
			preparedStmt.execute();

			closeconnection();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public CustomerBean getcustomerdetails(int Id) {
		// System.out.println("inside db get customer" + Id);
		CustomerBean bean = new CustomerBean();
		try {
			createconnection();
			String sql = "select * from customer where customer_id=" + Id;
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {

				bean.setfirstname(rs.getString("first_name"));
				bean.setlastname(rs.getString("last_name"));
				bean.setphone(rs.getLong("phone"));
				bean.setaddress(rs.getString("address"));
			}

		} catch (Exception e) {
			System.out.println("Exception is ;" + e);
		}
		return bean;
	}

	public void updateaddress(String address, int id) {
		try {

			createconnection();
			st = connection.createStatement();

			String sql = "Update customer set address='" + address
			    + "' where customer_id=" + id;
			// System.out.println("sql is" + sql);
			st.executeUpdate(sql);
			closeconnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	
	public ItemBean getitemdetails(int Id) {
		ItemBean bean = new ItemBean();
		try {
			createconnection();

			String sql = "select * from items where item_id=" + Id;
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				bean.setBrand(rs.getString("brand"));
				bean.setItemId(rs.getInt("item_id"));
				bean.setItemName(rs.getString("item_name"));
				bean.setPrice(rs.getDouble("price"));

			}

		} catch (Exception e) {
			System.out.println("Exception is ;" + e);
		}
		return bean;
	}





	public void closeconnection() {
		try {
			if (st != null) {
			st.close();
			}
			if (rs != null) {
				rs.close();
			}
			connection.close();
		} catch (SQLException e) {
			System.out.println("Exception" + e);
		}
	}


}
