<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Pharmacy Login - MediCarePro</title>
<style>
    /* Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    /* Header */
    header {
        background: rgba(255, 255, 255, 0.15);
        padding: 1rem 2rem;
        color: #fff;
        display: flex;
        justify-content: space-between;
        align-items: center;
        backdrop-filter: blur(10px);
        font-weight: 600;
    }
    header .logo {
        font-size: 1.5rem;
        letter-spacing: 2px;
    }
    header .contact {
        font-size: 0.9rem;
        text-align: right;
        line-height: 1.4;
    }
    header .contact div {
        margin-bottom: 0.2rem;
    }

    /* Main login container */
    main {
        flex-grow: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 1rem;
    }

    .login-box {
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 12px 28px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 400px;
        padding: 2.5rem 2rem;
        text-align: center;
    }
    .login-box h1 {
        margin-bottom: 1.8rem;
        color: #1a237e;
        font-weight: 700;
        font-size: 2rem;
    }
    form {
        display: flex;
        flex-direction: column;
        gap: 1.3rem;
    }
    label {
        font-weight: 600;
        font-size: 1rem;
        color: #1a237e;
        text-align: left;
        margin-bottom: 0.3rem;
    }
    input[type="email"],
    input[type="password"] {
        padding: 0.95rem 1rem;
        font-size: 1rem;
        border: 2px solid #90caf9;
        border-radius: 10px;
        transition: border-color 0.3s ease;
        width: 100%;
        font-family: inherit;
    }
    input[type="email"]:focus,
    input[type="password"]:focus {
        border-color: #2962ff;
        outline: none;
        box-shadow: 0 0 6px #2962ffaa;
    }
    button {
        margin-top: 1rem;
        background: #2962ff;
        color: white;
        font-weight: 700;
        font-size: 1.15rem;
        padding: 1rem;
        border: none;
        border-radius: 12px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #0039cb;
    }
    .note {
        margin-top: 1rem;
        font-size: 0.9rem;
        color: #444;
        opacity: 0.8;
    }

    /* Footer */
    footer {
        background: rgba(255, 255, 255, 0.15);
        color: #fff;
        text-align: center;
        padding: 1rem 2rem;
        font-size: 0.9rem;
        backdrop-filter: blur(10px);
    }

    /* Responsive */
    @media (max-width: 480px) {
        .login-box {
            padding: 2rem 1.5rem;
            max-width: 100%;
            border-radius: 12px;
        }
        header {
            flex-direction: column;
            gap: 0.3rem;
            font-size: 0.9rem;
            text-align: center;
        }
        header .contact {
            text-align: center;
        }
    }
</style>
</head>
<body>

<header>
    <div class="logo">MediCarePro - Pharmacy</div>
    <div class="contact">
        <div>Email: pharmacy@medicarepro.com</div>
        <div>Phone: +91 98765 43210</div>
    </div>
</header>

<main>
    <div class="login-box">
        <h1>Pharmacy Login</h1>
        <form method="post" action="PharmacyLoginServlet" novalidate>
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="your.email@example.com" required />

            <label for="phone">Phone Number (Password)</label>
            <input type="password" id="phone" name="phone" placeholder="Enter your phone number" required />

            <button type="submit">Login</button>
        </form>
        <div class="note">Use your registered email and phone number to login.</div>
    </div>
</main>

<footer>
    &copy; 2025 MediCarePro. All rights reserved.
</footer>

</body>
</html>
