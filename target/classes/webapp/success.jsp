<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Patient Registration Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f7ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            text-align: center;
            max-width: 400px;
        }
        h1 {
            color: #28a745;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            color: #333333;
            margin-bottom: 30px;
        }
        a {
            text-decoration: none;
            color: #ffffff;
            background-color: #007bff;
            padding: 12px 25px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registration Successful!</h1>
        <p>The patient has been registered successfully.</p>
        <a href="adminreceptionPatientRegister.jsp">Register Another Patient</a>
    </div>
</body>
</html>
