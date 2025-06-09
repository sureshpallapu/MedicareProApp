<%@ page import="com.medicarepro.DTO.Patient"%>
<%@ page import="com.medicarepro.DAO.PatientDAO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>View Patient Record</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f5f8fa;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
	margin-top: 40px;
	max-width: 1000px;
	background-color: #ffffff;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

h2 {
	font-weight: 600;
	color: #0d6efd;
	border-bottom: 2px solid #dee2e6;
	padding-bottom: 10px;
}

.section-title {
	font-size: 20px;
	margin-top: 30px;
	margin-bottom: 15px;
	color: #198754;
	font-weight: 500;
	border-left: 5px solid #198754;
	padding-left: 10px;
}

.record-table td {
	padding: 12px 16px;
	vertical-align: middle;
}

.record-table tr:nth-child(even) {
	background-color: #f1f3f5;
}

.record-table td:first-child {
	font-weight: 600;
	color: #495057;
	width: 30%;
}

.alert {
	border-radius: 10px;
	padding: 15px 20px;
	font-size: 16px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<%
		String patientIdParam = request.getParameter("patientId");
		Patient patient = null;
		boolean invalidParam = false;
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		if (patientIdParam != null && !patientIdParam.trim().isEmpty()) {
			try {
				int patientId = Integer.parseInt(patientIdParam);
				patient = new PatientDAO().getPatientById(patientId);
			} catch (NumberFormatException e) {
				invalidParam = true;
			}
		}

		if (invalidParam) {
		%>
		<div class="alert alert-danger">❌ Invalid patient ID format.</div>
		<%
		} else if (patient == null) {
		%>
		<div class="alert alert-warning">⚠️ Patient record not found.</div>
		<%
		} else {
		%>
		<h2 class="text-center mb-4">
			Patient Record -
			<%=patient.getFullName()%></h2>

		<div class="section-title">Basic Information</div>
		<table class="table table-bordered record-table">
			<tr>
				<td>Full Name</td>
				<td><%=patient.getFullName()%></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><%=patient.getGender()%></td>
			</tr>
			<tr>
				<td>Age</td>
				<td><%=patient.getAge()%></td>
			</tr>
			<tr>
				<td>Date of Birth</td>
				<td><%=patient.getDob() != null ? sdf.format(patient.getDob()) : "N/A"%></td>
			</tr>
			<tr>
				<td>Marital Status</td>
				<td><%=patient.getMaritalStatus()%></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><%=patient.getPhone()%></td>
			</tr>
			<tr>
				<td>Alternate Phone</td>
				<td><%=patient.getAlternatePhone()%></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><%=patient.getEmail()%></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><%=patient.getAddress()%></td>
			</tr>
		</table>

		<div class="section-title">Emergency Contact</div>
		<table class="table table-bordered record-table">
			<tr>
				<td>Name</td>
				<td><%=patient.getEmergencyName()%></td>
			</tr>
			<tr>
				<td>Relation</td>
				<td><%=patient.getEmergencyRelation()%></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><%=patient.getEmergencyPhone()%></td>
			</tr>
		</table>

		<div class="section-title">Identification & Insurance</div>
		<table class="table table-bordered record-table">
			<tr>
				<td>Govt ID Type</td>
				<td><%=patient.getGovtIdType()%></td>
			</tr>
			<tr>
				<td>Govt ID Number</td>
				<td><%=patient.getGovtIdNumber()%></td>
			</tr>
			<tr>
				<td>Insurance Company</td>
				<td><%=patient.getInsuranceCompany()%></td>
			</tr>
			<tr>
				<td>Insurance Number</td>
				<td><%=patient.getInsuranceNumber()%></td>
			</tr>
		</table>

		<div class="section-title">Medical Details</div>
		<table class="table table-bordered record-table">
			<tr>
				<td>Blood Group</td>
				<td><%=patient.getBloodGroup()%></td>
			</tr>
			<tr>
				<td>Medical History</td>
				<td><%=patient.getHistory()%></td>
			</tr>
			<tr>
				<td>Allergies</td>
				<td><%=patient.getAllergies()%></td>
			</tr>
			<tr>
				<td>Medications</td>
				<td><%=patient.getMedications()%></td>
			</tr>
			<tr>
				<td>Habits</td>
				<td><%=patient.getHabits()%></td>
			</tr>
			<tr>
				<td>Patient Type</td>
				<td><%=patient.getPatientType()%></td>
			</tr>
		</table>

		<div class="section-title">Hospitalization Details</div>
		<table class="table table-bordered record-table">
			<tr>
				<td>Admission Date</td>
				<td><%=patient.getAdmissionDate() != null ? sdf.format(patient.getAdmissionDate()) : "N/A"%></td>
			</tr>
			<tr>
				<td>Discharge Date</td>
				<td><%=patient.getDischargeDate() != null ? sdf.format(patient.getDischargeDate()) : "N/A"%></td>
			</tr>
			<tr>
				<td>Ward</td>
				<td><%=patient.getWard()%></td>
			</tr>
			<tr>
				<td>Bed</td>
				<td><%=patient.getBed()%></td>
			</tr>
			<tr>
				<td>Doctor Assigned</td>
				<td><%=patient.getDoctor()%></td>
			</tr>
			<tr>
				<td>Reason for Admission</td>
				<td><%=patient.getReason()%></td>
			</tr>
			<tr>
				<td>Instructions</td>
				<td><%=patient.getInstructions()%></td>
			</tr>
			<tr>
				<td>Diet</td>
				<td><%=patient.getDiet()%></td>
			</tr>
		</table>
		<%
		}
		%>
	</div>
</body>
</html>
