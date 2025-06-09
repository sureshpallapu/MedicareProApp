<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Doctor Login - MediCarePro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f5;
            margin: 0;
            padding: 0;
            background: 
		url('<%=request.getContextPath()%>/images/bg5.jpg') no-repeat
		center center fixed;
		background-size: cover;
        }
        .login-container {
            width: 400px;
            margin: 60px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
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
        input[type="email"],
        input[type="password"] {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border 0.3s;
        }
        input:focus {
            border-color: #007bff;
            outline: none;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        input[type="submit"], input[type="button"] {
            width: 48%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        input[type="button"] {
            background-color: #dc3545;
            color: white;
        }
        input[type="button"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>MedicarePro - Doctor Login</h2>
    <form action="DoctorLoginServlet" method="post">
        <label for="email">Email :</label>
        <input type="email" name="email" id="email" required>

        <label for="password">Password :</label>
        <input type="password" name="password" id="password" required>

        <div class="button-group">
            <input type="submit" value="Login">
            <input type="button" value="Cancel" onclick="window.location.href='index.jsp'">
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
