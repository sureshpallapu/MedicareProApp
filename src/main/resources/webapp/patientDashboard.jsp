<%@ page import="com.medicarepro.DTO.Patient" %>
<%@ page session="true" %>
<%
    Patient patient = (Patient) session.getAttribute("patient");
    if (patient == null) {
        response.sendRedirect("patientLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard - MediCarePro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f5f7fa;
        }
        .dashboard-container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            color: #2c3e50;
        }
        p {
            font-size: 16px;
            color: #34495e;
        }
        .logout-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #e74c3c;
            font-weight: bold;
        }
        .logout-link:hover {
            text-decoration: underline;
        }
        .appointment-section {
            margin-top: 40px;
        }
        .appointment-section h3 {
            color: #2980b9;
        }
        .appointment-section a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .appointment-section a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="dashboard-container">
        <h2>Welcome, <%= patient.getFullName() %>!</h2>
        <p><strong>Email:</strong> <%= patient.getEmail() %></p>
        <p><strong>Phone:</strong> <%= patient.getPhone() %></p>

        <div class="appointment-section">
            <h3> Manage Appointments</h3>
            <a href="patientbookAppointment.jsp">Book Appointment</a><br>
            <a href="Patient View viewAppointments.jsp">View My Appointments</a>
        </div>

        <a class="logout-link" href="logout.jsp">Logout</a>
    </div>


<%
    String bookingMessage = (String) session.getAttribute("bookingMessage");
    if (bookingMessage != null) {
%>
    <div class="alert alert-success text-center" style="margin: 20px auto; max-width: 600px;">
        <%= bookingMessage %>
    </div>
<%
        session.removeAttribute("bookingMessage");
    }
%>

    <jsp:include page="footer.jsp" />

</body>
</html>
