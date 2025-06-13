<%@ page import="java.sql.*, java.util.*, com.medicarepro.utility.DBConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Department - MediCarePro HMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #f0f8ff, #e6f7ff);
            margin: 0;
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

        .form-section h2 {
            margin-bottom: 25px;
            color: #006494;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: 600;
            color: #333;
        }

        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 12px 14px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border 0.2s;
        }

        input[type="text"]:focus,
        textarea:focus,
        select:focus {
            border-color: #0077b6;
            outline: none;
        }

        select[multiple] {
            height: auto;
        }

        input[type="submit"] {
            background-color: #0077b6;
            color: white;
            border: none;
            padding: 14px 28px;
            font-size: 15px;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 30px;
            transition: background-color 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #005f8a;
            transform: translateY(-2px);
        }

        a.back-link {
            display: inline-block;
            margin-top: 25px;
            color: #0077b6;
            font-weight: 500;
            text-decoration: none;
            transition: text-decoration 0.2s;
        }

        a.back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-section">
        <h2>Add New Department</h2>
        <form action="AddDepartmentServlet" method="post">
            <label for="name">Department Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="facilities">Facilities:</label>
            <textarea id="facilities" name="facilities" rows="4"></textarea>

            <label for="doctors">Assign Doctors (Ctrl+Click for multiple):</label>
            <select id="doctors" name="doctors" multiple size="5">
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
        </form>
        <a href="manageDepartments.jsp" class="back-link">&larr; Back to Manage Departments</a>
    </div>
</body>
</html>
