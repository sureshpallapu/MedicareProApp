package com.medicarepro.servlets;

import com.medicarepro.DAO.DepartmentDAO;
import com.medicarepro.utility.DBConnector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/ToggleDepartmentStatusServlet")
public class ToggleDepartmentStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int deptId = Integer.parseInt(request.getParameter("id"));
        String currentStatus = request.getParameter("status");
        String newStatus = currentStatus.equalsIgnoreCase("Active") ? "Inactive" : "Active";

        try (Connection conn = DBConnector.getConnection()) {
            DepartmentDAO dao = new DepartmentDAO(conn);
            boolean updated = dao.updateDepartmentStatus(deptId, newStatus);

            HttpSession session = request.getSession();
            if (updated) {
                session.setAttribute("message", "Department status updated to " + newStatus);
            } else {
                session.setAttribute("error", "Failed to update department status.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "An error occurred.");
        }

        response.sendRedirect("manageDepartments.jsp");
    }
}
