<%@ page session="true"%>
<%@ page import="com.medicarepro.DTO.AdminDTO"%>
<%
AdminDTO adminUser = (AdminDTO) session.getAttribute("adminUser");
if (adminUser == null) {
	response.sendRedirect("login.jsp?error=Please login first");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - MediCarePro HMS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
/>
<style>
body {
  margin: 0;
  font-family: 'Segoe UI', sans-serif;
  padding-top: 70px; /* space for fixed navbar */
  background: 
    linear-gradient(rgba(255, 255, 255, 0.85), rgba(255, 255, 255, 0.85)),
    url('images/background-medical.jpg') no-repeat center center fixed;
  background-size: cover;
  background-color: #f4f6f9; /* fallback color */
}


/* Header */
.header {
  margin: 0 auto 30px auto;
  max-width: 1200px;
  padding: 0 15px;
  height: 60px;
  background: #fff;
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  border-radius: 6px;
}
.header h1 {
  font-size: 28px;
  color: #0d6efd; /* Bootstrap primary blue */
  margin: 0;
  text-align: center;
  padding: 15px 0;
  font-weight: 600;
  letter-spacing: 1px;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  background-color: #ffffff;
  border-bottom: 2px solid #e0e0e0;
}


.logout-btn {
	background: #dc3545;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
	font-size: 14px;
	transition: background 0.3s ease;
}

.logout-btn:hover {
	background: #c82333;
}

/* Content */
.content {
	max-width: 1200px;
	margin: 0 auto;
	padding: 30px 15px;
}

.content h2 {
	color: #333;
	margin-bottom: 10px;
	font-weight: 600;
}

.content p {
	color: #666;
	margin-bottom: 30px;
	font-size: 15px;
}

.dashboard-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 25px;
}

.card {
	background: white;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.05);
	transition: all 0.3s ease;
	cursor: pointer;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.card h3 {
	color: #0d6efd;
	margin-bottom: 10px;
	font-size: 18px;
}

.card p {
	color: #555;
	font-size: 14px;
	margin: 0;
}

/* Navbar fixes */
.navbar-nav .nav-link {
	display: flex;
	align-items: center;
	gap: 8px;
	font-weight: 500;
}

/* Responsive fixes */
@media (max-width: 768px) {
	.content {
		padding: 20px 10px;
	}
	.header {
		padding: 0 10px;
	}
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">MediCarePro HMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="ManagePatient.jsp"><i class="fa-solid fa-user-injured"></i> Manage Patients</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="manageDoctors.jsp"><i class="fa-solid fa-user-doctor"></i> Manage Doctors</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="manageStaff.jsp"><i class="fa-solid fa-people-group"></i> Manage Staff</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="manageDepartments.jsp"><i class="fas fa-hospital"></i> Manage Departments</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewReports.jsp"><i class="fas fa-chart-line"></i> View Reports</a>
        </li>
      </ul>
      <a href="AdminLogoutServlet" class="btn btn-danger">
        <i class="fas fa-sign-out-alt"></i> Logout
      </a>
    </div>
  </div>
</nav>

<!-- Header -->
<div class="header">
	<h1>MediCarePro HMS - Admin Dashboard</h1>
	
</div>

<!-- Main Content -->
<div class="content">
	<h2>Welcome, <%=adminUser.getUsername()%>!</h2>
	<p>Quick access panels to manage hospital operations efficiently.</p>

	<div class="dashboard-grid">
		<!-- Cards -->
		<div class="card" onclick="location.href='ManagePatient.jsp'">
			<h3>Manage Patients</h3>
			<p>Register patients, book appointments, and view records.</p>
		</div>

		<div class="card" onclick="location.href='manageDoctors.jsp'">
			<h3>Manage Doctors</h3>
			<p>Add, edit, delete doctor profiles & schedules.</p>
		</div>

		<div class="card" onclick="location.href='manageStaff.jsp'">
			<h3>Manage Staff</h3>
			<p>Assign roles, manage shifts, and update staff info.</p>
		</div>

		<div class="card" onclick="location.href='manageDepartments.jsp'">
			<h3>Manage Departments</h3>
			<p>Update departments, units, and services.</p>
		</div>

		<div class="card" onclick="location.href='viewReports.jsp'">
			<h3>View Reports</h3>
			<p>Analyze appointments, billing & medical stats.</p>
		</div>
	</div>
</div>

<%
    String bookingMessage = (String) session.getAttribute("bookingMessage");
    if (bookingMessage != null) {
%>
    <div class="alert alert-success text-center" style="margin: 20px auto; max-width: 600px;">
        <%= bookingMessage %>
    </div>
<%
        session.removeAttribute("bookingMessage");
    }
%>

<%@ include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
