package com.medicarepro.servlets;

import java.io.IOException;

import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.medicarepro.DAO.StaffDAO;
import com.medicarepro.DTO.Staff;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AllStaffServlet")  // <-- Important
public class AllStaffServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            StaffDAO dao = new StaffDAO();
            List<Staff> staffList = dao.getAllStaff();
            request.setAttribute("staffList", staffList);
            RequestDispatcher rd = request.getRequestDispatcher("manageStaff.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
