<%@ page import="java.util.*"%>
<%@ page import="com.medicarepro.DAO.*"%>
<%@ page import="com.medicarepro.DTO.*"%>


<html>
<head>
<title>Book Appointment - Admin</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: #f2f6fa;
	padding: 20px;
	margin: 0;
}

h2 {
	color: #2c3e50;
	text-align: center;
	margin-bottom: 30px;
}

form {
	background-color: #ffffff;
	padding: 30px;
	max-width: 600px;
	margin: auto;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	font-weight: 600;
	margin-bottom: 5px;
	color: #34495e;
}

input[type="text"], input[type="date"], input[type="time"], input[type="number"],
	select {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
	transition: 0.3s ease-in-out;
}

input:focus, select:focus {
	border-color: #2980b9;
	outline: none;
	background-color: #f0f8ff;
}

#scheduleInfo {
	margin-bottom: 20px;
	background: #ecf0f1;
	padding: 15px;
	border-left: 5px solid #3498db;
	border-radius: 6px;
	font-size: 14px;
}

input[type="submit"] {
	background-color: #2980b9;
	color: white;
	padding: 12px 25px;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	width: 100%;
	transition: 0.3s ease-in-out;
}

input[type="submit"]:hover {
	background-color: #1c5980;
}

input[type="submit"]:disabled {
	background-color: #cccccc;
	cursor: not-allowed;
}

p {
	text-align: center;
	color: green;
	font-weight: bold;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<h2>Book Appointment</h2>
	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<p>
		<b><%=message%></b>
	</p>
	<%
	}
	%>
	<form method="post" action="BookAppointmentServlet">
		<label>Enter Patient Full NAME (registered patient only)</label> <input
			type="text" name="searchQuery" placeholder="Enter patient name or ID"
			required> <label>Disease:</label> <input type="text"
			name="disease" required> <label>Department:</label> <select
			name="department" id="department"
			onchange="fetchDoctorsByDepartment()" required>
			<option value="">Select Department</option>
			<option value="General Medicine">General Medicine</option>
			<option value="Cardiology">Cardiology</option>
			<option value="Neurology">Neurology</option>
			<option value="Orthopedics">Orthopedics</option>
			<option value="Pediatrics">Pediatrics</option>
		</select> <label>Doctor:</label> <select name="doctorId" id="doctorId" required>
			<option value="">Select Doctor</option>
		</select>

		<div id="scheduleInfo">
			<!-- Schedule info will appear here -->
		</div>

		<label>Appointment Date:</label> <input type="date" name="date"
			required> <label>Appointment Time:</label> <input type="time"
			name="time" required> <label>Consultation Fee:</label> <input
			type="number" name="amount" required> <input type="submit"
			id="submitBtn" value="Book Appointment" disabled>
	</form>
	<%@ include file="footer.jsp"%>

	<script>
function fetchDoctorsByDepartment() {
    const dept = document.getElementById("department").value;
    fetch("FetchDoctorsByDepartmentServlet?department=" + encodeURIComponent(dept))
        .then(res => res.json())
        .then(data => {
            let docSelect = document.getElementById("doctorId");
            docSelect.innerHTML = "<option value=''>Select Doctor</option>";
            data.forEach(doc => {
                let opt = document.createElement("option");
                opt.value = doc.id;
                opt.textContent = doc.name;
                docSelect.appendChild(opt);
            });
            document.getElementById("scheduleInfo").innerHTML = "";
            toggleSubmitButton();
        });
}

function formatTime(timeStr) {
    if (!timeStr) return 'N/A';
    const [hour, minute, second] = timeStr.split(':');
    let h = parseInt(hour, 10);
    const ampm = h >= 12 ? 'PM' : 'AM';
    h = h % 12 || 12;
    return `${h}:${minute} ${ampm}`;
}

document.addEventListener("DOMContentLoaded", function () {
    const doctorSelect = document.getElementById("doctorId");
    const scheduleDiv = document.getElementById("scheduleInfo");
    const departmentSelect = document.getElementById("department");
    const submitBtn = document.getElementById("submitBtn");

    function toggleSubmitButton() {
        if (departmentSelect.value && doctorSelect.value) {
            submitBtn.disabled = false;
        } else {
            submitBtn.disabled = true;
        }
    }

    doctorSelect.addEventListener("change", function () {
        const doctorId = this.value;
        if (doctorId) {
            fetch("FetchDoctorScheduleServlet?doctorId=" + encodeURIComponent(doctorId))
                .then(res => res.json())
                .then(data => {
                    scheduleDiv.innerHTML = `
                        <b>Schedule Days:</b> ${data.scheduleDays || 'N/A'}<br>
                        <b>Schedule Time:</b> ${formatTime(data.scheduleFrom)} - ${formatTime(data.scheduleTo)}<br>
                        <b>Consultation Room:</b> ${data.consultationRoom || 'N/A'}
                    `;
                    toggleSubmitButton();
                });
        } else {
            scheduleDiv.innerHTML = "";
            toggleSubmitButton();
        }
    });

    departmentSelect.addEventListener("change", toggleSubmitButton);
    toggleSubmitButton();
});
</script>

</body>
</html>
