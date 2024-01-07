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
 * Servlet implementation class Supplier
 */

@WebServlet("/supplier")
public class Supplier extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String snum = request.getParameter("snum");
        String sname = request.getParameter("sname");
        String status = request.getParameter("status");
        String city = request.getParameter("city");
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project4?useSSL=false", "root", "miki");
            PreparedStatement pst = con.prepareStatement("insert into suppliers(snum, sname, status, city) values(?,?,?,?) ");
            pst.setString(1, snum); 
            pst.setString(2, sname);    
            pst.setString(3, status);   
            pst.setString(4, city); 

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                // Create a list to hold the inserted values
                List<String> insertedValues = new ArrayList<>();
                insertedValues.add(snum);
                insertedValues.add(sname);
                insertedValues.add(status);
                insertedValues.add(city);

                // Set status message and inserted values list as request attributes
                request.setAttribute("statusMessage", "New supplier record:");
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
        
}}}
