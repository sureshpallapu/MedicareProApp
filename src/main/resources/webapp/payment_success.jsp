<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Success</title>
    <style>
        /* Reset and base */
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }
        .container {
            background: white;
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(102, 118, 255, 0.3);
            max-width: 480px;
            text-align: center;
            animation: fadeIn 0.8s ease forwards;
        }
        h2 {
            color: #4a47a3;
            font-size: 2.5rem;
            margin-bottom: 20px;
            font-weight: 700;
        }
        p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }
        b {
            color: #6a67ce;
        }
        a {
            text-decoration: none;
            display: inline-block;
            padding: 12px 28px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1rem;
            transition: background 0.3s ease;
        }
        a:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
        }

        /* FadeIn animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Payment Successful!</h2>
        <p>Your payment for Appointment ID: <b><%= request.getParameter("appointmentId") %></b> has been recorded.</p>
        <a href="appointments.jsp">Back to Appointments</a>
    </div>
</body>
</html>
