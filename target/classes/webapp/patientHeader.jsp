<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome (for icons) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Top Navbar with Sidebar Toggle -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow">
  <div class="container-fluid">
    <!-- Sidebar Toggle Button -->
    <button class="btn btn-primary me-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Brand -->
    <a class="navbar-brand fw-bold" href="adminDashboard.jsp">MediCarePro HMS</a>

    <!-- Collapse Toggler for main navbar links -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Main Navbar Links -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="ManagePatient.jsp"><i class="fa-solid fa-user-injured"></i> Manage Patients</a></li>
        <li class="nav-item"><a class="nav-link" href="manageDoctors.jsp"><i class="fa-solid fa-user-doctor"></i> Manage Doctors</a></li>
        <li class="nav-item"><a class="nav-link" href="manageStaff.jsp"><i class="fa-solid fa-people-group"></i> Manage Staff</a></li>
        <li class="nav-item"><a class="nav-link" href="manageDepartments.jsp"><i class="fas fa-hospital"></i> Manage Departments</a></li>
        <li class="nav-item"><a class="nav-link" href="viewReports.jsp"><i class="fas fa-chart-line"></i> View Reports</a></li>
        <li class="nav-item position-relative">
          <a class="nav-link" href="#"><i class="fa-solid fa-bell"></i>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
          </a>
        </li>
      </ul>
      <!-- Logout Button -->
      <a href="AdminLogoutServlet" class="btn btn-light"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
  </div>
</nav>

<!-- Offcanvas Sidebar for Patient Menu -->
<div class="offcanvas offcanvas-start text-bg-dark" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="sidebarMenuLabel">Patient Menu</h5>
    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <ul class="nav flex-column">
      <li class="nav-item"><a class="nav-link text-white" href="registerPatient.jsp">Register New Patient</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="bookAppointment.jsp">Book Appointment</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="appointments.jsp">View All Appointments</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="appointment_payment.jsp">Generate Bill</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="viewPayments.jsp">Payment Records</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="filterPatients.jsp">Inpatients / Outpatients</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="emergencyPatient.jsp">Emergency Cases</a></li>
    </ul>
  </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
