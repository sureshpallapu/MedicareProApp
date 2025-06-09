<%@ page import="java.util.List"%>
<%@ page import="com.medicarepro.DTO.EmergencyPatient"%>
<%@ page import="com.medicarepro.DAO.EmergencyPatientDAO"%>
<%@ page import="com.medicarepro.DAO.DepartmentDAO"%>
<%@ page import="com.medicarepro.DTO.Department"%>
<%@ include file="patientHeader.jsp"%>
<%
List<Department> departments = DepartmentDAO.getAllDepartments();
%>



<%
// Handle form submission
if ("POST".equalsIgnoreCase(request.getMethod())) {
	try {
		String name = request.getParameter("name");
		String ageStr = request.getParameter("age");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String condition = request.getParameter("condition");
		String priorityStr = request.getParameter("priority");
		String departmentIdStr = request.getParameter("department");
		String doctorIdStr = request.getParameter("doctor");

		int age = (ageStr != null && !ageStr.isEmpty()) ? Integer.parseInt(ageStr) : 0;
		int priority = (priorityStr != null && !priorityStr.isEmpty()) ? Integer.parseInt(priorityStr) : 5;
		int departmentId = (departmentIdStr != null && !departmentIdStr.isEmpty())
		? Integer.parseInt(departmentIdStr)
		: 0;
		int doctorId = (doctorIdStr != null && !doctorIdStr.isEmpty()) ? Integer.parseInt(doctorIdStr) : 0;

		EmergencyPatient ep = new EmergencyPatient();
		ep.setName(name);
		ep.setAge(age);
		ep.setGender(gender);
		ep.setPhone(phone);
		ep.setCondition(condition);
		ep.setPriority(priority);
		ep.setDepartmentId(departmentId); // Assuming you have these setters in DTO
		ep.setDoctorId(doctorId);

		EmergencyPatientDAO.addEmergencyPatient(ep);

		// Redirect after successful post to prevent resubmission on refresh
		response.sendRedirect("emergencyPatient.jsp");
		return;
	} catch (Exception e) {
		// Log and optionally show error message
		e.printStackTrace();
		// You can add an error message display here
	}
}

// Fetch emergency patients sorted by priority (lower number = higher priority)
List<EmergencyPatient> emergencyPatients = EmergencyPatientDAO.getAllOrderedByPriority();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Emergency Cases - Register & Prioritize</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	max-width: 900px;
	margin: 30px auto;
	background: #fff9f9;
	color: #2d2d2d;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(255, 0, 0, 0.15);
}

h1 {
	color: #d63031;
	text-align: center;
	margin-bottom: 25px;
	font-weight: 800;
}

form {
	background: #ffe6e6;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(214, 48, 49, 0.2);
	margin-bottom: 30px;
}

form label {
	display: block;
	font-weight: 700;
	margin-bottom: 6px;
	color: #b23a3a;
}

form input[type="text"], form input[type="number"], form select, form textarea
	{
	width: 100%;
	padding: 10px;
	border: 1.5px solid #d65757;
	border-radius: 6px;
	margin-bottom: 15px;
	font-size: 1rem;
	font-family: inherit;
	box-sizing: border-box;
	outline-offset: 2px;
	transition: border-color 0.3s ease;
}

form input[type="text"]:focus, form input[type="number"]:focus, form select:focus,
	form textarea:focus {
	border-color: #e74c3c;
	box-shadow: 0 0 6px rgba(231, 76, 60, 0.5);
}

form button {
	background-color: #d63031;
	color: white;
	border: none;
	padding: 12px 25px;
	border-radius: 7px;
	font-weight: 700;
	cursor: pointer;
	font-size: 1.1rem;
	transition: background-color 0.3s ease;
}

form button:hover {
	background-color: #b8322a;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	box-shadow: 0 2px 8px rgba(214, 48, 49, 0.15);
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	padding: 14px 18px;
	text-align: left;
	border-bottom: 1px solid #f5b5b5;
}

th {
	background-color: #d63031;
	color: white;
	font-weight: 700;
}

tr:nth-child(even) {
	background-color: #ffe3e3;
}

tr:hover {
	background-color: #fcdcdc;
}
</style>
</head>
<body>

	<h1>Emergency Cases - Register & Prioritize</h1>

	<form method="post" action="emergencyPatient.jsp" id="emergencyForm">
		<label for="name">Full Name *</label> <input type="text" id="name"
			name="name" required> <label for="age">Age *</label> <input
			type="number" id="age" name="age" min="0" max="120" required>

		<label for="gender">Gender *</label> <select id="gender" name="gender"
			required>
			<option value="" disabled selected>--Select Gender--</option>
			<option value="Male">Male</option>
			<option value="Female">Female</option>
			<option value="Other">Other</option>
		</select> <label for="phone">Phone Number *</label> <input type="text"
			id="phone" name="phone" pattern="\d{10}"
			title="Enter 10 digit phone number" required> <label
			for="condition">Critical Condition Description *</label>
		<textarea id="condition" name="condition" rows="3" required></textarea>

		<label for="priority">Priority (1 = Highest, 5 = Lowest) *</label> <select
			id="priority" name="priority" required>
			<option value="" disabled selected>--Select Priority--</option>
			<option value="1">1 - Immediate</option>
			<option value="2">2 - Very High</option>
			<option value="3">3 - High</option>
			<option value="4">4 - Medium</option>
			<option value="5">5 - Low</option>
		</select> <label for="department">Department *</label> <select id="department"
			name="department" required>
			<option value="" disabled selected>--Select Department--</option>
			<%
			for (Department dept : departments) {
			%>
			<option value="<%=dept.getId()%>"><%=dept.getName()%></option>
			<%
			}
			%>
		</select> <label for="doctor">Doctor *</label> <select id="doctor"
			name="doctor" required>
			<option value="" disabled selected>--Select Doctor--</option>
			<!-- Options will be dynamically populated based on selected department -->
		</select>

		<button type="submit">Add Emergency Case</button>
	</form>

	<h2>Emergency Patients List (Sorted by Priority)</h2>

	<%
	if (emergencyPatients != null && !emergencyPatients.isEmpty()) {
	%>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Full Name</th>
				<th>Age</th>
				<th>Gender</th>
				<th>Phone</th>
				<th>Condition</th>
				<th>Priority</th>
				<th>Department</th>
				<th>Doctor</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (EmergencyPatient ep : emergencyPatients) {
			%>
			<tr>
				<td><%=ep.getId()%></td>
				<td><%=ep.getName()%></td>
				<td><%=ep.getAge()%></td>
				<td><%=ep.getGender()%></td>
				<td><%=ep.getPhone()%></td>
				<td><%=ep.getCondition()%></td>
				<td><%=ep.getPriority()%></td>
				<td><%=ep.getDepartmentName() != null ? ep.getDepartmentName() : "N/A"%></td>
				<td><%=ep.getDoctorName() != null ? ep.getDoctorName() : "N/A"%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else {
	%>
	<p
		style="text-align: center; font-style: italic; margin-top: 20px; color: #c0392b;">No
		emergency cases registered yet.</p>
	<%
	}
	%>

	<script>

function fetchDoctorsByDepartment() {
    const dept = document.getElementById("department").value;
    const docSelect = document.getElementById("doctor");

    docSelect.innerHTML = "<option disabled>Loading...</option>";

    fetch("FetchDoctorsByDepartmentServlet?department=" + encodeURIComponent(dept))
        .then(res => res.json())
        .then(data => {
            docSelect.innerHTML = "<option value='' disabled selected>--Select Doctor--</option>";
            data.forEach(doc => {
                let opt = document.createElement("option");
                opt.value = doc.id;
                opt.textContent = doc.name;
                docSelect.appendChild(opt);
            });
            toggleSubmitButton();
        });
}



function toggleSubmitButton() {
    const submitBtn = document.getElementById("submitBtn");
    const doctor = document.getElementById("doctor").value;
    const department = document.getElementById("department").value;
    submitBtn.disabled = !(doctor && department);
}

document.addEventListener("DOMContentLoaded", function () {
    const departmentSelect = document.getElementById("department");
    const doctorSelect = document.getElementById("doctor");

    departmentSelect.addEventListener("change", fetchDoctorsByDepartment);
    doctorSelect.addEventListener("change", toggleSubmitButton);
});
</script>
	<%@ include file="footer.jsp"%>

</body>
</html>
