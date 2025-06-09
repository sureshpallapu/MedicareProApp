package com.medicarepro.servlets;

import com.medicarepro.DAO.DepartmentDAO;
import com.medicarepro.DTO.Department;
import com.medicarepro.utility.DBConnector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/UpdateDepartmentServlet")
public class UpdateDepartmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String facilities = request.getParameter("facilities");
            String doctors = request.getParameter("doctors");
            String status = request.getParameter("status");

            Department dept = new Department();
            dept.setId(id);
            dept.setName(name);
            dept.setFacilities(facilities);
            dept.setDoctors(doctors);
            dept.setStatus(status);

            Connection conn = DBConnector.getConnection();
            DepartmentDAO dao = new DepartmentDAO(conn);

            boolean updated = dao.updateDepartment(dept);
            conn.close();

            if (updated) {
                session.setAttribute("message", "Department updated successfully!");
            } else {
                session.setAttribute("error", "Failed to update department.");
            }

            response.sendRedirect("manageDepartments.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Something went wrong: " + e.getMessage());
            response.sendRedirect("manageDepartments.jsp");
        }
    }
}
