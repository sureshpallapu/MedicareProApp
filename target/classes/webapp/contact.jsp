
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us - MedicarePro</title>
    <style>
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
             width: 90%;
        padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: box-shadow 0.3s ease;
        }

        .container:hover {
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #0d47a1;
            margin-bottom: 30px;
            font-size: 28px;
            border-bottom: 2px solid #bbdefb;
            padding-bottom: 10px;
        }

        .contact-info p {
            margin: 15px 0;
            font-size: 16px;
            color: #37474f;
        }

        .info-label {
            font-weight: 600;
            color: #1e88e5;
        }

        a {
            color: #1565c0;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .container {
                padding: 25px;
                margin: 20px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%>

<div class="container">
    <h2>Contact Us</h2>

    <div class="contact-info">
        <p>
            <span class="info-label">Email:</span>
            <a href="mailto:pallapusuresh2000@gmail.com">pallapusuresh2000@gmail.com</a>
        </p>
        <p>
            <span class="info-label">Phone:</span>
            <a href="tel:+917799465956">+91 77994 65956</a>
        </p>
        <p>
            <span class="info-label">Address:</span><br>
            Site No 24, Outer Ring Rd,<br>
            Kuvempu Nagar, BTM 2nd Stage,<br>
            BTM Layout, Bengaluru, Karnataka - 5600766
        </p>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
