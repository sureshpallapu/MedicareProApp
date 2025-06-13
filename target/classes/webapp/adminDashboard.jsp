<%@ page session="true"%>
<%@ page import="com.medicarepro.DTO.AdminDTO"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    AdminDTO adminUser = (AdminDTO) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect("adminlogin.jsp?error=Please login first");
        return;
    }

    String adminName = (adminUser != null && adminUser.getUsername() != null) ? adminUser.getUsername() : "Admin";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - MediCarePro HMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 70px;
            background: linear-gradient(rgba(255, 255, 255, 0.85), rgba(255, 255, 255, 0.85)),
                        url('images/background-medical.jpg') no-repeat center center fixed;
            background-size: cover;
            background-color: #f4f6f9;
            color: #333;
        }

        .header {
            margin: 0 auto 30px;
            max-width: 1200px;
            padding: 0 15px;
            height: 60px;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 30px;
            color: #0d6efd;
            font-weight: 700;
        }

        .logout-btn {
            background: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .content {
            max-width: 1200px;
            margin: auto;
            padding: 40px 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
        }

        .content h2 {
            font-size: 32px;
            font-weight: 800;
            background: linear-gradient(90deg, #0d6efd, #6610f2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
        }

        .content p {
            font-size: 18px;
            color: #6c757d;
            margin-bottom: 30px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        .card {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
            padding: 30px 25px;
            transition: all 0.4s ease-in-out;
            display: flex;
            min-height: 220px;
            flex-direction: column;
            justify-content: center;
            cursor: pointer;
            border-left: 5px solid #0d6efd;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 40px rgba(13, 110, 253, 0.25), 0 0 15px rgba(255, 193, 7, 0.2);
            border-left-color: #ffc107;
        }

        .card h3 {
            font-size: 22px;
            font-weight: 700;
            color: #0d6efd;
            margin-bottom: 15px;
        }

        .card p {
            font-size: 15px;
            color: #6c757d;
            flex-grow: 1;
        }

        .alert {
            max-width: 600px;
            margin: 20px auto;
        }

        .dark-mode {
            background: #1e1e2f;
            color: #f1f1f1;
        }

        .dark-mode .card {
            background: #2a2a3d;
            border-left-color: #ffc107;
            color: #f1f1f1;
        }

        #themeToggle {
            position: fixed;
            top: 80px;
            right: 15px;
            z-index: 999;
        }

        #sessionTimer {
            z-index: 1050;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MediCarePro HMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="ManagePatient.jsp"><i class="fa-solid fa-user-injured"></i> Manage Patients</a></li>
                <li class="nav-item"><a class="nav-link" href="manageDoctors.jsp"><i class="fa-solid fa-user-doctor"></i> Manage Doctors</a></li>
                <li class="nav-item"><a class="nav-link" href="manageStaff.jsp"><i class="fa-solid fa-people-group"></i> Manage Staff</a></li>
                <li class="nav-item"><a class="nav-link" href="manageDepartments.jsp"><i class="fas fa-hospital"></i> Manage Departments</a></li>
                <li class="nav-item"><a class="nav-link" href="viewReports.jsp"><i class="fas fa-chart-line"></i> View Reports</a></li>
                <li class="nav-item position-relative">
                    <a class="nav-link" href="#"><i class="fa-solid fa-bell"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
                    </a>
                </li>
            </ul>
            <a href="AdminLogoutServlet" class="btn logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
</nav>

<!-- Header -->
<div class="header">
    <h1>MediCarePro HMS - Admin Dashboard</h1>
</div>

<!-- Search -->
<div class="container mb-4">
    <input type="text" id="dashboardSearch" class="form-control" placeholder="Search dashboard...">
</div>

<!-- Main Content -->
<div class="content">
    <h2>Welcome, <%=adminName%>!</h2>
    <p>Quick access panels to manage hospital operations efficiently.</p>

    <div class="dashboard-grid">
        <div class="card" onclick="location.href='ManagePatient.jsp'">
            <h3>Manage Patients</h3>
            <p>Register patients, book appointments, and view records.</p>
        </div>
        <div class="card" onclick="location.href='manageDoctors.jsp'">
            <h3>Manage Doctors</h3>
            <p>Add, edit, delete doctor profiles & schedules.</p>
        </div>
        <div class="card" onclick="location.href='manageStaff.jsp'">
            <h3>Manage Staff</h3>
            <p>Assign roles, manage shifts, and update staff info.</p>
        </div>
        <div class="card" onclick="location.href='manageDepartments.jsp'">
            <h3>Manage Departments</h3>
            <p>Update departments, units, and services.</p>
        </div>
        <div class="card" onclick="location.href='viewReports.jsp'">
            <h3>View Reports</h3>
            <p>Analyze appointments, billing & medical stats.</p>
        </div>
    </div>
</div>

<% String bookingMessage = (String) session.getAttribute("bookingMessage");
   if (bookingMessage != null) { %>
<div class="alert alert-success text-center"><%=bookingMessage%></div>
<% session.removeAttribute("bookingMessage"); } %>

<!-- Welcome Toast -->
<div id="welcomeToast" class="toast align-items-center text-bg-primary border-0 position-fixed bottom-0 end-0 m-3" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
        <div class="toast-body">Welcome back, <%=adminName%>!</div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
    </div>
</div>

<!-- Inactivity Timer -->
<div class="position-fixed bottom-0 start-0 p-3 bg-warning text-dark rounded shadow" id="sessionTimer" style="display:none;">
    Auto logout in <span id="countdown">60</span> sec due to inactivity.
</div>

<!-- Dark Mode Toggle -->
<button class="btn btn-outline-light" id="themeToggle"><i class="fas fa-moon"></i></button>

<!-- Footer -->
<%@ include file="footer.jsp"%>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    let timeoutWarning, autoLogout, countdownInterval;

    function startCountdown() {
        let timeLeft = 60;
        const timerDiv = document.getElementById('sessionTimer');
        timerDiv.style.display = 'block';
        document.getElementById('countdown').textContent = timeLeft;

        countdownInterval = setInterval(() => {
            timeLeft--;
            document.getElementById('countdown').textContent = timeLeft;
            if (timeLeft <= 0) clearInterval(countdownInterval);
        }, 1000);
    }

    function resetTimers() {
        clearTimeout(timeoutWarning);
        clearTimeout(autoLogout);
        clearInterval(countdownInterval);
        document.getElementById('sessionTimer').style.display = 'none';

        timeoutWarning = setTimeout(startCountdown, 2 * 60 * 1000);
        autoLogout = setTimeout(() => {
            window.location.href = 'AdminLogoutServlet';
        }, 3 * 60 * 1000);
    }

    document.addEventListener("DOMContentLoaded", function () {
        const toastEl = document.getElementById('welcomeToast');
        if (toastEl) {
            const toast = new bootstrap.Toast(toastEl);
            toast.show();
        }

        document.getElementById('themeToggle').addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
        });

        document.getElementById('dashboardSearch').addEventListener('input', function () {
            const query = this.value.toLowerCase();
            document.querySelectorAll('.dashboard-grid .card').forEach(card => {
                card.style.display = card.textContent.toLowerCase().includes(query) ? 'block' : 'none';
            });
        });

        document.addEventListener('mousemove', resetTimers);
        document.addEventListener('keypress', resetTimers);

        resetTimers(); // Initialize timers
    });
</script>
</body>
</html>
