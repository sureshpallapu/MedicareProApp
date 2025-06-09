<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Staff - MediCarePro</title>
<style>
body {
	font-family: Arial;
	background: #eef;
	padding: 20px;
}

form {
	background: #fff;
	padding: 20px;
	max-width: 500px;
	margin: auto;
	border-radius: 10px;
	box-shadow: 0 0 10px #ccc;
}

h2 {
	text-align: center;
}

.form-group {
	margin-bottom: 15px;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
}

input, select {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 6px;
}

button {
	background: #28a745;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

button:hover {
	background: #218838;
}
</style>
</head>
<body>

	<h2>Add Staff</h2>

	<form action="AddStaffServlet" method="post">

		<div class="form-group">
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" required>
		</div>
		<div class="form-group">
			<label for="phone">Phone:</label> <input type="text" id="phone"
				name="phone" required>
		</div>
		<div class="form-group">
			<label for="email">Email:</label> <input type="email" id="email"
				name="email" required>
		</div>
		<div class="form-group">
			<label for="department">Department:</label> <select id="department"
				name="department" required>
				<option value="">-- Select Department --</option>
				<option value="Reception">Reception</option>
				<option value="Pharmacy">Pharmacy</option>
				<option value="Laboratory">Laboratory</option>
				<option value="General">General</option>
			</select>
		</div>
		<div class="form-group">
			<label for="qualification">Qualification:</label> <input type="text"
				id="qualification" name="qualification" required>
		</div>
		<div class="form-group">
			<label for="experience">Experience:</label> <input type="text"
				id="experience" name="experience" required>
		</div>
		<div class="form-group">
			<label for="shift">Shift:</label> <select id="shift" name="shift"
				required>
				<option value="Morning">Morning</option>
				<option value="Evening">Evening</option>
				<option value="Night">Night</option>
			</select>
		</div>
		<div class="form-group">
			<label for="status">Status:</label> <select id="status" name="status"
				required>
				<option value="Active">Active</option>
				<option value="On Leave">On Leave</option>
				<option value="Resigned">Resigned</option>
			</select>
		</div>
		<button type="submit">Submit</button>
	</form>

</body>
</html>
