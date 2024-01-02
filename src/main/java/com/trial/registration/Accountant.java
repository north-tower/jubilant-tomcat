package com.trial.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.CallableStatement;

/**
 * Servlet implementation class Accountant
 */
@WebServlet("/accountant")
public class Accountant extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String choice = request.getParameter("choice");
        CallableStatement callableStatement = null;
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project4?useSSL=false", "root", "miki");

            if ("supplier".equals(choice)) {
                // Call the stored procedure to get maximum status of all suppliers
            	String sql = "{CALL Get_The_Maximum_Status_Of_All_Suppliers()}";
            	callableStatement = (CallableStatement) con.prepareCall(sql);
                ResultSet resultSet = callableStatement.executeQuery();

                // Process the result set
                int maxStatus = 0;
                if (resultSet.next()) {
                    maxStatus = resultSet.getInt("Maximum_Status_Of_All_Suppliers");
                }

                // Set attributes in the request
                request.setAttribute("statusMessage", "Maximum Status Of All Suppliers");
                request.setAttribute("insertedValues", maxStatus);
            } else if ("parts".equals(choice)) {
                // Call the stored procedure to get total weight of parts
                String sql = "{call Get_The_Sum_Of_All_Parts_Weights(?)}";
                callableStatement = (CallableStatement) con.prepareCall(sql);
                callableStatement.registerOutParameter(1, Types.INTEGER);
                callableStatement.execute();

                int totWeight = callableStatement.getInt(1);
                request.setAttribute("statusMessage", "Total Weight of parts");
                request.setAttribute("insertedValues", totWeight);
            }else if ("shipments".equals(choice)) {
            	  // Call the stored procedure
                String sql = "{CALL Get_The_Total_Number_Of_Shipments()}";
                callableStatement = (CallableStatement) con.prepareCall(sql);
                ResultSet resultSet = callableStatement.executeQuery();

                // Process the result set
                int shipments = 0;
                if (resultSet.next()) {
                    shipments = resultSet.getInt(1);
                }

                // Set attributes in the request
                request.setAttribute("statusMessage", "Total Number of shipments");
                request.setAttribute("insertedValues", shipments);
            }else	if ("jobs".equals(choice)) {
            	    try {
            	        // Call the stored procedure
            	        String sql = "{call Get_The_Name_Of_The_Job_With_The_Most_Workers()}";
            	        callableStatement = (CallableStatement) con.prepareCall(sql);

            	        // Execute the stored procedure
            	        ResultSet resultSet = callableStatement.executeQuery();

            	        // Process the result set
            	        List<String> jobNames = new ArrayList<>();
            	        List<Integer> numWorkersList = new ArrayList<>();

            	        while (resultSet.next()) {
            	            String jobName = resultSet.getString("jname");
            	            int numWorkers = resultSet.getInt("numworkers");
            	            jobNames.add(jobName);
            	            numWorkersList.add(numWorkers);
            	        }

            	        // Set attributes in the request
            	        request.setAttribute("statusMessage", "Jobs with most workers");
            	        request.setAttribute("jobNames", jobNames);
            	        request.setAttribute("numWorkersList", numWorkersList);
            	    } catch (SQLException e) {
            	        e.printStackTrace();
            	    } finally {
            	        // Close resources in a finally block
            	        // (similar to the code you've already implemented for closing connections and statements)
            	    }
            	}else if ("suppliers".equals(choice)) {
            	String sql = "{call List_The_Name_And_Status_Of_All_Suppliers()}";
                callableStatement = (CallableStatement) con.prepareCall(sql);

                // Execute the stored procedure
                ResultSet resultSet = callableStatement.executeQuery();

                // Process the result set (assuming your stored procedure returns names and statuses)
                List<String> supplierNames = new ArrayList<>();
                List<Integer> statuses = new ArrayList<>();
                while (resultSet.next()) {
                    String sname = resultSet.getString("sname");
                    int status = resultSet.getInt("status");
                    supplierNames.add(sname);
                    statuses.add(status);
                }

                request.setAttribute("supplierNames", supplierNames);
                request.setAttribute("statuses", statuses);
             
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("accountantHome.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (callableStatement != null) {
                    callableStatement.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


	
	


