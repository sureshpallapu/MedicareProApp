<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>About MediCarePro</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	padding: 30px;
}

h1 {
	color: #007bff;
}

p {
	line-height: 1.8;
	font-size: 1.1rem;
}

.footer {
	background-color: #343a40;
	color: white;
	text-align: center;
	padding: 15px;
	margin-top: 40px;
}
</style>
</head>
<body>
<%@ include file="header.jsp"%>
	<h1>About MediCarePro</h1>

	<div class="container">
		<h2>Who We Are</h2>
		<p>MediCarePro is a comprehensive Hospital Management System
			designed to streamline healthcare operations. Our platform
			efficiently manages patient records, appointments, pharmacy,
			laboratory, and staff with an intuitive interface, helping hospitals
			deliver superior patient care while reducing administrative burdens.</p>

		<h2>What We Do</h2>
		<p>We offer an all-in-one digital solution that automates daily
			tasks, improves communication between departments, and ensures data
			accuracy. MediCarePro enhances productivity, reduces paperwork, and
			helps healthcare professionals focus on what matters most: patient
			well-being.</p>

		<h2>Why Choose Us</h2>
		<p>With a focus on reliability, scalability, and security,
			MediCarePro adapts to the unique needs of every healthcare facility.
			Our system integrates seamlessly with existing workflows and complies
			with industry standards to ensure quality and safety in healthcare
			delivery.</p>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
