<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page
	import="java.sql.*, java.util.*, com.medicarepro.DTO.Staff, com.medicarepro.utility.DBConnector"%>

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
<html>
<head>
<meta charset="UTF-8">
<title>Manage Staff</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: #f9fafb;
	margin: 0;
	padding: 40px;
	color: #333;
}

h2 {
	color: #34495e;
	font-size: 26px;
	margin-bottom: 25px;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
}

.add-btn {
	background: #007bff;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 6px;
	font-size: 14px;
	transition: background 0.3s ease;
	float: right;
	margin-bottom: 20px;
}

.add-btn:hover {
	background: #0056b3;
}

form {
	margin-bottom: 30px;
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
	align-items: center;
}

input[type="text"] {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 6px;
	width: 300px;
	font-size: 14px;
}

input[type="submit"] {
	background: #28a745;
	border: none;
	padding: 10px 16px;
	color: white;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	transition: background 0.3s;
}

input[type="submit"]:hover {
	background: #218838;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: #fff;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	padding: 14px 16px;
	text-align: left;
	border-bottom: 1px solid #eaeaea;
	font-size: 14px;
}

th {
	background-color: #343a40;
	color: white;
	text-transform: uppercase;
	letter-spacing: 0.6px;
}

tr:hover {
	background-color: #f4f4f4;
}

.status-btn {
	padding: 6px 12px;
	border: none;
	border-radius: 4px;
	font-size: 13px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
}

.status-btn.active {
	background-color: #ffc107;
	color: white;
}

.status-btn.active:hover {
	background-color: #e0a800;
}

.status-btn.inactive {
	background-color: #dc3545;
	color: white;
}

.status-btn.inactive:hover {
	background-color: #c82333;
}

@media ( max-width : 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	thead tr {
		display: none;
	}
	tr {
		margin-bottom: 15px;
		border-radius: 8px;
		background: white;
		box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
	}
	td {
		padding: 10px 15px;
		text-align: right;
		position: relative;
	}
	td::before {
		content: attr(data-label);
		position: absolute;
		left: 15px;
		font-weight: bold;
		text-transform: capitalize;
		color: #666;
	}
}
</style>

</head>
<body>

	<h2>Manage Staff</h2>
	<a class="add-btn" href="AddStaff.jsp">+ Add Staff</a>

	<form method="get" action="manageStaff.jsp">
		<input type="text" name="search"
			placeholder="Search by name or department"
			value="<%=request.getParameter("search") != null ? request.getParameter("search") : ""%>" />
		<input type="submit" value="Search" />
	</form>

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
			<%
			for (Staff s : staffList) {
			%>
			<tr>
				<td data-label="ID"><%=s.getStaffId()%></td>
				<td data-label="Name"><%=s.getName()%></td>
				<td data-label="Phone"><%=s.getPhone()%></td>
				<td data-label="Email"><%=s.getEmail()%></td>
				<td data-label="Department"><%=s.getDepartment()%></td>
				<td data-label="Qualification"><%=s.getQualification()%></td>
				<td data-label="Experience"><%=s.getExperience()%></td>
				<td data-label="Shift"><%=s.getShift()%></td>
				<td data-label="Status"><%=s.getStatus()%></td>
				<td data-label="Actions">
					<!-- Toggle Status -->
					<form action="ToggleStaffStatusServlet" method="post"
						style="display: inline-block;">
						<input type="hidden" name="staffId" value="<%=s.getStaffId()%>" />
						<input type="hidden" name="currentStatus"
							value="<%=s.getStatus()%>" /> <input type="submit"
							value="<%=s.getStatus().equals("Active") ? "Deactivate" : "Activate"%>"
							class="status-btn <%=s.getStatus().equals("Active") ? "inactive" : "active"%>" />
					</form> <!-- Edit --> <a href="EditStaff.jsp?id=<%=s.getStaffId()%>"
					class="status-btn active">Edit</a> <!-- Delete -->
					<form action="DeleteStaffServlet" method="post"
						style="display: inline-block;"
						onsubmit="return confirm('Are you sure you want to delete this staff member?');">
						<input type="hidden" name="staffId" value="<%=s.getStaffId()%>" />
						<input type="submit" value="Delete" class="status-btn inactive" />
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<%@ include file="footer.jsp"%>

</body>
</html>
