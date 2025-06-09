<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Login - MediCarePro</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #ecf4fb;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .login-box h2 {
            text-align: center;
            color: #2f80ed;
            margin-bottom: 30px;
        }

        label {
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
            color: #333;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #2f80ed;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2563c4;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .register-link a {
            color: #2f80ed;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="login-box">
            <h2>Patient Login</h2>
            <form action="PatientLoginServlet" method="post">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>

                <label for="phone">Phone (as Password)</label>
                <input type="password" id="phone" name="phone" placeholder="Enter your phone number" required>

                <button type="submit">Login</button>
            </form>

            <div class="register-link">
                Not registered yet? <a href="registerPatient.jsp">Please register</a>.
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
