<%@ page import="com.medicarepro.DTO.Staff" %>
<%@ page session="true" %>
<%
Staff staff = (Staff) session.getAttribute("loggedInStaff");
if (staff == null) {
	response.sendRedirect("staffLogin.jsp");
	return;
}
%>

<%@ include file="staffheaderbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Receptionist Dashboard - MediCarePro</title>
<style>
  /* Background image + overlay */
   body {
    margin: 0;
    height: 100vh;
    background:
      linear-gradient(rgba(255, 255, 255, 0.85), rgba(255, 255, 255, 0.85)),
      url('<%=request.getContextPath()%>/images/background-medical.jpg') no-repeat center center fixed;
    background-size: cover;
  }
  .dashboard-container {
    padding: 40px 20px;
    max-width: 1200px;
    margin: auto;
  }

  h2 {
    text-align: center;
    color: #0e4a7b;
    margin-bottom: 20px;
  }

  .welcome {
    text-align: center;
    font-size: 18px;
    margin-bottom: 35px;
    font-weight: 600;
  }

  .card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 25px;
  }

  .card {
    background: #ffffff;
    border-radius: 12px;
    padding: 25px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    cursor: pointer;
  }

  .card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
  }

  .card i {
    font-size: 36px;
    color: #3498db;
    margin-bottom: 12px;
  }

  .card a {
    display: block;
    text-decoration: none;
    color: #2c3e50;
    font-weight: 600;
    font-size: 16px;
    transition: color 0.3s ease;
  }

  .card a:hover {
    color: #0e4a7b;
  }

  .logout-btn {
    grid-column: 1 / -1;
    text-align: center;
    margin-top: 40px;
  }

  .logout-btn a {
    text-decoration: none;
    background: #e74c3c;
    color: white;
    padding: 12px 30px;
    border-radius: 6px;
    font-weight: bold;
    font-size: 16px;
    transition: background 0.3s ease;
    display: inline-block;
  }

  .logout-btn a:hover {
    background: #c0392b;
  }

  @media (max-width: 480px) {
    .card {
      padding: 20px;
    }
  }
</style>
</head>
<body>
  <div class="dashboard-container">
    <h2>Receptionist Dashboard</h2>
    <div class="welcome">
      Welcome, <b><%= staff.getName() %></b>!
    </div>

    <div class="card-grid">
      <!-- Patient Management -->
      <div class="card">
        <i class="fas fa-user-plus"></i>
        <a href="adminreceptionPatientRegister.jsp">Register New Patient</a>
      </div>
      <div class="card">
        <i class="fas fa-calendar-plus"></i>
        <a href="bookAppointment.jsp">Book Appointment</a>
      </div>
      <div class="card">
        <i class="fas fa-procedures"></i>
        <a href="filterPatients.jsp">Inpatients / Outpatients</a>
      </div>
      <div class="card">
        <i class="fas fa-ambulance"></i>
        <a href="emergencyPatient.jsp">Emergency Cases</a>
      </div>

      <!-- Appointment Management -->
      <div class="card">
        <i class="fas fa-calendar-alt"></i>
        <a href="appointments.jsp">View Appointments</a>
      </div>

      <!-- Billing -->
      <div class="card">
        <i class="fas fa-receipt"></i>
        <a href="appointment_payment.jsp">Generate Bill</a>
      </div>
      <div class="card">
        <i class="fas fa-money-check-alt"></i>
        <a href="viewPayments.jsp">Payment Records</a>
      </div>

      <div class="logout-btn">
        <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
      </div>
    </div>
  </div>

  <%@ include file="footer.jsp" %>
  
  <!-- Font Awesome for icons -->
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
