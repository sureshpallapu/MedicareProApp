<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Dashboard</title>
<!-- Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	padding-top: 70px; /* Avoid content being hidden under sticky navbar */
}
</style>
</head>
<body>

	<!-- Sticky Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top shadow">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold" href="#">MediCarePro</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#patientNavbar"
				aria-controls="patientNavbar" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="patientNavbar">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<li class="nav-item"><a class="nav-link"
						href="registerPatient.jsp">Register New Patient</a></li>

					<li class="nav-item"><a class="nav-link"
						href="bookAppointment.jsp">Book Appointment</a></li>

					<li class="nav-item"><a class="nav-link"
						href="appointments.jsp">View All Appointments</a></li>

					<li class="nav-item"><a class="nav-link"
						href="appointment_payment.jsp">Generate Bill</a></li>

					<li class="nav-item"><a class="nav-link"
						href="viewPayments.jsp">Payment Records</a></li>

					<li class="nav-item"><a class="nav-link"
						href="filterPatients.jsp">Inpatients / Outpatients</a></li>



					<li class="nav-item"><a class="nav-link"
						href="emergencyPatient.jsp">Emergency Cases</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Bootstrap JS Bundle -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Auto-close navbar on link click -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const navLinks = document.querySelectorAll('.nav-link');
			const navbarCollapse = document.querySelector('.navbar-collapse');

			navLinks.forEach(function(link) {
				link.addEventListener('click', function() {
					const bsCollapse = new bootstrap.Collapse(navbarCollapse, {
						toggle : false
					});
					bsCollapse.hide();
				});
			});
		});
	</script>

</body>
</html>
