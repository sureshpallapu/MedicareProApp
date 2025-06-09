<%@ page
    import="java.sql.*, com.medicarepro.DAO.DepartmentDAO, com.medicarepro.DTO.Department, com.medicarepro.utility.DBConnector"
    contentType="text/html;charset=UTF-8" language="java"
%>
<%
    String editId = request.getParameter("editId");
    Department dept = null;

    if (editId != null) {
        Connection conn = DBConnector.getConnection();
        DepartmentDAO dao = new DepartmentDAO(conn);
        dept = dao.getDepartmentById(Integer.parseInt(editId));
        conn.close();
    } else {
        response.sendRedirect("manageDepartments.jsp");
        return;
    }
%>

<html>
<head>
    <title>Edit Department</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9f9f9;
            padding: 20px;
            color: #333;
        }

        .form-section {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: auto;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #0077b6;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 15px;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #005f8a;
        }

        a.back-link {
            display: inline-block;
            margin-top: 20px;
            color: #0077b6;
            text-decoration: none;
        }

        a.back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-section">
    <h2>Edit Department</h2>

    <form action="UpdateDepartmentServlet" method="post">
        <input type="hidden" name="id" value="<%= dept.getId() %>">

        <label for="name">Department Name:</label>
        <input type="text" id="name" name="name" required value="<%= dept.getName() %>">

        <label for="facilities">Facilities:</label>
        <textarea id="facilities" name="facilities" rows="4"><%= dept.getFacilities() %></textarea>

        <label for="doctors">Doctor IDs (comma separated):</label>
        <input type="text" id="doctors" name="doctors" value="<%= (dept.getDoctors() == null ? "" : dept.getDoctors()) %>">

        <label for="status">Status:</label>
        <select id="status" name="status">
            <option value="Active" <%= dept.getStatus().equalsIgnoreCase("Active") ? "selected" : "" %>>Active</option>
            <option value="Inactive" <%= dept.getStatus().equalsIgnoreCase("Inactive") ? "selected" : "" %>>Inactive</option>
        </select>

        <input type="submit" value="Update Department">
    </form>

    <a href="manageDepartments.jsp" class="back-link">&larr; Back to Manage Departments</a>
</div>

</body>
</html>
