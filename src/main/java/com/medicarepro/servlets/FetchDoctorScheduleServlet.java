package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;

import com.medicarepro.DTO.Doctor;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/FetchDoctorScheduleServlet")
public class FetchDoctorScheduleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));

            DoctorDAO dao = new DoctorDAO();
            Doctor d = dao.getDoctorScheduleById(doctorId);
            if (d == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Doctor not found");
                return;
            }
            JsonObject json = new JsonObject();
            json.addProperty("scheduleDays", d.getScheduleDays() != null ? d.getScheduleDays() : "");
            json.addProperty("scheduleFrom", d.getScheduleTimeFrom() != null ? d.getScheduleTimeFrom().toString() : "");
            json.addProperty("scheduleTo", d.getScheduleTimeTo() != null ? d.getScheduleTimeTo().toString() : "");
            json.addProperty("consultationRoom", d.getConsultationRoom() != null ? d.getConsultationRoom() : "");

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }
    }
}
