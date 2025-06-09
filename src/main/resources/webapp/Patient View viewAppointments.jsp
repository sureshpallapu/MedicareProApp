<%@ page import="java.util.List" %>
<%@ page import="com.medicarepro.DTO.Appointment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
    if (appointments == null) {
        appointments = new java.util.ArrayList<>();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Appointments - MediCarePro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }
        .header {
            background-color: #0d6efd;
            color: white;
            padding: 20px;
            border-radius: 0 0 10px 10px;
            text-align: center;
        }
        .card {
            margin-top: 20px;
        }
        .back-link {
            display: inline-block;
            margin: 20px 0;
            color: #0d6efd;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="header">
        <h2>My Appointments</h2>
        <p>View all your scheduled consultations</p>
    </div>

    <div class="container mt-4">
        <a href="patientDashboard.jsp" class="back-link">&larr; Back to Dashboard</a>

        <p>Appointments count: <b><%= appointments.size() %></b></p>

        <% if (appointments.isEmpty()) { %>
            <div class="alert alert-info text-center mt-4">No appointments found.</div>
        <% } else { %>
            <div class="table-responsive">
                <table class="table table-bordered table-hover mt-3 shadow-sm">
                    <thead class="table-primary">
                        <tr>
                            <th>Appointment ID</th>
                            <th>Doctor Name</th>
                            <th>Date</th>
                            <th>Time Slot</th>
                            <th>Fee (₹)</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Appointment app : appointments) { %>
                            <tr>
                                <td><%= app.getId() %></td>
                                <td><%= app.getDoctorName() %></td>
                                <td><%= app.getAppointmentDate() %></td>
                                <td><%= app.getTimeSlot() %></td>
                                <td>₹<%= String.format("%.2f", app.getConsultationFee()) %></td>
                                
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
