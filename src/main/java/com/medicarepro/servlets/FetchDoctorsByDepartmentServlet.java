package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;
import com.medicarepro.DTO.Doctor;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/FetchDoctorsByDepartmentServlet")
public class FetchDoctorsByDepartmentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String department = request.getParameter("department");

        DoctorDAO dao = new DoctorDAO();
        List<Doctor> doctors = dao.getDoctorsByDepartment(department);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String json = gson.toJson(doctors);

        response.getWriter().write(json);
    }
}
