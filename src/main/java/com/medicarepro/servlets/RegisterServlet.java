package com.medicarepro.servlets;

import java.io.*;

import java.net.*;
import java.text.SimpleDateFormat;

import javax.net.ssl.HttpsURLConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.medicarepro.DAO.PatientDAO;
import com.medicarepro.DTO.Patient;

@WebServlet("/RegisterPatientServlet")
public class RegisterServlet extends HttpServlet {

    private static final String SECRET_KEY = "6LfAHD8rAAAAAE-UVAJBbX92llxT5PomIZGudFeE";
    private static final String VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get reCAPTCHA response token from the form
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

        // Verify reCAPTCHA
        boolean isCaptchaValid = verifyRecaptcha(gRecaptchaResponse);

        if (isCaptchaValid) {
            // CAPTCHA passed – proceed with registration
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                Patient patient = new Patient();
                patient.setFullName(request.getParameter("fullName"));
                patient.setDob(sdf.parse(request.getParameter("dob")));
                patient.setAge(Integer.parseInt(request.getParameter("age")));
                patient.setGender(request.getParameter("gender"));
                patient.setBloodGroup(request.getParameter("bloodGroup"));
                patient.setMaritalStatus(request.getParameter("maritalStatus"));
                patient.setPhone(request.getParameter("phone"));
                patient.setAlternatePhone(request.getParameter("alternatePhone"));
                patient.setEmail(request.getParameter("email"));
                patient.setAddress(request.getParameter("address"));
                patient.setEmergencyName(request.getParameter("emergencyName"));
                patient.setEmergencyRelation(request.getParameter("emergencyRelation"));
                patient.setEmergencyPhone(request.getParameter("emergencyPhone"));
                patient.setGovtIdType(request.getParameter("govtIdType"));
                patient.setGovtIdNumber(request.getParameter("govtIdNumber"));
                patient.setInsuranceCompany(request.getParameter("insuranceCompany"));
                patient.setInsuranceNumber(request.getParameter("insuranceNumber"));
                patient.setAllergies(request.getParameter("allergies"));
                patient.setHistory(request.getParameter("history"));
                patient.setMedications(request.getParameter("medications"));
                patient.setHabits(request.getParameter("habits"));
                patient.setPatientType(request.getParameter("patientType"));

                String admissionDateStr = request.getParameter("admissionDate");
                patient.setAdmissionDate(admissionDateStr != null && !admissionDateStr.isEmpty() ? sdf.parse(admissionDateStr) : null);

                patient.setWard(request.getParameter("ward"));
                patient.setBed(request.getParameter("bed"));
                patient.setDoctor(request.getParameter("doctor"));
                patient.setReason(request.getParameter("reason"));

                String dischargeDateStr = request.getParameter("dischargeDate");
                patient.setDischargeDate(dischargeDateStr != null && !dischargeDateStr.isEmpty() ? sdf.parse(dischargeDateStr) : null);

                patient.setInstructions(request.getParameter("instructions"));
                patient.setDiet(request.getParameter("diet"));

                // Save patient to DB
                boolean isRegistered = new PatientDAO().registerPatient(patient);

                if (isRegistered) {
                    response.sendRedirect("success.jsp");
                } else {
                    response.sendRedirect("error.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            // CAPTCHA failed - send back to form with error message
            request.setAttribute("error", "CAPTCHA verification failed. Please try again.");
            request.getRequestDispatcher("registerPatient.jsp").forward(request, response);
        }
    }

    private boolean verifyRecaptcha(String gRecaptchaResponse) throws IOException {
        if (gRecaptchaResponse == null || gRecaptchaResponse.isEmpty()) {
            return false;
        }

        URL url = new URL(VERIFY_URL);
        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        String postParams = "secret=" + SECRET_KEY + "&response=" + gRecaptchaResponse;

        try (OutputStream out = connection.getOutputStream()) {
            out.write(postParams.getBytes());
            out.flush();
        }

        StringBuilder responseStr = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                responseStr.append(inputLine);
            }
        }

        JsonObject jsonResponse = JsonParser.parseString(responseStr.toString()).getAsJsonObject();
        return jsonResponse.get("success").getAsBoolean();
    }
}
