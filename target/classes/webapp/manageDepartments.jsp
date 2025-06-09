<%@ page
	import="java.sql.*, java.util.*, com.medicarepro.DAO.DepartmentDAO, com.medicarepro.DTO.Department, com.medicarepro.utility.DBConnector"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>



<html>
<head>

<title>Manage Departments - MediCarePro HMS</title>
<%
String message = (String) session.getAttribute("message");
String error = (String) session.getAttribute("error");
if (message != null) {
%>
<div class="alert success"><%=message%></div>
<%
session.removeAttribute("message");
}
if (error != null) {
%>
<div class="alert error"><%=error%></div>
<%
session.removeAttribute("error");
}
%>


<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Inter', sans-serif;
	background: linear-gradient(to right, #f0f8ff, #e6f7ff);
	margin: 0;
	padding: 30px;
	color: #333;
}

h2, h3 {
	color: #006494;
	margin-bottom: 20px;
}

.form-section, .table-section {
	background: #ffffff;
	padding: 25px;
	border-radius: 16px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
	margin-bottom: 35px;
}

label {
	font-weight: 600;
	margin-bottom: 8px;
	display: block;
}

input[type="text"], textarea, select {
	width: 100%;
	padding: 12px 14px;
	margin-top: 6px;
	margin-bottom: 18px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
	box-sizing: border-box;
	transition: border-color 0.3s ease;
}

input[type="text"]:focus, textarea:focus, select:focus {
	border-color: #0077b6;
	outline: none;
}

textarea {
	resize: vertical;
}

input[type="submit"] {
	background-color: #0077b6;
	color: white;
	border: none;
	padding: 12px 25px;
	font-size: 16px;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.2s;
}

input[type="submit"]:hover {
	background-color: #005f8a;
	transform: scale(1.03);
}

a {
	text-decoration: none;
}

a.action {
	color: #0077b6;
	font-weight: 600;
	margin-right: 12px;
	transition: color 0.3s ease;
}

a.action:hover {
	text-decoration: underline;
	color: #004e70;
}

a.delete {
	color: #d90429;
}

#searchInput {
	width: 100%;
	padding: 12px;
	margin-bottom: 25px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
	box-sizing: border-box;
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

.status-active {
	color: #2e7d32;
	font-weight: bold;
}

.status-inactive {
	color: #757575;
	font-weight: bold;
}

/* Base button style */
.btn {
	display: inline-block;
	padding: 8px 14px;
	font-size: 14px;
	font-weight: 600;
	border-radius: 6px;
	border: none;
	cursor: pointer;
	text-decoration: none;
	transition: background-color 0.3s ease, color 0.3s ease;
	user-select: none;
	margin-right: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Active status - green */
.btn.active {
	background-color: #28a745;
	color: white;
}

.btn.active:hover {
	background-color: #218838;
}

/* Inactive status - gray */
.btn.inactive {
	background-color: #6c757d;
	color: white;
}

.btn.inactive:hover {
	background-color: #5a6268;
}

/* Edit button - blue */
.btn.edit {
	background-color: #0077b6;
	color: white;
}

.btn.edit:hover {
	background-color: #005f8a;
}

/* Delete button - red */
.btn.delete {
	background-color: #d90429;
	color: white;
}

.btn.delete:hover {
	background-color: #a1031e;
}

/* Deactivate / Activate toggle button - orange */
.btn.toggle {
	background-color: #f97316;
	color: white;
}

.btn.toggle:hover {
	background-color: #c65b13;
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
</style>

</head>
<body>
	<h2>Manage Departments</h2>



	<div class="form-section">
		<%
		String editId = request.getParameter("editId");
		Department editDept = null;
		if (editId != null) {
			Connection conn = DBConnector.getConnection();
			DepartmentDAO dao = new DepartmentDAO(conn);
			editDept = dao.getDepartmentById(Integer.parseInt(editId));
			conn.close();
		}
		%>

		<h3><%=(editDept != null) ? "Edit Department" : "Add Department"%></h3>

		<p>
			<a href="add_department.jsp" class="action">+ Add New Department</a>
		</p>

	</div>
	<input type="text" id="searchInput"
		placeholder="Search departments by name..."
		onkeyup="filterDepartments()">
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
				String cssClass = "Inactive".equalsIgnoreCase(status) ? "status-inactive" : "status-active";
				String displayStatus = status != null ? status : "Unknown";
			%>
			<tr>
				<td><%=d.getId()%></td>
				<td><%=d.getName()%></td>
				<td><%=d.getFacilities() != null ? d.getFacilities() : "N/A"%></td>
				<td><%=d.getDoctors() != null ? d.getDoctors() : "N/A"%></td>
				<td
					class="<%="Active".equalsIgnoreCase(d.getStatus() != null ? d.getStatus() : "") ? "status-active" : "status-inactive"%>">
					<%=d.getStatus() != null ? d.getStatus() : "Unknown"%>
				</td>

				<td><a href="edit_department.jsp?editId=<%=d.getId()%>"
					class="btn edit">Edit</a> <a
					href="DeleteDepartmentServlet?id=<%=d.getId()%>" class="btn delete"
					onclick="return confirm('Are you sure?')">Delete</a> <a
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
	<%@ include file="footer.jsp"%>
</body>
</html>
