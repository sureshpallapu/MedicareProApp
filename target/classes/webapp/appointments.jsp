<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<%@ page import="com.medicarepro.DAO.AppointmentDAO"%>
<%@ page import="com.medicarepro.DTO.Appointment"%>
<%@ include file="patientHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>All Appointments - Admin</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>
	<style>
		body {
			background-color: #f0f4f8;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		}
		.container {
			margin-top: 50px;
			margin-bottom: 50px;
			background-color: #ffffff;
			padding: 40px 50px;
			border-radius: 16px;
			box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
		}
		h2 {
			font-weight: 700;
			color: #0d6efd;
			margin-bottom: 30px;
			text-align: center;
			border-bottom: 2px solid #dee2e6;
			padding-bottom: 10px;
		}
		.filters input {
			width: 100%;
			padding: 8px;
			margin-bottom: 10px;
			border-radius: 8px;
			border: 1px solid #ccc;
		}
		.badge-fee {
			background-color: #ffc107;
			color: #000;
			font-size: 14px;
			padding: 6px 12px;
			border-radius: 20px;
			font-weight: 500;
		}
	</style>
</head>
<body>
	<div class="container">
		<h2>All Appointments</h2>

		<!-- Filter Fields -->
		<div class="row filters mb-4">
			<div class="col-md-4">
				<input type="text" id="doctorFilter" onkeyup="filterTable()" placeholder=" Search by Doctor Name" class="form-control">
			</div>
			<div class="col-md-4">
				<input type="text" id="patientFilter" onkeyup="filterTable()" placeholder=" Search by Patient Name" class="form-control">
			</div>
			<div class="col-md-4">
				<input type="date" id="dateFilter" onchange="filterTable()" class="form-control">
			</div>
		</div>

		<!-- Export Buttons -->
		<div class="text-end mb-3">
			<button class="btn btn-success me-2" onclick="exportToExcel()">Export to Excel</button>
			<button class="btn btn-danger" onclick="exportToPDF()"> Export to PDF</button>
		</div>

		<%
			AppointmentDAO dao = new AppointmentDAO();
			List<Appointment> appointments = dao.getAllAppointments();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

			if (appointments == null || appointments.isEmpty()) {
		%>
			<div class="alert alert-warning text-center">
				⚠️ No appointments found.
			</div>
		<% } else { %>

		<div class="table-responsive">
			<table class="table table-bordered table-hover table-striped" id="appointmentsTable">
				<thead class="table-primary">
					<tr>
						<th>Appointment ID</th>
						<th>Date</th>
						<th>Time Slot</th>
						<th>Patient Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Doctor</th>
						<th>Fee</th>
					</tr>
				</thead>
				<tbody>
					<% for (Appointment ap : appointments) { %>
					<tr>
						<td><%= ap.getId() %></td>
						<td><%= sdf.format(ap.getAppointmentDate()) %></td>
						<td><%= ap.getTimeSlot() %></td>
						<td><%= ap.getPatientName() != null ? ap.getPatientName() : "N/A" %></td>
						<td><%= ap.getPatientEmail() != null ? ap.getPatientEmail() : "N/A" %></td>
						<td><%= ap.getPatientMobile() != null ? ap.getPatientMobile() : "N/A" %></td>
						<td><%= ap.getDoctorName() != null ? ap.getDoctorName() : "N/A" %></td>
						<td><span class="badge-fee"><%= ap.getConsultationFee() %></span></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
		<% } %>
	</div>

	<%@ include file="footer.jsp" %>

	<script>
		function filterTable() {
			const doctor = document.getElementById("doctorFilter").value.toLowerCase();
			const patient = document.getElementById("patientFilter").value.toLowerCase();
			const date = document.getElementById("dateFilter").value;

			const rows = document.querySelectorAll("#appointmentsTable tbody tr");

			rows.forEach(row => {
				const doctorName = row.cells[6].innerText.toLowerCase();
				const patientName = row.cells[3].innerText.toLowerCase();
				const appointmentDate = row.cells[1].innerText.split("-").reverse().join("-");

				const show =
					(doctor === "" || doctorName.includes(doctor)) &&
					(patient === "" || patientName.includes(patient)) &&
					(date === "" || date === appointmentDate);

				row.style.display = show ? "" : "none";
			});
		}

		function exportToExcel() {
			const table = document.getElementById("appointmentsTable");
			const workbook = XLSX.utils.table_to_book(table, { sheet: "Appointments" });
			XLSX.writeFile(workbook, "Appointments.xlsx");
		}

		function exportToPDF() {
			const { jsPDF } = window.jspdf;
			const doc = new jsPDF();

			doc.text("Appointments Report", 14, 16);
			doc.autoTable({
				html: '#appointmentsTable',
				startY: 20,
				theme: 'grid',
				styles: { fontSize: 10 },
				headStyles: { fillColor: [13, 110, 253] }
			});
			doc.save('Appointments.pdf');
		}
	</script>
</body>
</html>
