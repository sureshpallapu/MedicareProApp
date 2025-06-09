<%@ page import="java.sql.*, com.medicarepro.utility.DBConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Payments</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 30px;
            background-color: #eef1f5;
            color: #333;
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 14px 16px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #34495e;
            color: white;
            text-transform: uppercase;
            font-size: 14px;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        td {
            font-size: 14px;
        }
        .footer {
            margin-top: 50px;
            text-align: center;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>

    <h2>All Payments</h2>

    <table>
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
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getInt("appointment_id") %></td>
                <td><%= rs.getString("patient_name") %></td>
                <td><%= rs.getString("doctor_name") %></td>
                <td><%= rs.getDate("appointment_date") %></td>
                <td><%= rs.getString("transaction_id") != null ? rs.getString("transaction_id") : "N/A" %></td>
                <td><%= rs.getString("status") %></td>
                <td>₹<%= rs.getDouble("consultation_fee") %></td>
                <td><%= rs.getTimestamp("created_at") %></td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='9' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>

    <%@ include file="footer.jsp" %>

</body>
</html>
