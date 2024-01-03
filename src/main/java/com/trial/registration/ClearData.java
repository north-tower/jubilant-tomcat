package com.trial.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClearData
 */
@WebServlet("/ClearData")
public class ClearData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.removeAttribute("insertedValues");
        request.removeAttribute("statusMessage");

        // Redirect back to the data entry page
        response.sendRedirect("dataEntryHome.jsp");
	}

}
