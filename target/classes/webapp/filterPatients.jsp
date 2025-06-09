<%@ page import="java.util.List" %>
<%@ page import="com.medicarepro.DTO.Patient" %>
<%@ page import="com.medicarepro.DAO.PatientDAO" %> <!-- Assuming your DAO class -->

<%
    String filterType = request.getParameter("patientType");
    List<Patient> patients = null;
    if (filterType != null && !filterType.trim().isEmpty()) {
        patients = PatientDAO.getPatientsByType(filterType);
    }
%>
<%@ include file="patientHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Filter Patients - Inpatient / Outpatient</title>
    <style>
        /* General body styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9fafb;
            color: #333;
            padding: 30px;
            max-width: 1100px;
            margin: auto;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        /* Form styling */
        .filter-form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        label {
            font-weight: 600;
            font-size: 1.1rem;
            color: #34495e;
        }

        select {
            padding: 8px 12px;
            border-radius: 6px;
            border: 1.8px solid #ccc;
            font-size: 1rem;
            outline-offset: 2px;
            transition: border-color 0.3s ease;
        }
        select:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
        }

        button {
            padding: 9px 18px;
            background-color: #3498db;
            border: none;
            color: white;
            font-weight: 700;
            font-size: 1rem;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(52, 152, 219, 0.3);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        button:hover {
            background-color: #2980b9;
            box-shadow: 0 6px 12px rgba(41, 128, 185, 0.4);
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
        }

        th {
            background-color: #2c3e50;
            color: white;
            font-weight: 700;
            letter-spacing: 0.05em;
        }

        tr:nth-child(even) {
            background-color: #f7f9fc;
        }

        tr:hover {
            background-color: #d6eaff;
            cursor: default;
            transition: background-color 0.3s ease;
        }

        /* Message styling */
        p {
            text-align: center;
            font-size: 1.2rem;
            color: #7f8c8d;
            margin-top: 40px;
            font-style: italic;
        }
    </style>
</head>
<body>
    <h2>Filter Patients by Type</h2>
    
    <form method="get" action="filterPatients.jsp" class="filter-form">
        <label for="patientType">Select Patient Type:</label>
        <select name="patientType" id="patientType" required>
            <option value="">--Select--</option>
            <option value="Inpatient" <%= "Inpatient".equals(filterType) ? "selected" : "" %>>Inpatient</option>
            <option value="Outpatient" <%= "Outpatient".equals(filterType) ? "selected" : "" %>>Outpatient</option>
        </select>
        <button type="submit">Filter</button>
    </form>
    
    <%
        if (patients != null) {
            if (patients.size() > 0) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Phone</th>
                <th>Reason</th>
                <th>Patient Type</th>
            </tr>
            <%
                for (Patient p : patients) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getFullName() %></td>
                <td><%= p.getAge() %></td>
                <td><%= p.getGender() %></td>
                <td><%= p.getPhone() %></td>
                <td><%= p.getReason() %></td>
                <td><%= p.getPatientType() %></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
            } else {
    %>
        <p>No patients found for <strong><%= filterType %></strong>.</p>
    <%
            }
        }
    %>

<%@ include file="footer.jsp"%>
</body>
</html>
