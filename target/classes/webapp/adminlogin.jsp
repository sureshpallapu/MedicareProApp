<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login - MedicarePro</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	background: 
		url('<%=request.getContextPath()%>/images/bg4.jpg') no-repeat
		center center fixed;
	background-size: cover;
}

.login-container {
	width: 350px;
	margin: 100px auto;
	padding: 30px 25px;
	background-color: rgba(255, 255, 255, 0.95);
	box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
	border-radius: 10px;
}

h2 {
	text-align: center;
	color: #0d6efd;
	margin-bottom: 20px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	width: 100%;
	padding: 12px;
	background-color: #0d6efd;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
}

input[type="submit"]:hover {
	background-color: #084298;
}

.error {
	color: red;
	font-size: 14px;
	text-align: center;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="login-container">
		<h2>Admin Login</h2>
		<form method="POST" action="AdminLoginServlet">
			<input type="text" name="username" placeholder="Username" required><br>
			<input type="password" name="password" placeholder="Password"
				required><br> <input type="submit" value="Login">
		</form>
		<div class="error">
			<%=request.getParameter("error") != null ? request.getParameter("error") : ""%>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
