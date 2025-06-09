<%@ page import="java.sql.*, java.util.*, com.medicarepro.utility.DBConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Department - MediCarePro HMS</title>
    <style>
        /* Same styles as in original page */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9f9f9;
            padding: 20px;
            color: #333;
        }

        .form-section {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: auto;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #0077b6;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #005f8a;
        }

        a {
            text-decoration: none;
            color: #0077b6;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="form-section">
        <h2>Add New Department</h2>
        <form action="AddDepartmentServlet" method="post">
            <label>Department Name:</label>
            <input type="text" name="name" required>

            <label>Facilities:</label>
            <textarea name="facilities" rows="4"></textarea>

            <label>Assign Doctors (Ctrl+Click for multiple):</label>
            <select name="doctors" multiple size="5">
                <%
                    Connection conn = DBConnector.getConnection();
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery("SELECT id, name FROM doctor WHERE status='Active'");
                    while (rs.next()) {
                        int did = rs.getInt("id");
                        String dname = rs.getString("name");
                %>
                    <option value="<%= did %>"><%= dname %></option>
                <%
                    }
                    conn.close();
                %>
            </select>

            <input type="submit" value="Add Department">
            <a href="manageDepartments.jsp">Cancel</a>
        </form>
    </div>
</body>
</html>
