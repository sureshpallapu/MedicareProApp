<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.medicarepro.DTO.Staff, com.medicarepro.utility.DBConnector" %>

<%
    List<Staff> staffList = new ArrayList<>();
    String search = request.getParameter("search");

    try {
        Connection con = DBConnector.getConnection();
        String query = "SELECT * FROM staff";
        if (search != null && !search.trim().isEmpty()) {
            query += " WHERE name LIKE ? OR department LIKE ?";
        }

        PreparedStatement stmt = con.prepareStatement(query);
        if (search != null && !search.trim().isEmpty()) {
            stmt.setString(1, "%" + search + "%");
            stmt.setString(2, "%" + search + "%");
        }

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Staff s = new Staff();
            s.setStaffId(rs.getInt("staffId"));
            s.setName(rs.getString("name"));
            s.setPhone(rs.getString("phone"));
            s.setEmail(rs.getString("email"));
            s.setDepartment(rs.getString("department"));
            s.setQualification(rs.getString("qualification"));
            s.setExperience(rs.getString("experience"));
            s.setShift(rs.getString("shift"));
            s.setStatus(rs.getString("status"));
            staffList.add(s);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Staff</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* Base */
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding-top: 70px;
            color: #333;
        }

        /* Navbar */
        nav.navbar {
            background: #0062cc;
            color: #fff;
            position: fixed;
            top: 0; left: 0; right: 0;
            display: flex;
            align-items: center;
            padding: 15px 30px;
            z-index: 999;
        }

        .navbar-brand {
            font-size: 22px;
            font-weight: bold;
            color: #fff;
            flex: 1;
        }

        .navbar-toggle {
            display: none;
            font-size: 24px;
            background: none;
            border: none;
            color: #fff;
            cursor: pointer;
        }

        .navbar-links {
            display: flex;
            gap: 20px;
        }

        .navbar-links a {
            color: #fff;
            text-decoration: none;
            font-size: 15px;
        }

        .navbar-links a.logout-btn {
            background: #dc3545;
            padding: 6px 12px;
            border-radius: 4px;
        }

        /* Responsive Navbar */
        @media (max-width: 768px) {
            .navbar-toggle {
                display: block;
            }
            .navbar-links {
                display: none;
                flex-direction: column;
                width: 100%;
                background: #0062cc;
                margin-top: 10px;
            }
            .navbar-links.show {
                display: flex;
            }
            .navbar-links a {
                padding: 10px 20px;
                border-top: 1px solid rgba(255,255,255,0.2);
            }
        }

        /* Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 30px;
        }

        h2 {
            color: #0062cc;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .search-add {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-add input[type="text"] {
            flex: 1;
            min-width: 200px;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search-add input[type="submit"] {
            background: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-add input[type="submit"]:hover {
            background: #0056b3;
        }

        .add-btn {
            background: #28a745;
            color: #fff;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
            white-space: nowrap;
        }

        .add-btn:hover {
            background: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
            font-size: 14px;
        }

        th {
            background: #343a40;
            color: #fff;
        }

        tr:nth-child(even) {
            background: #f8f9fa;
        }

        tr:hover {
            background: #f1f1f1;
        }

        .action-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
        }

        .status-btn {
            border: none;
            padding: 5px 12px;
            border-radius: 3px;
            font-size: 13px;
            cursor: pointer;
            color: #fff;
        }

        .status-btn.toggle { background: #ffc107; }
        .status-btn.toggle:hover { background: #e0a800; }

        .status-btn.edit { background: #17a2b8; }
        .status-btn.edit:hover { background: #117a8b; }

        .status-btn.delete { background: #dc3545; }
        .status-btn.delete:hover { background: #c82333; }

        /* Responsive Table */
        @media (max-width: 768px) {
            .search-add {
                flex-direction: column;
            }
            table, thead, tbody, th, td, tr {
                display: block;
            }
            thead tr { display: none; }
            tr { margin-bottom: 15px; }
            td {
                text-align: right;
                padding-left: 50%;
                position: relative;
            }
            td::before {
                content: attr(data-label);
                position: absolute;
                left: 16px;
                font-weight: bold;
                color: #555;
            }
        }
        nav.navbar {
    background-color: #0077b6;
    padding: 10px 20px;
}

nav.navbar a {
    color: #ffffff;
    font-weight: 500;
    text-decoration: none;
    margin-right: 20px;
    transition: color 0.3s ease;
}

nav.navbar a:hover {
    color: #f0f0f0;
}

.navbar-toggler {
    border: none;
    background: none;
    color: #ffffff;
    font-size: 1.2rem;
}
        
    </style>
</head>
<body>

<nav class="navbar">
        <a class="navbar-brand" href="adminDashboard.jsp">MediCarePro HMS</a>
    <button class="navbar-toggle" onclick="toggleNavbar()">
        <i class="fas fa-bars"></i>
    </button>
    <div class="navbar-links">
        <a href="ManagePatient.jsp"><i class="fa-solid fa-user-injured"></i> Manage Patients</a>
        <a href="manageDoctors.jsp"><i class="fa-solid fa-user-doctor"></i> Manage Doctors</a>
        <a href="manageStaff.jsp"><i class="fa-solid fa-people-group"></i> Manage Staff</a>
        <a href="manageDepartments.jsp"><i class="fas fa-hospital"></i> Manage Departments</a>
        <a href="viewReports.jsp"><i class="fas fa-chart-line"></i> Reports</a>
        <a href="#"><i class="fa-solid fa-bell"></i> <span class="badge bg-danger">3</span></a>
        <a href="AdminLogoutServlet" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</nav>

<div class="container">
    <h2>Manage Staff</h2>

    <div class="search-add">
        <form method="get" action="manageStaff.jsp" style="flex: 1; display: flex;">
            <input type="text" name="search" placeholder="Search by name or department" value="<%= search != null ? search : "" %>">
            <input type="submit" value="Search">
        </form>
        <a href="AddStaff.jsp" class="add-btn">+ Add Staff</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Department</th>
                <th>Qualification</th>
                <th>Experience</th>
                <th>Shift</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% for (Staff s : staffList) { %>
            <tr>
                <td data-label="ID"><%= s.getStaffId() %></td>
                <td data-label="Name"><%= s.getName() %></td>
                <td data-label="Phone"><%= s.getPhone() %></td>
                <td data-label="Email"><%= s.getEmail() %></td>
                <td data-label="Department"><%= s.getDepartment() %></td>
                <td data-label="Qualification"><%= s.getQualification() %></td>
                <td data-label="Experience"><%= s.getExperience() %></td>
                <td data-label="Shift"><%= s.getShift() %></td>
                <td data-label="Status"><%= s.getStatus() %></td>
                <td data-label="Actions">
                    <div class="action-buttons">
                        <form action="ToggleStaffStatusServlet" method="post">
                            <input type="hidden" name="staffId" value="<%= s.getStaffId() %>">
                            <input type="hidden" name="currentStatus" value="<%= s.getStatus() %>">
                            <input type="submit" value="<%= s.getStatus().equals("Active") ? "Deactivate" : "Activate" %>" class="status-btn toggle">
                        </form>
                        <a href="EditStaff.jsp?id=<%= s.getStaffId() %>" class="status-btn edit">Edit</a>
                        <form action="DeleteStaffServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this staff member?');">
                            <input type="hidden" name="staffId" value="<%= s.getStaffId() %>">
                            <input type="submit" value="Delete" class="status-btn delete">
                        </form>
                    </div>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script>
    function toggleNavbar() {
        document.querySelector('.navbar-links').classList.toggle('show');
    }
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
