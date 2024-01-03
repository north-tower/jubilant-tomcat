package com.trial.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClearRoot
 */
@WebServlet("/ClearRoot")
public class ClearRoot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.removeAttribute("queryResults");
        request.removeAttribute("successMessage");
        request.removeAttribute("statusMessage");
        request.removeAttribute("statusMessage");
        request.removeAttribute("statusMessage");

        // Redirect back to the data entry page
        response.sendRedirect("index.jsp");
	}

}
