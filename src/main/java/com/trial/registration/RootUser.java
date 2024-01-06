package com.trial.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RootUser
 */
@WebServlet("/rootUser")
public class RootUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("sqlQuery");
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project4?useSSL=false", "root", "miki");

            // Execute the SQL query
            Statement stmt = con.createStatement();
            
            // Check if the query is an UPDATE, INSERT, or DELETE statement
            boolean isUpdateQuery = query.trim().toLowerCase().startsWith("update") ||
                                     query.trim().toLowerCase().startsWith("insert") ||
                                     query.trim().toLowerCase().startsWith("delete");

            if (isUpdateQuery) {
                int rowsAffected = stmt.executeUpdate(query); // Execute update query

                if (rowsAffected > 0) {
                    // Check if the query is an INSERT into shipments and the quantity is >= 100
                	if (rowsAffected > 0 && query.toLowerCase().startsWith("insert into shipments") && query.toLowerCase().contains("values")) {
                	    // Using regex to extract values within quotes
                	    Pattern pattern = Pattern.compile("'(.*?)'");
                	    Matcher matcher = pattern.matcher(query);

                	    int count = 0;
                	    String supplierID = "";
                	    int quantity = 0;

                	    while (matcher.find()) {
                	        count++;
                	        if (count == 1) {
                	            supplierID = matcher.group(1); // Extracting the supplierID
                	        } else if (count == 4) {
                	            quantity = Integer.parseInt(matcher.group(1)); // Extracting the quantity
                	        }
                	    }

                	    if (quantity >= 100) {
                	        // Update the supplier's status by incrementing it by 5
                	        String updateStatusQuery = "UPDATE suppliers SET status = status + 5 WHERE snum = ?";
                	        PreparedStatement updateStatement = con.prepareStatement(updateStatusQuery);
                	        updateStatement.setString(1, supplierID);

                	        int supplierRowsAffected = updateStatement.executeUpdate();

                	        if (supplierRowsAffected > 0) {
                	            String successMessage = "Operation successful. " + rowsAffected + " row(s) affected. Supplier status updated.";
                	            request.setAttribute("successMessage", successMessage);
                	        } else {
                	            String errorMessage = "Operation successful. " + rowsAffected + " row(s) affected, but failed to update supplier status.";
                	            request.setAttribute("errorMessage", errorMessage);
                	        }
                	    }
                	} else {
                	    String successMessage = "Operation successful. " + rowsAffected + " row(s) affected.";
                	    request.setAttribute("successMessage", successMessage);
                	}
                } else {
                    String errorMessage = "Operation failed. No rows affected.";
                    request.setAttribute("errorMessage", errorMessage);
                }

                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }




             else {
                ResultSet rs = stmt.executeQuery(query); // Execute query that returns a result set

                // Process the query results
                List<String[]> results = new ArrayList<>();
                int columnCount = rs.getMetaData().getColumnCount();
                while (rs.next()) {
                    String[] rowData = new String[columnCount];
                    for (int i = 1; i <= columnCount; i++) {
                        rowData[i - 1] = rs.getString(i);
                    }
                    results.add(rowData);
                }
                // Store the results in request attribute
                request.setAttribute("queryResults", results);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            String errorMessage = "Error executing the query: " + e.getMessage();
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
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