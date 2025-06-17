<%@ page import="java.sql.*, com.medicarepro.utility.DBConnector" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Payments - MediCarePro HMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f7fb;
            margin: 0;
            padding: 100px 30px 30px;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #0077b6;
            margin-bottom: 20px;
        }

        .actions {
            max-width: 1200px;
            margin: 0 auto 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .actions input[type="text"] {
            flex: 1;
            padding: 10px 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .export-btn {
            background: #0077b6;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        .export-btn:hover {
            background: #005f8a;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            font-size: 14px;
        }

        th {
            background: #0077b6;
            color: #fff;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        tr:hover {
            background: #eef6ff;
        }

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination button {
            background: #0077b6;
            color: #fff;
            border: none;
            margin: 0 4px;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .pagination button:hover {
            background: #005f8a;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead tr {
                display: none;
            }

            tr {
                margin-bottom: 15px;
                background: #fff;
                box-shadow: 0 2px 8px rgba(0,0,0,0.05);
                border-radius: 8px;
            }

            td {
                text-align: right;
                padding-left: 50%;
                position: relative;
                font-size: 13px;
                border: none;
                border-bottom: 1px solid #eee;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                font-weight: bold;
                color: #555;
                text-transform: uppercase;
            }
        }
    </style>
</head>
<body>

    <%@ include file="patientHeader.jsp" %>

    <h2>All Payments</h2>

    <div class="actions">
        <input type="text" id="searchInput" placeholder="Search payments..." onkeyup="filterTable()">
        <button class="export-btn" onclick="exportTableToCSV('payments.csv')">Export CSV</button>
    </div>

    <table id="paymentsTable">
        <thead>
            <tr>
                <th>Payment ID</th>
                <th>Appointment ID</th>
                <th>Patient</th>
                <th>Doctor</th>
                <th>Date</th>
                <th>Transaction ID</th>
                <th>Status</th>
                <th>Amount</th>
                <th>Timestamp</th>
            </tr>
        </thead>
        <tbody>
        <%
            try (Connection con = DBConnector.getConnection()) {
                String sql = "SELECT pay.id, pay.appointment_id, pay.transaction_id, pay.status, pay.created_at, " +
                             "a.consultation_fee, p.full_name AS patient_name, d.name AS doctor_name, a.appointment_date " +
                             "FROM payments pay " +
                             "JOIN appointments a ON pay.appointment_id = a.id " +
                             "JOIN patients p ON a.patient_id = p.id " +
                             "JOIN doctor d ON a.doctor_id = d.id " +
                             "ORDER BY pay.created_at DESC";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td data-label="Payment ID"><%= rs.getInt("id") %></td>
                <td data-label="Appointment ID"><%= rs.getInt("appointment_id") %></td>
                <td data-label="Patient"><%= rs.getString("patient_name") %></td>
                <td data-label="Doctor"><%= rs.getString("doctor_name") %></td>
                <td data-label="Date"><%= rs.getDate("appointment_date") %></td>
                <td data-label="Transaction ID"><%= rs.getString("transaction_id") != null ? rs.getString("transaction_id") : "N/A" %></td>
                <td data-label="Status"><%= rs.getString("status") %></td>
                <td data-label="Amount">₹<%= rs.getDouble("consultation_fee") %></td>
                <td data-label="Timestamp"><%= rs.getTimestamp("created_at") %></td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='9' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>

    <div class="pagination" id="pagination"></div>

    <%@ include file="footer.jsp" %>

    <script>
        // Search filter
        function filterTable() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const rows = document.querySelectorAll("#paymentsTable tbody tr");
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(input) ? "" : "none";
            });
        }

        // Export CSV
        function exportTableToCSV(filename) {
            const rows = document.querySelectorAll("table tr");
            let csv = [];
            rows.forEach(row => {
                const cols = row.querySelectorAll("td, th");
                let rowData = [];
                cols.forEach(col => rowData.push('"' + col.innerText.replace(/"/g, '""') + '"'));
                csv.push(rowData.join(","));
            });
            const csvString = csv.join("\n");
            const blob = new Blob([csvString], { type: "text/csv" });
            const link = document.createElement("a");
            link.href = URL.createObjectURL(blob);
            link.download = filename;
            link.click();
        }
    </script>

</body>
</html>
