<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Doctor</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f7;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 500px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            color: #555555;
            font-weight: 500;
        }
        input[type="text"],
        input[type="email"],
        input[type="time"],
        input[type="number"],
        select {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: 0.3s ease;
        }
        input:focus, select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0,123,255,0.3);
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 12px;
            background: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add New Doctor</h2>
    <form action="AddDoctorServlet" method="post">
        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Phone:</label>
        <input type="text" name="phone" required>

        <label>Gender:</label>
        <select name="gender" required>
            <option value="">Select Gender</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
        </select>

        <label>Department:</label>
        <input type="text" name="department" required>

        <label>Specialization:</label>
        <input type="text" name="specialization" required>

        <label>Experience (Years):</label>
        <input type="number" name="experience" min="0" required>

        <label>Qualification:</label>
        <input type="text" name="qualification" required>

        <label>Diseases Diagnosed:</label>
        <input type="text" name="diseasesDiagnosed" required>

        <label>Schedule Days:</label>
        <input type="text" name="scheduleDays" placeholder="e.g., Mon-Fri" required>

        <label>Schedule Time From:</label>
        <input type="time" name="scheduleTimeFrom" required>

        <label>Schedule Time To:</label>
        <input type="time" name="scheduleTimeTo" required>

        <label>Consultation Room No.:</label>
        <input type="text" name="consultationRoom" required>

        <label>Status:</label>
        <select name="status" required>
            <option value="">Select Status</option>
            <option>Active</option>
            <option>Inactive</option>
        </select>

        <input type="submit" value="Add Doctor">
    </form>
    <a href="manageDoctors.jsp" class="back-link">← Back to Doctors List</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
