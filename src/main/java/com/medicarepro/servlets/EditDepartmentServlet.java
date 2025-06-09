package com.medicarepro.servlets;



import com.medicarepro.DAO.DepartmentDAO;

import com.medicarepro.DTO.Department;
import com.medicarepro.utility.DBConnector;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/EditDepartmentServlet")
public class EditDepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String facilities = request.getParameter("facilities");
        String doctors = request.getParameter("doctors");
        String status = request.getParameter("status");

        try (Connection conn = DBConnector.getConnection()) {
            Department dept = new Department(id, name, facilities, doctors, status);
            DepartmentDAO dao = new DepartmentDAO(conn);
            dao.updateDepartment(dept);
            response.sendRedirect("manageDepartments.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
