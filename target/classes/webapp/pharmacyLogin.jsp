<%@ page session="true" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Pharmacy Login - MediCarePro</title>
<style>
    * {
        box-sizing: border-box;
    }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #e3f2fd;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }
    .login-container {
        background: #fff;
        padding: 2.5rem 2rem;
        border-radius: 12px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
        width: 100%;
        max-width: 400px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    h2 {
        color: #0d47a1;
        margin-bottom: 1.5rem;
        font-weight: 700;
        font-size: 1.8rem;
        text-align: center;
    }
    form {
        width: 100%;
        display: flex;
        flex-direction: column;
    }
    label {
        font-weight: 600;
        color: #0d47a1;
        margin-bottom: 0.4rem;
        font-size: 1rem;
    }
    input[type="email"],
    input[type="password"] {
        padding: 0.85rem 1rem;
        font-size: 1rem;
        border: 2px solid #90caf9;
        border-radius: 8px;
        margin-bottom: 1.3rem;
        transition: border-color 0.3s ease;
        width: 100%;
    }
    input[type="email"]:focus,
    input[type="password"]:focus {
        border-color: #1976d2;
        outline: none;
    }
    button {
        padding: 1rem;
        font-size: 1.1rem;
        font-weight: 700;
        background-color: #0d47a1;
        color: white;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        width: 100%;
    }
    button:hover {
        background-color: #1565c0;
    }
    .note {
        margin-top: 1rem;
        font-size: 0.875rem;
        color: #555;
        text-align: center;
    }

    /* Responsive adjustments */
    @media (max-width: 480px) {
        .login-container {
            padding: 2rem 1.5rem;
            max-width: 100%;
        }
        h2 {
            font-size: 1.5rem;
        }
        button {
            font-size: 1rem;
            padding: 0.85rem;
        }
    }
</style>
</head>
<body>

<div class="login-container">
    <h2>Pharmacy Login</h2>
    <form method="post" action="PharmacyLoginServlet" novalidate>
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" placeholder="your.email@example.com" required />

        <label for="phone">Phone Number (Password)</label>
        <input type="password" id="phone" name="phone" placeholder="Enter your phone number" required />

        <button type="submit">Login</button>
    </form>
    <div class="note">Use your registered email and phone number to login.</div>
</div>

</body>
</html>

<%@ include file="footer.jsp" %>
