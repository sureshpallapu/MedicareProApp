<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.Cookie" %>

<%
    String savedEmail = "";
    boolean rememberMeChecked = false;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("staffEmail".equals(c.getName())) {
                savedEmail = c.getValue();
                rememberMeChecked = true;
                break;
            }
        }
    }

    String inputEmail = request.getParameter("email") != null ? request.getParameter("email") : savedEmail;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Staff Login - MediCarePro</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #eaf6ff, #ffffff);
             background: 
		url('<%=request.getContextPath()%>/images/bg6.jpg') no-repeat
		center center fixed;
		background-size: cover;
        }

        .login-container {
            width: 400px;
            margin: 80px auto;
            background-color: #ffffff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #0e4a7b;
        }

        label {
            font-weight: 600;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px 40px 12px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            box-sizing: border-box;
        }

        .eye-icon {
            position: absolute;
            top: 38px;
            right: 12px;
            cursor: pointer;
            font-size: 16px;
            color: #666;
        }

        .remember-me {
            font-size: 14px;
            color: #555;
        }

        .error {
            color: #d8000c;
            background-color: #ffd2d2;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            text-align: center;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #0e4a7b;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #09375d;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Staff Login</h2>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="StaffLoginServlet" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input 
                type="email" 
                id="email" 
                name="email" 
                value="<%= inputEmail %>" 
                placeholder="Enter your email" 
                required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input 
                type="password" 
                id="password" 
                name="password" 
                placeholder="Enter your password" 
                required>
            <span class="eye-icon" onclick="togglePassword()">👁️</span>
        </div>

        <div class="form-group remember-me">
            <input 
                type="checkbox" 
                id="remember" 
                name="remember"
                <%= rememberMeChecked ? "checked" : "" %> >
            <label for="remember">Keep me logged in</label>
        </div>

        <input type="submit" value="Login">
    </form>
</div>

<script>
    function togglePassword() {
        const passwordInput = document.getElementById("password");
        passwordInput.type = passwordInput.type === "password" ? "text" : "password";
    }
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
