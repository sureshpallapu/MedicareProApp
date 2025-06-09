<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MediCarePro - Our Doctors</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/background-medical.jpg') no-repeat center center fixed;
    background-size: cover;
    background-color: #f8f9fa; /* fallback */
    color: #333;
        }

        h1 {
            text-align: center;
            margin: 30px 0;
            color: #2c3e50;
        }

        h3 {
            margin: 40px 0 20px 30px;
            color: #34495e;
            font-size: 1.8rem;
            border-left: 6px solid #3498db;
            padding-left: 10px;
        }

        .doctor-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            gap: 20px;
            margin-bottom: 40px;
        }

        .doctor-card {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 18px;
            width: 250px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .doctor-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .doctor-card img {
            width: 100%;
            height: 270px;
            border-radius: 15px;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .doctor-card h4 {
            margin: 10px 0 5px;
            color: #2c3e50;
            font-size: 1.2rem;
        }

        .doctor-card p {
            margin: 0 0 15px;
            color: #7f8c8d;
            font-size: 0.95rem;
        }

        .doctor-card a button {
            background: #3498db;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 25px;
            cursor: pointer;
            transition: background 0.3s ease;
            font-size: 0.95rem;
        }

        .doctor-card a button:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<h1>Our Top Doctors</h1>

<!-- === Department Template === -->
<%
    String[][] departments = {
        {"Cardiology", "Anil Kumar|Head of Cardiology", "Priya Sharma|Senior Cardiologist", "Ramesh Gupta|Cardiac Surgeon", "Sneha Rao|Heart Specialist"},
        {"Neurology", "Vivek Reddy|Head of Neurology", "Neha Joshi|Senior Neurologist", "Arjun Nair|Neuro Surgeon", "Pooja Patel|Brain Specialist"},
        {"Orthopedics", "Rajiv Menon|Head of Orthopedics", "Meera Das|Senior Orthopedic Surgeon", "Sanjay Kulkarni|Consultant Orthopedist", "Anita Verma|Orthopedic Specialist"},
        {"Pediatrics", "Kiran Bhatia|Head of Pediatrics", "Ritu Agarwal|Senior Pediatrician", "Manish Kapoor|Consultant Pediatrician", "Swathi Rao|Child Care Specialist"},
        {"General Medicine", "Arvind Joshi|Head of General Medicine", "Kavya Shetty|Senior Physician", "Rohit Chandra|Consultant General Physician", "Deepika Sen|Internal Medicine Specialist"}
    };
    int imgCounter = 1;
    for (String[] department : departments) {
%>
    <h3><%= department[0] %> Department</h3>
    <div class="doctor-cards">
        <%
            for (int i = 1; i < department.length; i++) {
                String[] doctorDetails = department[i].split("\\|");
        %>
        <div class="doctor-card">
            <img src="images/doctor<%= imgCounter++ %>.jpg" alt="Dr. <%= doctorDetails[0] %>">
            <h4>Dr. <%= doctorDetails[0] %></h4>
            <p><%= doctorDetails[1] %></p>
            <a href="indexappointmentbooking.jsp">
                <button>Book Appointment</button>
            </a>
        </div>
        <% } %>
    </div>
<% } %>

<%@ include file="footer.jsp" %>

</body>
</html>
