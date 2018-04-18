package com.db.bean;

public class CustomerBean {
	public int customerid;
	public String firstname;
	public String lastname;
	public long phone;
	public String address;

	public int getcustomerid() {
		return customerid;
	}

	public void setcustomerid(int customerid) {
		this.customerid = customerid;
	}

	public String getfirstname() {
		return firstname;
	}

	public void setfirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getlastname() {
		return lastname;
	}

	public void setlastname(String lastname) {
		this.lastname = lastname;
	}

	public long getphone() {
		return phone;
	}

	public void setphone(long phone) {
		this.phone = phone;
	}

	public String getaddress() {
		return address;
	}

	public void setaddress(String address) {
		this.address = address;
	}



	

}
