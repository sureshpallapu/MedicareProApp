<%@ page import="java.sql.*, com.medicarepro.utility.DBConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Reports - MediCarePro HMS</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: #f4f9fd;
      margin: 0;
      padding: 100px 30px 30px;
      color: #333;
    }

    /* Navbar */
    .navbar {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      background: #0077b6;
      padding: 15px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      z-index: 1000;
    }

    .navbar-brand {
      font-size: 20px;
      font-weight: 600;
      color: #fff;
      text-decoration: none;
      margin-right: 20px;
    }

    .navbar a {
      color: #fff;
      text-decoration: none;
      font-weight: 500;
      margin-right: 20px;
    }

    .navbar a:hover {
      text-decoration: underline;
    }

    .navbar-toggle {
      display: none;
      background: none;
      border: none;
      font-size: 24px;
      color: #fff;
      cursor: pointer;
    }

    .navbar-links {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }

    .logout-btn {
      background: #d90429;
      padding: 8px 16px;
      border-radius: 6px;
      font-weight: 600;
    }

    .logout-btn:hover {
      background: #a1031e;
    }

    @media (max-width: 768px) {
      .navbar-toggle {
        display: block;
      }

      .navbar-links {
        display: none;
        flex-direction: column;
        width: 100%;
        margin-top: 10px;
      }

      .navbar-links.show {
        display: flex;
      }

      .navbar-links a {
        padding: 10px 0;
        margin-right: 0;
      }
    }

    /* Headings */
    h2 {
      color: #006494;
      margin-bottom: 30px;
      text-align: center;
    }

    /* KPI Cards */
    .kpi-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
      margin-bottom: 40px;
    }

    .kpi-card {
      flex: 1 1 200px;
      background: #fff;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      text-align: center;
      transition: transform 0.2s;
    }

    .kpi-card:hover {
      transform: translateY(-5px);
    }

    .kpi-card h4 {
      margin: 0 0 10px;
      font-size: 16px;
      color: #555;
    }

    .kpi-card p {
      font-size: 28px;
      margin: 0;
      font-weight: bold;
      color: #0077b6;
    }

    /* Report Sections */
    .report-section {
      background: #fff;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.06);
      margin-bottom: 40px;
    }

    .report-section h3 {
      margin-top: 0;
      margin-bottom: 20px;
      color: #0077b6;
    }

    /* Table */
    .report-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .report-table th, .report-table td {
      padding: 12px 15px;
      border: 1px solid #ddd;
      text-align: left;
    }

    .report-table th {
      background: #cceeff;
      font-weight: 600;
    }

    .report-table tr:nth-child(even) {
      background: #f9f9f9;
    }

    .report-table tr:hover {
      background: #eef6ff;
    }

  </style>
</head>
<body>

  <nav class="navbar">
    <a class="navbar-brand" href="adminDashboard.jsp">MediCarePro HMS</a>
    <button class="navbar-toggle" onclick="toggleNavbar()">
      <i class="fas fa-bars"></i>
    </button>
    <div class="navbar-links">
      <a href="ManagePatient.jsp"><i class="fa-solid fa-user-injured"></i> Patients</a>
      <a href="manageDoctors.jsp"><i class="fa-solid fa-user-doctor"></i> Doctors</a>
      <a href="manageStaff.jsp"><i class="fa-solid fa-people-group"></i> Staff</a>
      <a href="manageDepartments.jsp"><i class="fas fa-hospital"></i> Departments</a>
      <a href="viewReports.jsp"><i class="fas fa-chart-line"></i> Reports</a>
      <a href="#"><i class="fa-solid fa-bell"></i> <span class="badge bg-danger">3</span></a>
      <a href="AdminLogoutServlet" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
  </nav>

  <script>
    function toggleNavbar() {
      var links = document.querySelector('.navbar-links');
      links.classList.toggle('show');
    }
  </script>

  <h2>Hospital Reports Dashboard</h2>

  <%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int totalPatients = 0, totalDoctors = 0, totalStaff = 0;

    try {
      conn = DBConnector.getConnection();

      ps = conn.prepareStatement("SELECT COUNT(*) FROM patients");
      rs = ps.executeQuery();
      if (rs.next()) totalPatients = rs.getInt(1);
      rs.close(); ps.close();

      ps = conn.prepareStatement("SELECT COUNT(*) FROM doctor");
      rs = ps.executeQuery();
      if (rs.next()) totalDoctors = rs.getInt(1);
      rs.close(); ps.close();

      ps = conn.prepareStatement("SELECT COUNT(*) FROM staff");
      rs = ps.executeQuery();
      if (rs.next()) totalStaff = rs.getInt(1);
      rs.close(); ps.close();
  %>

  <div class="kpi-container">
    <div class="kpi-card">
      <h4>Total Patients</h4>
      <p><%= totalPatients %></p>
    </div>
    <div class="kpi-card">
      <h4>Total Doctors</h4>
      <p><%= totalDoctors %></p>
    </div>
    <div class="kpi-card">
      <h4>Total Staff</h4>
      <p><%= totalStaff %></p>
    </div>
    <div class="kpi-card">
      <h4>Monthly Revenue</h4>
      <p>$250,000</p>
    </div>
  </div>

  <div class="report-section">
    <h3>Department-wise Patient Count</h3>
    <table class="report-table">
      <tr>
        <th>Department</th>
        <th>Patients</th>
      </tr>
      <%
        ps = conn.prepareStatement(
          "SELECT d.name, COUNT(p.id) AS patient_count FROM departments d LEFT JOIN patients p ON d.id = p.id GROUP BY d.name"
        );
        rs = ps.executeQuery();
        while (rs.next()) {
      %>
      <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getInt("patient_count") %></td>
      </tr>
      <%
        }
      %>
    </table>
  </div>

  <div class="report-section">
    <h3>Revenue Overview</h3>
    <p><em>Note: This is sample data. Connect to billing for real-time figures.</em></p>
    <p>Monthly Revenue: <strong>$250,000</strong></p>
    <p>Annual Revenue: <strong>$3,000,000</strong></p>
  </div>

  <%
    } catch (Exception e) {
      out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
      e.printStackTrace();
    } finally {
      if (rs != null) try { rs.close(); } catch (Exception ignored) {}
      if (ps != null) try { ps.close(); } catch (Exception ignored) {}
      if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
  %>

  <%@ include file="footer.jsp" %>

</body>
</html>
