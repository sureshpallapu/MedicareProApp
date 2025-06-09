<%@ page import="java.sql.*, com.medicarepro.utility.DBConnector"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
String inputAppointmentId = request.getParameter("appointmentId");
boolean found = false;
int appointmentId = 0;
double amount = 0.0;
String patientName = "", doctorName = "", timeSlot = "";
java.sql.Date appointmentDate = null;

if (inputAppointmentId != null && !inputAppointmentId.trim().isEmpty()) {
	try {
		appointmentId = Integer.parseInt(inputAppointmentId);

		try (Connection con = DBConnector.getConnection()) {
	String sql = "SELECT a.consultation_fee, p.full_name AS patient_name, d.name AS doctor_name, "
			+ "a.appointment_date, a.time_slot " + "FROM appointments a "
			+ "JOIN patients p ON a.patient_id = p.id " + "JOIN doctor d ON a.doctor_id = d.id "
			+ "WHERE a.id = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, appointmentId);
	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
		found = true;
		amount = rs.getDouble("consultation_fee");
		patientName = rs.getString("patient_name");
		doctorName = rs.getString("doctor_name");
		appointmentDate = rs.getDate("appointment_date");
		timeSlot = rs.getString("time_slot");
	}
		}
	} catch (NumberFormatException nfe) {
		out.println("<p style='color:red;'>Invalid Appointment ID format.</p>");
	} catch (Exception e) {
		out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Pay for Appointment</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<style>
  body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  .container {
    max-width: 700px;
    background: #fff;
    padding: 30px 40px;
    margin-top: 40px;
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
  }
  h2, h3, h4 {
    color: #343a40;
    margin-bottom: 25px;
  }
  form input[type="text"] {
    font-size: 1rem;
    padding: 10px;
  }
  .list-group-item {
    font-size: 1rem;
    border: none;
    border-bottom: 1px solid #dee2e6;
  }
  .list-group-item:last-child {
    border-bottom: none;
  }
  .btn-primary, .btn-success {
    padding: 10px 25px;
    font-size: 1rem;
    border-radius: 4px;
  }
  img {
    display: block;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 0 8px rgba(0,0,0,0.1);
  }
  .text-danger {
    font-weight: 600;
    font-size: 1.1rem;
  }
</style>
</head>
<body>
	<div class="container">
		<h2 class="mb-4">Enter Appointment ID to Pay</h2>
		<form method="get" class="mb-4" action="">
			<input type="text" name="appointmentId" class="form-control w-50 d-inline" placeholder="Enter Appointment ID"
				value="<%=inputAppointmentId != null ? inputAppointmentId : ""%>" required />
			<button type="submit" class="btn btn-primary">Fetch Details</button>
		</form>

		<%
		if (inputAppointmentId != null) {
		%>
		<%
		if (found) {
		%>
		<h3>Appointment Details</h3>
		<ul class="list-group w-50 mb-3">
			<li class="list-group-item"><b>Appointment ID:</b> <%=appointmentId%></li>
			<li class="list-group-item"><b>Patient Name:</b> <%=patientName%></li>
			<li class="list-group-item"><b>Doctor Name:</b> <%=doctorName%></li>
			<li class="list-group-item"><b>Date:</b> <%=appointmentDate%></li>
			<li class="list-group-item"><b>Time Slot:</b> <%=timeSlot%></li>
			<li class="list-group-item"><b>Amount to Pay:</b> ₹<%=amount%></li>
		</ul>

		<h4>Scan & Pay with PhonePe</h4>
		<img src="<%=request.getContextPath()%>/images/phone_pe.jpg"
			alt="PhonePe QR" width="300" height="300" class="mb-3" />

		<form action="<%=request.getContextPath()%>/markPaymentDone"
			method="post">
			<input type="hidden" name="appointmentId" value="<%=appointmentId%>" />
			<div class="mb-3">
				<label class="form-label">Transaction ID (optional):</label> <input
					type="text" name="transactionId" class="form-control w-50" />
			</div>
			<button type="submit" class="btn btn-success">I Have Paid</button>
		</form>
		<%
		} else {
		%>
		<p class="text-danger">
			Appointment ID <%=inputAppointmentId%> not found.
		</p>
		<%
		}
		%>
		<%
		}
		%>
	</div>
</body>
</html>
