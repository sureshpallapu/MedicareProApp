<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
	rel="stylesheet">

<!-- Custom Styles -->
<style>
body {
	font-family: 'Poppins', sans-serif;
	background-color: #f8f9fa;
}

.navbar-brand {
	font-weight: bold;
	font-size: 1.6rem;
	letter-spacing: 1px;
}

.nav-link {
	font-weight: 500;
	padding: 8px 15px !important;
	transition: all 0.3s ease;
}

.nav-link:hover {
	color: #ffc107 !important;
}

.dropdown-menu {
	border-radius: 10px;
}

@media ( max-width : 991.98px) {
	.nav-link {
		padding: 10px 0 !important;
	}
	.navbar-collapse {
		background-color: #343a40;
		border-radius: 10px;
		padding: 10px;
	}
	.dropdown-menu {
		background-color: #343a40;
	}
	.dropdown-item {
		color: #fff;
	}
	.dropdown-item:hover {
		background-color: #495057;
	}
}
</style>

<!-- Navbar -->
<nav
	class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">MediCarePro</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarContent">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarContent">
			<ul class="navbar-nav ms-auto align-items-lg-center">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="aboutUsDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						About Us </a>
					<ul class="dropdown-menu dropdown-menu-dark"
						aria-labelledby="aboutUsDropdown">
						<li><a class="dropdown-item" href="aboutMedicarePro.jsp">About
								MediCarePro</a></li>
						<li><a class="dropdown-item" href="vision.jsp">Vision</a></li>
						<li><a class="dropdown-item" href="missionValues.jsp">Mission
								& Values</a></li>
						<li><a class="dropdown-item" href="qualitySafety.jsp">Quality
								& Safety</a></li>
					</ul></li>


				<li class="nav-item"><a class="nav-link" href="doctors.jsp">Doctors</a></li>

				<!-- Login -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="adminDoctorLogin"
					role="button" data-bs-toggle="dropdown"> Login </a>
					<ul class="dropdown-menu dropdown-menu-dark">
						<li><a class="dropdown-item" href="adminlogin.jsp">Admin
								Login</a></li>
						<li><a class="dropdown-item" href="doctorLogin.jsp">Doctor
								Login</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="staffLogin.jsp">Staff
								Login</a></li>
						
					</ul></li>

				<!-- Patient -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="patientMenu"
					role="button" data-bs-toggle="dropdown"> Patient </a>
					<ul class="dropdown-menu dropdown-menu-dark">
						<li><a class="dropdown-item"
							href="registerPatient.jsp">Register</a></li>
						<li><a class="dropdown-item" href="patientLogin.jsp">Login</a></li>
					</ul></li>


				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- Bootstrap Bundle with Popper (v5) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
