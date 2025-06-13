<%@ page import="java.util.*, com.medicarepro.DTO.Doctor" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Doctors - MediCarePro HMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f4f6f9;
            color: #333;
            padding: 0;
        }

        .content-wrapper {
            margin-top: 80px; /* adjust for navbar height */
            padding: 20px;
        }

        /* Header Section */
        .header-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .header-section h2 {
            margin: 0;
            font-size: 28px;
            color: #0d6efd;
        }

        /* Buttons */
        .btn-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .add-btn {
            padding: 10px 18px;
            background: #0d6efd;
            color: #fff;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .add-btn:hover {
            background: #0b5ed7;
        }

        .export-btn.excel {
            background: #28a745;
        }

        .export-btn.pdf {
            background: #dc3545;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 12px 14px;
            text-align: left;
        }

        th {
            background: #0d6efd;
            color: #fff;
        }

        tr:nth-child(even) {
            background: #f8f9fa;
        }

        tr:hover {
            background: #eef2f7;
        }

        /* Action Buttons */
        .action-btn {
            display: inline-block;
            padding: 6px 12px;
            margin: 2px;
            border: none;
            border-radius: 6px;
            color: #fff;
            font-size: 14px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .edit-btn {
            background: #28a745;
        }

        .edit-btn:hover {
            background: #218838;
        }

        .delete-btn {
            background: #dc3545;
        }

        .delete-btn:hover {
            background: #c82333;
        }

        /* Status Button */
        .status-btn {
            padding: 6px 10px;
            border: none;
            border-radius: 6px;
            color: #fff;
            font-weight: 500;
            cursor: pointer;
        }

        /* No Data Row */
        .no-data {
            text-align: center;
            padding: 20px;
            font-size: 16px;
            color: #777;
        }

        @media screen and (max-width: 768px) {
            th, td {
                font-size: 14px;
                padding: 10px;
            }

            .header-section h2 {
                font-size: 22px;
            }

            .add-btn {
                font-size: 14px;
                padding: 8px 12px;
            }
        }
    </style>
</head>

<body>

<!-- Admin Navigation Bar (Fixed Top) -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="adminDashboard.jsp">MediCarePro HMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="ManagePatient.jsp"><i class="fa-solid fa-user-injured"></i> Manage Patients</a></li>
                <li class="nav-item"><a class="nav-link active" href="manageDoctors.jsp"><i class="fa-solid fa-user-doctor"></i> Manage Doctors</a></li>
                <li class="nav-item"><a class="nav-link" href="manageStaff.jsp"><i class="fa-solid fa-people-group"></i> Manage Staff</a></li>
                <li class="nav-item"><a class="nav-link" href="manageDepartments.jsp"><i class="fas fa-hospital"></i> Manage Departments</a></li>
                <li class="nav-item"><a class="nav-link" href="viewReports.jsp"><i class="fas fa-chart-line"></i> View Reports</a></li>
                <li class="nav-item position-relative">
                    <a class="nav-link" href="#"><i class="fa-solid fa-bell"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
                    </a>
                </li>
            </ul>
            <a href="AdminLogoutServlet" class="btn btn-outline-light"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="content-wrapper">
    <div class="header-section">
        <h2><i class="fas fa-user-md"></i> Doctor Management</h2>
        <div class="btn-group">
            <form action="ExportDoctorsServlet" method="get">
                <input type="hidden" name="format" value="excel">
                <button type="submit" class="add-btn export-btn excel"><i class="fas fa-file-excel"></i> Export Excel</button>
            </form>
            <form action="ExportDoctorsServlet" method="get">
                <input type="hidden" name="format" value="pdf">
                <button type="submit" class="add-btn export-btn pdf"><i class="fas fa-file-pdf"></i> Export PDF</button>
            </form>
            <a href="AllDoctorsServlet" class="add-btn export-btn"><i class="fas fa-users"></i> All Doctors</a>
            <a href="AddDoctor.jsp" class="add-btn"><i class="fas fa-user-plus"></i> Add Doctor</a>
        </div>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Specialization</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Department</th>
            <th>Qualification</th>
            <th>Experience</th>
            <th>Diseases Diagnosed</th>
            <th>Room No.</th>
            <th>Schedule</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
        List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
        if (doctors != null && !doctors.isEmpty()) {
            for (Doctor doctor : doctors) {
        %>
        <tr>
            <td><%= doctor.getId() %></td>
            <td><%= doctor.getName() %></td>
            <td><%= doctor.getSpecialization() %></td>
            <td><%= doctor.getPhone() %></td>
            <td><%= doctor.getEmail() %></td>
            <td><%= doctor.getDepartment() %></td>
            <td><%= doctor.getQualification() %></td>
            <td><%= doctor.getExperience() %> yrs</td>
            <td><%= doctor.getDiseasesDiagnosed() %></td>
            <td><%= doctor.getConsultationRoom() %></td>
            <td>
                <%= doctor.getScheduleDays() %><br>
                <%= doctor.getScheduleTimeFrom() %> - <%= doctor.getScheduleTimeTo() %>
            </td>
            <td>
                <form action="ToggleDoctorStatusServlet" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= doctor.getId() %>">
                    <button type="submit" class="status-btn"
                            style="background-color:<%= doctor.getStatus().equalsIgnoreCase("Active") ? "#28a745" : "#dc3545" %>;">
                        <%= doctor.getStatus() %>
                    </button>
                </form>
            </td>
            <td>
                <a href="EditDoctorServlet?id=<%= doctor.getId() %>" class="action-btn edit-btn">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a href="DeleteDoctorServlet?id=<%= doctor.getId() %>" class="action-btn delete-btn"
                   onclick="return confirm('Are you sure you want to delete this doctor?');">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </td>
        </tr>
        <% }
        } else { %>
        <tr>
            <td colspan="13" class="no-data">No Doctors Found.</td>
        </tr>
        <% } %>
    </table>
</div>

<!-- Bootstrap JS (optional, for navbar toggler) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="footer.jsp" %>

</body>
</html>
