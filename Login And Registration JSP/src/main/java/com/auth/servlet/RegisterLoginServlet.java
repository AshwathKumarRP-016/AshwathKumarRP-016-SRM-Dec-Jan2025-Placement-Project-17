package com.auth.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;


@SuppressWarnings("serial")
@WebServlet("/RegisterLoginServlet")
public class RegisterLoginServlet extends HttpServlet {
	
    private static final String DB_URL = "jdbc:mysql://localhost:3306/auth_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    @Override
    public void init() throws ServletException {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("MySQL JDBC Driver not found", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("register".equals(action)) {
            handleRegistration(request, response);
        } else if ("login".equals(action)) {
            handleLogin(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String servletPath = request.getServletPath();
        String pathInfo = request.getPathInfo();
        
        if (servletPath.contains("register")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    private void handleRegistration(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Passwords do not match!");
            request.setAttribute("messageType", "error");
            forwardToPage(request, response, "/register.jsp");
            return;
        }
        
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("message", "Username cannot be empty!");
            request.setAttribute("messageType", "error");
            forwardToPage(request, response, "/register.jsp");
            return;
        }
        
        
        if (userExists(username)) {
            request.setAttribute("message", "Username already exists!");
            request.setAttribute("messageType", "error");
            forwardToPage(request, response, "/register.jsp");
            return;
        }
        
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password); 
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                request.setAttribute("message", "Registration successful! Please login.");
                request.setAttribute("messageType", "success");
                forwardToPage(request, response, "/login.jsp");
            } else {
                request.setAttribute("message", "Registration failed!");
                request.setAttribute("messageType", "error");
                forwardToPage(request, response, "/register.jsp");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
            forwardToPage(request, response, "/register.jsp");
        } finally {
            closeResources(conn, pstmt, null);
        }
    }
    
    private void handleLogin(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password); 
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userId", rs.getInt("id"));
                
                
                response.sendRedirect("welcome.jsp");
            } else {
               
                request.setAttribute("message", "Invalid username or password!");
                request.setAttribute("messageType", "error");
                forwardToPage(request, response, "/login.jsp");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
            forwardToPage(request, response, "/login.jsp");
        } finally {
            closeResources(conn, pstmt, rs);
        }
    }
    
    private boolean userExists(String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT id FROM users WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            
            return rs.next(); 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, pstmt, rs);
        }
    }
    
    private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page) 
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
    
    private void closeResources(Connection conn, Statement stmt, ResultSet rs) {
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
}
