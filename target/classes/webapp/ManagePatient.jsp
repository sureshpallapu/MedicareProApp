<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="patientHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Patients | MediCarePro</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<style>
body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #f0f2f5;
  margin: 0;
  padding: 70px 20px 20px 20px; /* padding-top for navbar */
}

h1 {
  text-align: center;
  color: #007bff;
  margin-bottom: 40px;
  font-weight: 700;
}

.dashboard {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 25px;
}

.card {
  background: #fff;
  border-radius: 12px;
  padding: 25px;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  text-align: left;
  position: relative;
  min-height: 160px;
}

.card:hover {
  transform: translateY(-6px);
  box-shadow: 0 10px 24px rgba(0, 0, 0, 0.12);
}

.card h3 {
  color: #007bff;
  margin-bottom: 10px;
  font-weight: 600;
  font-size: 1.2rem;
}

.card p {
  color: #555;
  font-size: 15px;
  margin-bottom: 20px;
}

.card a {
  display: inline-block;
  background-color: #007bff;
  color: #fff;
  text-decoration: none;
  padding: 10px 18px;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 500;
  transition: background-color 0.3s ease;
}

.card a:hover {
  background-color: #0056b3;
}

.card i {
  font-size: 28px;
  color: #007bff;
  margin-bottom: 10px;
  display: block;
}

@media (max-width: 576px) {
  h1 {
    font-size: 1.5rem;
  }
}
</style>
</head>
<body>

  <div class="container">
    <h1>👥 Patient Management Dashboard</h1>

    <div class="dashboard">
      <div class="card">
        <i class="fas fa-user-plus"></i>
        <h3>Register New Patient</h3>
        <p>Add personal, medical, and contact details for a new patient.</p>
        <a href="adminreceptionPatientRegister.jsp">Register</a>
      </div>

      <div class="card">
        <i class="fas fa-calendar-plus"></i>
        <h3>Book Appointment</h3>
        <p>Schedule appointments with available doctors.</p>
        <a href="bookAppointment.jsp">Book Now</a>
      </div>

      <div class="card">
        <i class="fas fa-calendar-check"></i>
        <h3>View All Appointments</h3>
        <p>Viewing All the Appointments.</p>
        <a href="appointments.jsp">📅 View All</a>
      </div>

      <div class="card">
        <i class="fas fa-file-invoice-dollar"></i>
        <h3>Generate Bill</h3>
        <p>Create billing for consultation and services.</p>
        <a href="appointment_payment.jsp">Generate</a>
      </div>

      <div class="card">
        <i class="fas fa-money-check-alt"></i>
        <h3>Payment Records</h3>
        <p>View all transaction and payment history.</p>
        <a href="viewPayments.jsp">View Payments</a>
      </div>

      <div class="card">
        <i class="fas fa-filter"></i>
        <h3>Inpatients / Outpatients</h3>
        <p>Filter and manage admitted and outpatient records.</p>
        <a href="filterPatients.jsp">Filter</a>
      </div>

      <div class="card">
        <i class="fas fa-ambulance"></i>
        <h3>Emergency Cases</h3>
        <p>Register and prioritize patients in critical conditions.</p>
        <a href="emergencyPatient.jsp">Add Emergency</a>
      </div>
    </div>
  </div>

<%@ include file="footer.jsp" %>
</body>
</html>
