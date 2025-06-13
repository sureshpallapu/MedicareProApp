<%@ page import="com.medicarepro.DTO.Staff"%>
<%@ page session="true"%>


<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<%
Staff staff = (Staff) session.getAttribute("loggedInStaff");
if (staff == null) {
	response.sendRedirect("staffLogin.jsp");
	return;
}
%>

<%@ include file="staffheaderbar.jsp"%>

<!DOCTYPE html> 
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Receptionist Dashboard - MediCarePro</title>
<style>
body {
	margin: 0;
	min-height: 100vh;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)),
		url('<%=request.getContextPath()%>/images/background-medical.jpg') no-repeat center center fixed;
	background-size: cover;
	color: #222;
	padding-top: 70px;
}

/* Dark Mode */
@media (prefers-color-scheme: dark) {
	body {
		background: linear-gradient(rgba(18, 18, 18, 0.9), rgba(18, 18, 18, 0.9)),
			url('<%=request.getContextPath()%>/images/background-medical.jpg') no-repeat center center fixed;
		color: #f1f1f1;
	}
}

.dashboard-container {
	padding: 50px 25px;
	max-width: 1200px;
	margin: auto;
	background: rgba(255, 255, 255, 0.85);
	border-radius: 16px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	animation: fadeInContainer 0.8s ease-in-out;
}

@keyframes fadeInContainer {
	from { opacity: 0; transform: translateY(30px); }
	to { opacity: 1; transform: translateY(0); }
}

h2 {
	text-align: center;
	color: #0e4a7b;
	margin-bottom: 24px;
	font-size: 32px;
	font-weight: 700;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

.welcome {
	text-align: center;
	font-size: 20px;
	margin-bottom: 40px;
	font-weight: 600;
	color: #34495e;
	animation: fadeInText 1s ease;
}

@keyframes fadeInText {
	from { opacity: 0; transform: translateY(10px); }
	to { opacity: 1; transform: translateY(0); }
}

@keyframes fadeSlideUp {
	from { opacity: 0; transform: translateY(40px); }
	to { opacity: 1; transform: translateY(0); }
}

@keyframes iconBounce {
	0%, 100% { transform: translateY(0); }
	50% { transform: translateY(-6px); }
}

.card-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
	gap: 24px;
	padding: 10px 0;
}

.card {
	background: rgba(255, 255, 255, 0.95);
	border-radius: 16px;
	padding: 28px 20px;
	text-align: center;
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	backdrop-filter: blur(4px);
	border: 1px solid rgba(200, 200, 200, 0.3);
	cursor: pointer;
	animation: fadeSlideUp 0.6s ease forwards;
	opacity: 0;
}

.card:nth-child(1) { animation-delay: 0.1s; }
.card:nth-child(2) { animation-delay: 0.2s; }
.card:nth-child(3) { animation-delay: 0.3s; }
.card:nth-child(4) { animation-delay: 0.4s; }
.card:nth-child(5) { animation-delay: 0.5s; }
.card:nth-child(6) { animation-delay: 0.6s; }
.card:nth-child(7) { animation-delay: 0.7s; }

.card:hover {
	transform: translateY(-8px);
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
}

.card i {
	font-size: 40px;
	color: #2d98da;
	margin-bottom: 16px;
	transition: color 0.3s ease;
}

.card:hover i {
	color: #0e4a7b;
	animation: iconBounce 0.6s ease;
}

.card a {
	display: block;
	text-decoration: none;
	color: #2c3e50;
	font-weight: 600;
	font-size: 17px;
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
			Welcome, <b><%=staff.getName()%></b>!
		</div>

		<div class="card-grid">
			<!-- Patient Management -->
			<div class="card">
				<i class="fas fa-user-plus"></i> <a
					href="adminreceptionPatientRegister.jsp">Register New Patient</a>
			</div>
			<div class="card">
				<i class="fas fa-calendar-plus"></i> <a href="bookAppointment.jsp">Book
					Appointment</a>
			</div>
			<div class="card">
				<i class="fas fa-procedures"></i> <a href="filterPatients.jsp">Inpatients
					/ Outpatients</a>
			</div>
			<div class="card">
				<i class="fas fa-ambulance"></i> <a href="emergencyPatient.jsp">Emergency
					Cases</a>
			</div>

			<!-- Appointment Management -->
			<div class="card">
				<i class="fas fa-calendar-alt"></i> <a href="appointments.jsp">View
					Appointments</a>
			</div>

			<!-- Billing -->
			<div class="card">
				<i class="fas fa-receipt"></i> <a href="appointment_payment.jsp">Generate
					Bill</a>
			</div>
			<div class="card">
				<i class="fas fa-money-check-alt"></i> <a href="viewPayments.jsp">Payment
					Records</a>
			</div>

			<div class="logout-btn">
				<a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<!-- Font Awesome for icons -->
	<script src="https://kit.fontawesome.com/a076d05399.js"
		crossorigin="anonymous"></script>
</body>
</html>
