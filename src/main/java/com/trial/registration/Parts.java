package com.trial.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Parts
 */
@WebServlet("/parts")
public class Parts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String pnum = request.getParameter("pnum");
	        String pname = request.getParameter("pname");
	        String color = request.getParameter("color");
	        String weight = request.getParameter("weight");
	        String city = request.getParameter("city");
	        Connection con = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project4?useSSL=false", "root", "miki");
	            PreparedStatement pst = con.prepareStatement("insert into parts(pnum, pname, color, weight,city) values(?,?,?,?,?) ");
	            pst.setString(1, pnum); 
	            pst.setString(2, pname);
	            pst.setString(3, color);    
	            pst.setString(4, weight);   
	            pst.setString(5, city); 

	            int rowCount = pst.executeUpdate();

	            if (rowCount > 0) {
	                // Create a list to hold the inserted values
	                List<String> insertedValues = new ArrayList<>();
	                insertedValues.add(pnum);
	                insertedValues.add(pname);
	                insertedValues.add(color);
	                insertedValues.add(weight);
	                insertedValues.add(city);

	                // Set status message and inserted values list as request attributes
	                request.setAttribute("statusMessage", "New parts record:");
	                request.setAttribute("insertedValues", insertedValues);
	            } else {
	                request.setAttribute("statusMessage", "Failed to insert record!");
	            }


	            RequestDispatcher dispatcher = request.getRequestDispatcher("dataEntryHome.jsp");
	            dispatcher.forward(request, response);

	        } catch(Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (con != null) {
	                    con.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
