<%@ page
	import="java.sql.*, java.util.*, com.medicarepro.DAO.DepartmentDAO, com.medicarepro.DTO.Department, com.medicarepro.utility.DBConnector"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Manage Departments - MediCarePro HMS</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap"
	rel="stylesheet">
<!-- Font Awesome for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<style>
body {
	font-family: 'Inter', sans-serif;
	background: linear-gradient(to right, #f0f8ff, #e6f7ff);
	margin: 0;
	padding: 100px 30px 20px;
	/* 👈 Added top padding to make room for navbar */
	color: #333;
}

h2, h3 {
	color: #006494;
	margin-bottom: 20px;
}

.navbar {
	position: fixed; /* Make it fixed */
	top: 0; /* Stick to top */
	left: 0;
	width: 100%; /* Full width */
	background-color: #0077b6;
	padding: 15px 20px;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	z-index: 1000; /* Stay on top of other elements */
}

.navbar-brand {
	font-size: 22px;
	font-weight: bold;
}

.navbar-toggle {
	display: none;
	background: none;
	border: none;
	font-size: 24px;
	color: white;
	cursor: pointer;
}

.navbar-links {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

.navbar-links a {
	color: white;
	text-decoration: none;
	font-weight: 500;
}

.navbar-links a:hover {
	text-decoration: underline;
}

.logout-btn {
	background-color: #d90429;
	padding: 8px 16px;
	border-radius: 6px;
	font-weight: 600;
}

.logout-btn:hover {
	background-color: #a1031e;
}

@media ( max-width : 768px) {
	.navbar-toggle {
		display: block;
	}
	.navbar-links {
		display: none;
		width: 100%;
		flex-direction: column;
		margin-top: 10px;
	}
	.navbar-links.show {
		display: flex;
	}
	.navbar-links a {
		padding: 10px 0;
	}
}

.form-section, .table-section {
	background: #ffffff;
	padding: 25px;
	border-radius: 16px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
	margin-bottom: 35px;
}

.search-add-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 10px;
	flex-wrap: wrap;
	margin-bottom: 25px;
}

#searchInput {
	flex: 1;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
	box-sizing: border-box;
}

.add-btn {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #0077b6;
	color: white;
	border: none;
	padding: 12px 18px;
	font-size: 14px;
	border-radius: 8px;
	text-decoration: none;
	font-weight: 600;
	transition: all 0.3s ease;
}

.add-btn i {
	margin-right: 8px;
}

.add-btn:hover {
	background-color: #005f8a;
	transform: scale(1.05);
}

@media ( max-width : 600px) {
	.add-btn {
		padding: 12px;
		width: 44px;
		height: 44px;
		font-size: 0;
		border-radius: 50%;
	}
	.add-btn i {
		margin-right: 0;
		font-size: 18px;
	}
	.add-btn .add-text {
		display: none;
	}
}

table {
	width: 100%;
	border-collapse: collapse;
	border-radius: 10px;
	overflow: hidden;
}

th, td {
	padding: 14px 16px;
	text-align: left;
	font-size: 15px;
	border-bottom: 1px solid #e0e0e0;
}

th {
	background-color: #cceeff;
	font-weight: 600;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #eef6ff;
}

.btn {
	display: inline-block;
	padding: 8px 14px;
	font-size: 14px;
	font-weight: 600;
	border-radius: 6px;
	border: none;
	cursor: pointer;
	text-decoration: none;
	transition: background-color 0.3s ease, transform 0.2s;
	user-select: none;
	margin-right: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.btn.edit {
	background-color: #0077b6;
	color: white;
}

.btn.edit:hover {
	background-color: #005f8a;
}

.btn.delete {
	background-color: #d90429;
	color: white;
}

.btn.delete:hover {
	background-color: #a1031e;
}

.btn.toggle {
	background-color: #f97316;
	color: white;
}

.btn.toggle:hover {
	background-color: #c65b13;
}

.status-active {
	color: #2e7d32;
	font-weight: bold;
}

.status-inactive {
	color: #757575;
	font-weight: bold;
}

.alert {
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 6px;
	font-weight: bold;
}

.alert.success {
	background-color: #d4edda;
	color: #155724;
	border: 1px solid #c3e6cb;
}

.alert.error {
	background-color: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
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
			<a href="ManagePatient.jsp"><i class="fa-solid fa-user-injured"></i>
				Manage Patients</a> <a href="manageDoctors.jsp"><i
				class="fa-solid fa-user-doctor"></i> Manage Doctors</a> <a
				href="manageStaff.jsp"><i class="fa-solid fa-people-group"></i>
				Manage Staff</a> <a href="manageDepartments.jsp"><i
				class="fas fa-hospital"></i> Manage Departments</a> <a
				href="viewReports.jsp"><i class="fas fa-chart-line"></i> Reports</a>
			<a href="#"><i class="fa-solid fa-bell"></i> <span
				class="badge bg-danger">3</span></a> <a href="AdminLogoutServlet"
				class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
		</div>
	</nav>

	<script>
    function toggleNavbar() {
        var links = document.querySelector('.navbar-links');
        links.classList.toggle('show');
    }
</script>

	<h2>Manage Departments</h2>

	<%
	String message = (String) session.getAttribute("message");
	String error = (String) session.getAttribute("error");
	if (message != null) {
	%>
	<div class="alert success"><%=message%></div>
	<%
	session.removeAttribute("message");
	}
	%>

	<%
	if (error != null) {
	%>
	<div class="alert error"><%=error%></div>
	<%
	session.removeAttribute("error");
	}
	%>

	<div class="search-add-container">
		<input type="text" id="searchInput"
			placeholder="Search departments by name..."
			onkeyup="filterDepartments()"> <a href="add_department.jsp"
			class="add-btn"><i class="fas fa-plus"></i> <span
			class="add-text">Add Department</span></a>
	</div>

	<div class="table-section">
		<h3>Existing Departments</h3>
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Facilities</th>
				<th>Doctor IDs</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
			<%
			Connection conn2 = DBConnector.getConnection();
			DepartmentDAO dao = new DepartmentDAO(conn2);
			List<Department> deptList = dao.getAllDepartments();
			for (Department d : deptList) {
				String status = d.getStatus();
			%>
			<tr>
				<td><%=d.getId()%></td>
				<td><%=d.getName()%></td>
				<td><%=d.getFacilities() != null ? d.getFacilities() : "N/A"%></td>
				<td><%=d.getDoctors() != null ? d.getDoctors() : "N/A"%></td>
				<td
					class="<%="Active".equalsIgnoreCase(status) ? "status-active" : "status-inactive"%>">
					<%=status != null ? status : "Unknown"%>
				</td>
				<td><a href="edit_department.jsp?editId=<%=d.getId()%>"
					class="btn edit">Edit</a> <a
					href="DeleteDepartmentServlet?id=<%=d.getId()%>"
					class="btn delete" onclick="return confirm('Are you sure?')">Delete</a>
					<a
					href="ToggleDepartmentStatusServlet?id=<%=d.getId()%>&status=<%=status != null ? status : "Inactive"%>"
					class="btn toggle"> <%="Active".equalsIgnoreCase(status) ? "Deactivate" : "Activate"%>
				</a></td>
			</tr>
			<%
			}
			conn2.close();
			%>
		</table>
	</div>

	<script>
    function filterDepartments() {
        let input = document.getElementById("searchInput").value.toLowerCase();
        let rows = document.querySelectorAll("table tr:not(:first-child)");
        rows.forEach(row => {
            let name = row.cells[1].innerText.toLowerCase();
            row.style.display = name.includes(input) ? "" : "none";
        });
    }
</script>

	<%@ include file="footer.jsp"%>
</body>
</html>
