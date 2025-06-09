<%@ page import="java.sql.*, com.medicarepro.utility.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, com.medicarepro.utility.DBConnector"%>
<%
String idParam = request.getParameter("id");
if (idParam == null) {
	response.sendRedirect("manageStaff.jsp");
	return;
}
int staffId = Integer.parseInt(idParam);

String name = "", phone = "", email = "", dept = "", qual = "", exp = "", shift = "", status = "";

try (Connection con = DBConnector.getConnection()) {
	String sql = "SELECT * FROM staff WHERE staffId = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, staffId);
	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
		name = rs.getString("name");
		phone = rs.getString("phone");
		email = rs.getString("email");
		dept = rs.getString("department");
		qual = rs.getString("qualification");
		exp = rs.getString("experience");
		shift = rs.getString("shift");
		status = rs.getString("status");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Staff</title>
<style>
body {
	font-family: Arial;
	background: #f4f4f4;
	padding: 20px;
}

form {
	background: #fff;
	padding: 20px;
	border-radius: 6px;
	box-shadow: 0 0 10px #ccc;
	max-width: 600px;
	margin: auto;
}

label, input, select {
	display: block;
	width: 100%;
	margin-bottom: 15px;
}

input[type="submit"] {
	background: #28a745;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 5px;
}
</style>
</head>
<body>

	<h2>Edit Staff</h2>
	<form action="EditUpdateStaffServlet" method="post">
		<input type="hidden" name="staffId" value="<%=staffId%>"> <label>Name:
			<input type="text" name="name" value="<%=name%>" />
		</label><br> <label>Phone: <input type="text" name="phone"
			value="<%=phone%>" /></label><br> <label>Email: <input
			type="email" name="email" value="<%=email%>" /></label><br> <label>Department:
			<input type="text" name="department" value="<%=dept%>" />
		</label><br> <label>Qualification: <input type="text"
			name="qualification" value="<%=qual%>" /></label><br> <label>Experience:
			<input type="text" name="experience" value="<%=exp%>" />
		</label><br> <label>Shift: <input type="text" name="shift"
			value="<%=shift%>" /></label><br> <label>Status: <select
			name="status">
				<option value="Active"
					<%="Active".equals(status) ? "selected" : ""%>>Active</option>
				<option value="Inactive"
					<%="Inactive".equals(status) ? "selected" : ""%>>Inactive</option>
		</select>
		</label><br> <input type="submit" value="Update Staff">
	</form>

</body>
</html>
