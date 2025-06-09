package com.medicarepro.servlets;

import com.medicarepro.DAO.DepartmentDAO;
import com.medicarepro.DTO.Department;
import com.medicarepro.utility.DBConnector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/AddDepartmentServlet")
public class AddDepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String facilities = request.getParameter("facilities");
        String[] doctorIds = request.getParameterValues("doctors");

        StringBuilder doctorList = new StringBuilder();
        if (doctorIds != null) {
            for (int i = 0; i < doctorIds.length; i++) {
                doctorList.append(doctorIds[i]);
                if (i != doctorIds.length - 1) {
                    doctorList.append(",");
                }
            }
        }

        try (Connection conn = DBConnector.getConnection()) {
            Department dept = new Department();
            dept.setName(name);
            dept.setFacilities(facilities);
            dept.setDoctors(doctorList.toString());
            dept.setStatus("Active");

            DepartmentDAO dao = new DepartmentDAO(conn);
            dao.addDepartment(dept);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("manageDepartments.jsp");
    }
}
