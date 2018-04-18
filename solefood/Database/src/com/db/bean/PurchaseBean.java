package com.db.bean;

import com.db.connection.ConnectMySQL;

public class PurchaseBean {

	public int customerId;
	public int itemId;
	public String brand;
	public double price;
	public int quantity;
	public double tax;
	public double total;

	private ConnectMySQL db = new ConnectMySQL();

	public void setinbean(int ItemId, int quantity, double price) {

	}

	public ItemBean getitemdetails(int itemid, int size, int quantity) {
		ItemBean item = new ItemBean();
		item = db.getitemdetails(itemid);
		double tax = item.getPrice() * (0.08);
		item.setTax(Math.floor(tax * 100) / 100);
		double total = (double) (quantity * (item.getPrice() + item.getTax()));
		item.setTotal(Math.floor(total * 100) / 100);
		return item;
	}

	public CustomerBean getcustomerdetails(int customer_id) {
		CustomerBean bean = new CustomerBean();
		bean = db.getcustomerdetails(customer_id);
		return bean;

	}

	public void insertpurchasedetails(PurchaseBean bean) {
		// System.out.println("I am called");
		// System.out.println("new bean" + bean.customerId);
		db.insertpurchasedetails(bean);

	}

	public void updateaddress(String address, int id) {
		// System.out.println("inside bean update adress" + address + id);
		if (address != null) {
			db.updateaddress(address, id);
		}

	}

	public int getcustomerId() {
		return customerId;
	}

	public void setcustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getitemId() {
		return itemId;
	}

	public void setitemId(int itemId) {
		this.itemId = itemId;
	}

	public String getbrand() {
		return brand;
	}

	public void setbrand(String brand) {
		this.brand = brand;
	}

	public int getquantity() {
		return quantity;
	}

	public void setquantity(int quantity) {
		this.quantity = quantity;
	}

	public double getprice() {
		return price;
	}

	public void setprice(double price) {
		this.price = price;
	}

	public double gettax() {
		return tax;
	}

	public void settax(double tax) {
		this.tax = tax;
	}

	public double gettotal() {
		return total;
	}

	public void settotal(double d) {
		this.total = d;
	}

	public ConnectMySQL getDb() {
		return db;
	}

	public void setDb(ConnectMySQL db) {
		this.db = db;
	}

}
