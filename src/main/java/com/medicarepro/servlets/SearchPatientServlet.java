package com.medicarepro.servlets;

import com.medicarepro.DAO.PatientDAO;
import com.medicarepro.DTO.Patient;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/SearchPatientServlet")
public class SearchPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchKey = request.getParameter("searchKey");
        Patient patient = PatientDAO.findPatientByKeyword(searchKey);

        if (patient != null) {
            request.setAttribute("patient", patient);
        } else {
            request.setAttribute("message", "❌ No registered patient found with the given keyword.");
        }

        request.getRequestDispatcher("bookAppointment.jsp").forward(request, response);
    }
}
