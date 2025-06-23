<%@ page import="java.util.List" %>
<%@ page import="com.medicarepro.DTO.Patient" %>
<%@ page import="com.medicarepro.DAO.PatientDAO" %>

<%
    String filterType = request.getParameter("patientType");
    List<Patient> patients = null;
    if (filterType != null && !filterType.trim().isEmpty()) {
        patients = PatientDAO.getPatientsByType(filterType);
    }
%>

<%@ include file="patientHeader.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Filter Patients - MediCarePro HMS</title>
    <!-- Optional: Tablesort for sorting -->
    <script src="https://unpkg.com/tablesort@5.2.1/dist/tablesort.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: #f0f4f8;
            color: #333;
            padding: 120px 20px 40px;
            max-width: 1100px;
            margin: auto;
        }

        h2 {
            text-align: center;
            color: #0077b6;
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            border-bottom: 3px solid #0077b6;
            display: inline-block;
            padding-bottom: 8px;
        }

        .nav-links {
            margin-bottom: 20px;
            text-align: center;
        }

        .nav-links a {
            margin: 0 10px;
            color: #0077b6;
            font-weight: 600;
            text-decoration: none;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }

        .filter-form {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .filter-form label {
            font-weight: 600;
            color: #333;
            font-size: 1.1rem;
        }

        .filter-form select {
            padding: 10px 14px;
            border: 2px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
        }

        .filter-form button {
            padding: 10px 20px;
            background: #0077b6;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
        }

        .filter-form button:hover {
            background: #005f8a;
        }

        .tools {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 15px;
            margin-bottom: 20px;
        }

        .tools input {
            flex: 1 1 300px;
            padding: 10px 14px;
            border: 1.5px solid #ccc;
            border-radius: 6px;
        }

        .tools button {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
        }

        .export-btn {
            background: #28a745;
            color: #fff;
        }

        .export-btn:hover {
            background: #218838;
        }

        .print-btn {
            background: #17a2b8;
            color: #fff;
        }

        .print-btn:hover {
            background: #117a8b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
            font-size: 14px;
        }

        th {
            background: #0077b6;
            color: #fff;
            text-transform: uppercase;
            cursor: pointer; /* Tablesort */
        }

        tr:nth-child(even) {
            background: #f8fafd;
        }

        tr:hover {
            background: #e1f3fb;
        }

        p {
            text-align: center;
            font-size: 1.2rem;
            color: #555;
            margin-top: 30px;
        }

        @media print {
            .filter-form, .tools, .print-btn, .export-btn, .nav-links {
                display: none;
            }
            body {
                background: #fff;
                color: #000;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <h2>Filter Patients by Type</h2>

    <div class="nav-links">
        <a href="adminDashboard.jsp"> Back to Admin Dashboard</a> |
        <a href="filterPatients.jsp">Clear Filter</a>
    </div>

    <form method="get" action="filterPatients.jsp" class="filter-form">
        <label for="patientType">Patient Type:</label>
        <select name="patientType" id="patientType" required>
            <option value="">-- Select --</option>
            <option value="Inpatient" <%= "Inpatient".equals(filterType) ? "selected" : "" %>>Inpatient</option>
            <option value="Outpatient" <%= "Outpatient".equals(filterType) ? "selected" : "" %>>Outpatient</option>
        </select>
        <button type="submit">Filter</button>
    </form>

    <% if (patients != null && !patients.isEmpty()) { %>
        <p><strong><%= patients.size() %></strong> patients found for type: <strong><%= filterType %></strong>.</p>

        <div class="tools">
            <input type="text" id="searchInput" placeholder="Search patient by name..." onkeyup="filterTable()">
            <button class="export-btn" onclick="exportTableToCSV('patients.csv')">Export CSV</button>
            <button class="print-btn" onclick="confirmPrint()">Print</button>
        </div>

        <table id="patientsTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Phone</th>
                    <th>Reason</th>
                    <th>Patient Type</th>
                </tr>
            </thead>
            <tbody>
                <% for (Patient p : patients) { %>
                    <tr>
                        <td><%= p.getId() %></td>
                        <td><%= p.getFullName() %></td>
                        <td><%= p.getAge() %></td>
                        <td><%= p.getGender() %></td>
                        <td><%= p.getPhone() %></td>
                        <td><%= p.getReason() %></td>
                        <td><%= p.getPatientType() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else if (patients != null) { %>
        <p>No patients found for type: <strong><%= filterType %></strong>.</p>
    <% } %>

    <%@ include file="footer.jsp" %>

    <script>
        // Enable sorting on table
        new Tablesort(document.getElementById('patientsTable'));

        function filterTable() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll("#patientsTable tbody tr");
            rows.forEach(row => {
                const name = row.cells[1].innerText.toLowerCase();
                row.style.display = name.includes(input) ? '' : 'none';
            });
        }

        function exportTableToCSV(filename) {
            const rows = document.querySelectorAll("#patientsTable tr");
            let csv = [];
            rows.forEach(row => {
                const cols = row.querySelectorAll("td, th");
                const rowData = Array.from(cols).map(col => `"${col.innerText}"`).join(",");
                csv.push(rowData);
            });
            const csvFile = new Blob([csv.join("\n")], { type: "text/csv" });
            const link = document.createElement("a");
            link.href = URL.createObjectURL(csvFile);
            link.download = filename;
            link.click();
        }

        function confirmPrint() {
            if (confirm('Do you want to print this patient list?')) {
                window.print();
            }
        }
    </script>

</body>
</html>
