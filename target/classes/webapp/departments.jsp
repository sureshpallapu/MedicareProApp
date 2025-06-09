<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MediCarePro - Doctors</title>
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: #f4f6f8;
	margin: 0;
	padding: 0;
}

.header {
	background: linear-gradient(to right, #007bff, #00c6ff);
	color: white;
	padding: 20px;
	text-align: center;
}

.filter-container {
	text-align: center;
	margin: 20px 0;
}

select {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.doctors-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	max-width: 1200px;
	margin: 0 auto 50px;
	padding: 0 20px;
}

.doctor-card {
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	text-align: center;
	transition: transform 0.3s;
}

.doctor-card img {
	width: 100%;
	height: 250px;
	object-fit: cover;
}

.doctor-card h4 {
	margin: 15px 0 5px;
	font-size: 18px;
}

.doctor-card p {
	color: #555;
	margin-bottom: 15px;
}

.doctor-card button {
	background: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 20px;
	cursor: pointer;
	margin-bottom: 20px;
}

.doctor-card button:hover {
	background: #0056b3;
}
</style>
</head>
<body>

	<div class="header">
		<h1>Our Top Doctors</h1>
		<p>Select Department to View Specialists</p>
	</div>

	<div class="filter-container">
		<select id="departmentFilter" onchange="filterDoctors()">
			<option value="all">All Departments</option>
			<option value="Cardiology">Cardiology</option>
			<option value="Neurology">Neurology</option>
			<option value="Orthopedics">Orthopedics</option>
			<option value="Pediatrics">Pediatrics</option>
			<option value="Internal Medicine">Internal Medicine</option>
		</select>
	</div>

	<div class="doctors-grid" id="doctorsGrid">
		<!-- Example Card -->
		<h3>Cardiology Department</h3>
		<div class="doctor-cards">
			<div class="doctor-card">
				<img src="images/doctor1.jpg" alt="Dr. Anil Kumar">
				<h4>Dr. Anil Kumar</h4>
				<p>Head of Cardiology</p>
				<button onclick="bookAppointment('Dr. Anil Kumar')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor2.jpg" alt="Dr. Priya Sharma">
				<h4>Dr. Priya Sharma</h4>
				<p>Senior Cardiologist</p>
				<button onclick="bookAppointment('Dr. Priya Sharma')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor3.jpg" alt="Dr. Ramesh Gupta">
				<h4>Dr. Ramesh Gupta</h4>
				<p>Cardiac Surgeon</p>
				<button onclick="bookAppointment('Dr. Ramesh Gupta')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor4.jpg" alt="Dr. Sneha Rao">
				<h4>Dr. Sneha Rao</h4>
				<p>Heart Specialist</p>
				<button onclick="bookAppointment('Dr. Sneha Rao')">Book
					Appointment</button>
			</div>
		</div>

		<!-- Neurology Department -->
		<h3>Neurology Department</h3>
		<div class="doctor-cards">
			<div class="doctor-card">
				<img src="images/doctor5.jpg" alt="Dr. Vivek Reddy">
				<h4>Dr. Vivek Reddy</h4>
				<p>Head of Neurology</p>
				<button onclick="bookAppointment('Dr. Vivek Reddy')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor6.jpg" alt="Dr. Neha Joshi">
				<h4>Dr. Neha Joshi</h4>
				<p>Senior Neurologist</p>
				<button onclick="bookAppointment('Dr. Neha Joshi')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor7.jpg" alt="Dr. Arjun Nair">
				<h4>Dr. Arjun Nair</h4>
				<p>Neuro Surgeon</p>
				<button onclick="bookAppointment('Dr. Arjun Nair')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor8.jpg" alt="Dr. Pooja Patel">
				<h4>Dr. Pooja Patel</h4>
				<p>Brain Specialist</p>
				<button onclick="bookAppointment('Dr. Pooja Patel')">Book
					Appointment</button>
			</div>
		</div>

		<!-- Orthopedics Department -->
		<h3>Orthopedics Department</h3>
		<div class="doctor-cards">
			<div class="doctor-card">
				<img src="images/doctor9.jpg" alt="Dr. Rajiv Menon">
				<h4>Dr. Rajiv Menon</h4>
				<p>Head of Orthopedics</p>
				<button onclick="bookAppointment('Dr. Rajiv Menon')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor10.jpg" alt="Dr. Meera Das">
				<h4>Dr. Meera Das</h4>
				<p>Senior Orthopedic Surgeon</p>
				<button onclick="bookAppointment('Dr. Meera Das')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor11.jpg" alt="Dr. Sanjay Kulkarni">
				<h4>Dr. Sanjay Kulkarni</h4>
				<p>Consultant Orthopedist</p>
				<button onclick="bookAppointment('Dr. Sanjay Kulkarni')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor12.jpg" alt="Dr. Anita Verma">
				<h4>Dr. Anita Verma</h4>
				<p>Orthopedic Specialist</p>
				<button onclick="bookAppointment('Dr. Anita Verma')">Book
					Appointment</button>
			</div>
		</div>

		<!-- Pediatrics Department -->
		<h3>Pediatrics Department</h3>
		<div class="doctor-cards">
			<div class="doctor-card">
				<img src="images/doctor13.jpg" alt="Dr. Kiran Bhatia">
				<h4>Dr. Kiran Bhatia</h4>
				<p>Head of Pediatrics</p>
				<button onclick="bookAppointment('Dr. Kiran Bhatia')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor14.jpg" alt="Dr. Ritu Agarwal">
				<h4>Dr. Ritu Agarwal</h4>
				<p>Senior Pediatrician</p>
				<button onclick="bookAppointment('Dr. Ritu Agarwal')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor15.jpg" alt="Dr. Manish Kapoor">
				<h4>Dr. Manish Kapoor</h4>
				<p>Consultant Pediatrician</p>
				<button onclick="bookAppointment('Dr. Manish Kapoor')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor16.jpg" alt="Dr. Swathi Rao">
				<h4>Dr. Swathi Rao</h4>
				<p>Child Care Specialist</p>
				<button onclick="bookAppointment('Dr. Swathi Rao')">Book
					Appointment</button>
			</div>
		</div>

		<!-- General Medicine Department -->
		<h3>General Medicine Department</h3>
		<div class="doctor-cards">
			<div class="doctor-card">
				<img src="images/doctor17.jpg" alt="Dr. Arvind Joshi">
				<h4>Dr. Arvind Joshi</h4>
				<p>Head of General Medicine</p>
				<button onclick="bookAppointment('Dr. Arvind Joshi')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor18.jpg" alt="Dr. Kavya Shetty">
				<h4>Dr. Kavya Shetty</h4>
				<p>Senior Physician</p>
				<button onclick="bookAppointment('Dr. Kavya Shetty')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor19.jpg" alt="Dr. Rohit Chandra">
				<h4>Dr. Rohit Chandra</h4>
				<p>Consultant General Physician</p>
				<button onclick="bookAppointment('Dr. Rohit Chandra')">Book
					Appointment</button>
			</div>
			<div class="doctor-card">
				<img src="images/doctor20.jpg" alt="Dr. Deepika Sen">
				<h4>Dr. Deepika Sen</h4>
				<p>Internal Medicine Specialist</p>
				<button onclick="bookAppointment('Dr. Deepika Sen')">Book
					Appointment</button>
			</div>
		</div>

	</div>

	<script>
		function filterDoctors() {
			var filter = document.getElementById('departmentFilter').value;
			var cards = document.querySelectorAll('.doctor-card');
			cards.forEach(function(card) {
				var dept = card.getAttribute('data-department');
				if (filter === 'all' || dept === filter) {
					card.style.display = 'block';
				} else {
					card.style.display = 'none';
				}
			});
		}

		function bookAppointment(doctorName) {
			alert('Booking appointment with ' + doctorName);
		}
	</script>
  <%@ include file="footer.jsp" %>
</body>
</html>
