package com.trial.registration;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uemail = request.getParameter("username");
        String upwd = request.getParameter("password");
        HttpSession session = request.getSession();
        
        RequestDispatcher dispatcher = null;
        String fileLocation = "C:\\Users\\" + System.getProperty("user.name") + "\\credentials.txt";
        // Read credentials from file
        List<String[]> credentials = readCredentialsFromFile(fileLocation);

        boolean isValidUser = false;

        for (String[] cred : credentials) {
            if (cred.length == 2 && uemail.equals(cred[0]) && upwd.equals(cred[1])) {
                isValidUser = true;
                break;
            }
        }

        if (isValidUser && uemail == "username1") {
            session.setAttribute("name", uemail);
            dispatcher = request.getRequestDispatcher("index.jsp");
        } else {
            dispatcher = request.getRequestDispatcher("errorpage.jsp"); // Redirect to error page for invalid credentials
        }

        dispatcher.forward(request, response);
    }

    private List<String[]> readCredentialsFromFile(String filePath) throws IOException {
        List<String[]> credentials = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 2) {
                    credentials.add(parts);
                }
            }
        }

        return credentials;
    }
}

