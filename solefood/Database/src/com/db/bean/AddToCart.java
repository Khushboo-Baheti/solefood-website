package com.db.bean;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BrandSize
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String select = request.getParameter("Product");
		out.println("<div id=\"Selected\">"+select+"</div>");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// get selected values
		String encodedBrandValue = request.getParameter("brand");
		String selectedSizeValue = request.getParameter("sizes");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
	
		// decode and get itemid and size
		int selectedItemId = DecodeItemId(encodedBrandValue);
		int selectedSize = Integer.parseInt(selectedSizeValue);
		
		// response.getWriter().append("SELECTED Item:"+
		// selectedItemId+", SIZE: "+selectedSize);

		session.setAttribute("itemid", selectedItemId);
		session.setAttribute("size", selectedSize);
		session.setAttribute("quantity", quantity);

		response.sendRedirect(request.getContextPath() + "/ConfirmOrder.jsp");

	}
	
	/*
	 * Decodes the brand value and extracts the selected item id
	 */
	private int DecodeItemId(String encodedBrandValue){
		String itemId = encodedBrandValue.split(",")[0];
		return Integer.parseInt(itemId);
	}
	

}
