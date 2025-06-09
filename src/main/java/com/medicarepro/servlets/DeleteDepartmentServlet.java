package com.medicarepro.servlets;

import com.medicarepro.DAO.DepartmentDAO;
import com.medicarepro.utility.DBConnector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/DeleteDepartmentServlet")
public class DeleteDepartmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBConnector.getConnection()) {
            DepartmentDAO dao = new DepartmentDAO(conn);
            dao.deleteDepartment(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("manageDepartments.jsp");
    }
}
