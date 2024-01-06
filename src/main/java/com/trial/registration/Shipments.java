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
 * Servlet implementation class Shipments
 */
@WebServlet("/shipments")
public class Shipments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String snum = request.getParameter("snum");
        String pname = request.getParameter("pname");
        String jnum = request.getParameter("jnum");
        String quantity = request.getParameter("quantity");
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project4?useSSL=false", "root", "miki");
            PreparedStatement pst = con.prepareStatement("insert into shipments(snum, pname, jnum, quantity) values(?,?,?,?) ");
            pst.setString(1, snum); 
            pst.setString(2, pname);
            pst.setString(3, jnum);      
            pst.setString(4, quantity); 

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                // Create a list to hold the inserted values
                List<String> insertedValues = new ArrayList<>();
                insertedValues.add(snum);
                insertedValues.add(pname);
                insertedValues.add(jnum);
                insertedValues.add(quantity);

                // Set status message and inserted values list as request attributes
                request.setAttribute("statusMessage", "New shipments record:");
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

