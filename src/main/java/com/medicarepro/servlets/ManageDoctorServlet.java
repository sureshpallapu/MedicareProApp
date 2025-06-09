package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;
import com.medicarepro.DTO.Doctor;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/manageDoctors")
public class ManageDoctorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            DoctorDAO dao = new DoctorDAO();
            List<Doctor> doctors = dao.getAllDoctors();
            request.setAttribute("doctors", doctors);
            RequestDispatcher rd = request.getRequestDispatcher("manageDoctors.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
