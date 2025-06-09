<%@ page import="com.medicarepro.DTO.Doctor"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*"%>
<%@ page session="true"%>

<%
HttpSession session1 = request.getSession(false);
Doctor doctor = (Doctor) session1.getAttribute("doctor");

if (doctor == null) {
	response.sendRedirect("doctorLogin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Doctor Dashboard - MediCarePro</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		body {
			background-color: #f5f9ff;
			font-family: 'Poppins', sans-serif;
		}

		.dashboard-header {
			background-color: #007bff;
			color: white;
			padding: 30px 20px;
			border-radius: 0 0 12px 12px;
			box-shadow: 0 2px 10px rgba(0, 123, 255, 0.2);
		}

		.card {
			transition: transform 0.2s ease-in-out;
			border: none;
			border-radius: 10px;
		}

		.card:hover {
			transform: scale(1.02);
			box-shadow: 0 5px 15px rgba(0, 123, 255, 0.2);
		}

		.card-title {
			font-weight: 600;
			color: #007bff;
		}

		.footer-spacer {
			margin-top: 60px;
		}
	</style>
</head>
<body>

	<div class="dashboard-header text-center">
		<h1>Welcome, Dr. <%=doctor.getName()%></h1>
		<p>Your personalized dashboard</p>
	</div>

	<div class="container my-5">
		<div class="row g-4 justify-content-center">
			<!-- Appointments Card -->
			<div class="col-md-5 col-lg-4">
				<div class="card shadow-sm text-center p-4">
					<div class="card-body">
						<h5 class="card-title">My Appointments</h5>
						<p class="card-text">View and manage upcoming appointments.</p>
						<a href="DoctorAppointmentsServlet" class="btn btn-primary">View Appointments</a>
					</div>
				</div>
			</div>

			
		<div class="text-center mt-5">
			<a href="logout" class="btn btn-danger px-4">Logout</a>
		</div>
	</div>

	<!-- Footer Include -->
	<%@ include file="footer.jsp" %>

</body>
</html>
