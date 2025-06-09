<%@ page session="true" %>
<%@ page import="com.medicarepro.DTO.Staff" %>


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="#">
      <i class="fas fa-clinic-medical me-2"></i> MediCarePro HMS
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#staffNavbar" aria-controls="staffNavbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="staffNavbar">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="adminreceptionPatientRegister.jsp"><i class="fas fa-user-plus me-1"></i> Register Patient</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="bookAppointment.jsp"><i class="fas fa-calendar-plus me-1"></i> Book Appointment</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="filterPatients.jsp"><i class="fas fa-procedures me-1"></i> Inpatients / Outpatients</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="emergencyPatient.jsp"><i class="fas fa-ambulance me-1"></i> Emergency Cases</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="appointments.jsp"><i class="fas fa-calendar-alt me-1"></i> View Appointments</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="appointment_payment.jsp"><i class="fas fa-receipt me-1"></i> Generate Bill</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewPayments.jsp"><i class="fas fa-money-check-alt me-1"></i> Payment Records</a>
        </li>
      </ul>

      
      <a href="<%= request.getContextPath() %>/LogoutServlet" class="btn btn-outline-light">
        <i class="fas fa-sign-out-alt me-1"></i> Logout
      </a>
    </div>
  </div>
</nav>

<!-- Add spacing so content below navbar is visible -->
<style>
  body {
    padding-top: 70px; /* Adjust this if navbar height changes */
  }
</style>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
