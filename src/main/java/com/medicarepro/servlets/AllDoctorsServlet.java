package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;
import com.medicarepro.DTO.Doctor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AllDoctorsServlet")
public class AllDoctorsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        DoctorDAO dao = new DoctorDAO();
        List<Doctor> doctors;

        if (keyword != null && !keyword.trim().isEmpty()) {
            doctors = dao.searchDoctors(keyword);
        } else {
            doctors = dao.getAllDoctors();
        }

        request.setAttribute("doctors", doctors);
        request.getRequestDispatcher("manageDoctors.jsp").forward(request, response);
    }
}
