<%@ page import="com.medicarepro.DTO.Doctor" %>
<%
Doctor doctor = (Doctor) request.getAttribute("doctor");
if (doctor == null) {
	response.sendRedirect("ManageDoctor.jsp?error=notfound");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Doctor - MediCarePro</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #0d6efd;
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        input[type="time"],
        select {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="time"]:focus,
        select:focus {
            border-color: #0d6efd;
            outline: none;
        }

        .form-btn {
            margin-top: 25px;
            text-align: center;
        }

        button[type="submit"] {
            background-color: #0d6efd;
            color: #fff;
            padding: 12px 24px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #0b5ed7;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Doctor Details</h2>

    <form action="EditDoctorServlet" method="post">
        <input type="hidden" name="id" value="<%= doctor.getId() %>" />

        <label>Name:</label>
        <input type="text" name="name" value="<%= doctor.getName() %>" required />

        <label>Gender:</label>
        <input type="text" name="gender" value="<%= doctor.getGender() %>" required />

        <label>Department:</label>
        <input type="text" name="department" value="<%= doctor.getDepartment() %>" required />

        <label>Specialization:</label>
        <input type="text" name="specialization" value="<%= doctor.getSpecialization() %>" required />

        <label>Experience (Years):</label>
        <input type="number" name="experience" value="<%= doctor.getExperience() %>" required />

        <label>Qualification:</label>
        <input type="text" name="qualification" value="<%= doctor.getQualification() %>" required />

        <label>Diseases Diagnosed:</label>
        <input type="text" name="diseasesDiagnosed" value="<%= doctor.getDiseasesDiagnosed() %>" />

        <label>Schedule Days:</label>
        <input type="text" name="scheduleDays" value="<%= doctor.getScheduleDays() %>" />

        <label>Schedule Time From:</label>
        <input type="time" name="scheduleTimeFrom" value="<%= doctor.getScheduleTimeFrom() %>" />

        <label>Schedule Time To:</label>
        <input type="time" name="scheduleTimeTo" value="<%= doctor.getScheduleTimeTo() %>" />

        <label>Consultation Room:</label>
        <input type="text" name="consultationRoom" value="<%= doctor.getConsultationRoom() %>" />

        <label>Status:</label>
        <select name="status">
            <option value="Active" <%= doctor.getStatus().equalsIgnoreCase("Active") ? "selected" : "" %>>Active</option>
            <option value="Inactive" <%= doctor.getStatus().equalsIgnoreCase("Inactive") ? "selected" : "" %>>Inactive</option>
        </select>

        <div class="form-btn">
            <button type="submit">Update Doctor</button>
        </div>
    </form>
</div>

</body>
</html>
