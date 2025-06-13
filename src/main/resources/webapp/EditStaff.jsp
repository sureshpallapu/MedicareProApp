<%@ page import="java.sql.*, com.medicarepro.utility.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Staff - MediCarePro</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #f0f8ff, #e6f7ff);
            padding: 40px 20px;
            color: #333;
        }

        .form-section {
            background: #fff;
            max-width: 600px;
            margin: auto;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #006494;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="email"],
        select {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border 0.2s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        select:focus {
            border-color: #0077b6;
            outline: none;
        }

        button[type="submit"] {
            display: block;
            width: 100%;
            background: #28a745;
            color: #fff;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        button[type="submit"]:hover {
            background: #218838;
            transform: translateY(-2px);
        }

        a.back-link {
            display: inline-block;
            margin-top: 25px;
            color: #0077b6;
            text-decoration: none;
            font-weight: 500;
            transition: text-decoration 0.2s;
        }

        a.back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="form-section">
        <h2>Edit Staff</h2>
        <form action="EditUpdateStaffServlet" method="post">
            <input type="hidden" name="staffId" value="<%= staffId %>">

            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= name %>" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="<%= phone %>" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= email %>" required>
            </div>

            <div class="form-group">
                <label for="department">Department:</label>
                <input type="text" id="department" name="department" value="<%= dept %>" required>
            </div>

            <div class="form-group">
                <label for="qualification">Qualification:</label>
                <input type="text" id="qualification" name="qualification" value="<%= qual %>" required>
            </div>

            <div class="form-group">
                <label for="experience">Experience:</label>
                <input type="text" id="experience" name="experience" value="<%= exp %>" required>
            </div>

            <div class="form-group">
                <label for="shift">Shift:</label>
                <input type="text" id="shift" name="shift" value="<%= shift %>" required>
            </div>

            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status" required>
                    <option value="Active" <%= "Active".equals(status) ? "selected" : "" %>>Active</option>
                    <option value="Inactive" <%= "Inactive".equals(status) ? "selected" : "" %>>Inactive</option>
                </select>
            </div>

            <button type="submit">Update Staff</button>
        </form>

        <a href="manageStaff.jsp" class="back-link">&larr; Back to Manage Staff</a>
    </div>

</body>
</html>
