<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Appointment Booking - MediCarePro</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 80px auto;
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #004d99;
            margin-bottom: 30px;
        }

        .info-box {
            background-color: #e7f3fe;
            color: #31708f;
            border: 1px solid #bce8f1;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 17px;
        }

        .info-box a {
            color: #004d99;
            text-decoration: none;
            font-weight: bold;
        }

        .info-box a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Appointment Booking</h2>

    <div class="info-box">
        New here? <a href="registerPatient.jsp">Register as a Patient</a>
    </div>

    <div class="info-box">
        Already registered? <a href="patientLogin.jsp">Login to Book Appointment</a>
    </div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>
