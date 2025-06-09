<%@ page import="java.util.List"%>
<%@ page import="com.medicarepro.DTO.Appointment"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
if (appointments == null) {
    appointments = new java.util.ArrayList<>();
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Appointments</title>
    <style>
        /* Reset and base */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 900px;
            margin: 40px auto 60px;
            padding: 0 20px;
            background: #f9faff;
            color: #333;
        }

        h2 {
            color: #007bff;
            margin-bottom: 30px;
            font-weight: 700;
            text-align: center;
        }

        a.back {
            display: inline-block;
            margin-bottom: 25px;
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        a.back:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        /* Filter input container */
        .filter-container {
            text-align: right;
            margin-bottom: 15px;
        }

        label[for="filterDate"] {
            font-weight: 600;
            margin-right: 10px;
            color: #555;
        }

        input#filterDate {
            padding: 7px 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1.8px solid #ddd;
            transition: border-color 0.3s ease;
            outline: none;
            width: 180px;
        }
        input#filterDate:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        thead {
            background-color: #007bff;
            color: white;
            font-weight: 700;
        }

        th, td {
            padding: 14px 20px;
            text-align: left;
            border-bottom: 1px solid #eee;
            font-size: 15px;
        }

        tbody tr:hover {
            background-color: #f1f7ff;
            cursor: default;
        }

        tbody tr.no-data {
            color: #999;
            font-style: italic;
        }

        /* Responsive */
        @media (max-width: 600px) {
            body {
                padding: 15px 10px;
                margin: 20px auto 60px;
            }
            table, thead, tbody, th, td, tr {
                display: block;
            }
            thead tr {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            tr {
                border: 1px solid #ccc;
                margin-bottom: 10px;
                border-radius: 8px;
                padding: 10px;
                background: white;
            }
            td {
                border: none;
                position: relative;
                padding-left: 50%;
                font-size: 14px;
            }
            td:before {
                position: absolute;
                top: 14px;
                left: 20px;
                width: 45%;
                padding-right: 10px;
                white-space: nowrap;
                font-weight: 600;
                color: #007bff;
            }
            td:nth-of-type(1):before { content: "Appointment ID"; }
            td:nth-of-type(2):before { content: "Patient Name"; }
            td:nth-of-type(3):before { content: "Appointment Date"; }
            td:nth-of-type(4):before { content: "Time Slot"; }
            td:nth-of-type(5):before { content: "Consultation Fee"; }
        }
    </style>
</head>
<body>

    <a class="back" href="doctorDashboard.jsp">&larr; Back to Dashboard</a>

    <h2>My Appointments</h2>

    <div class="filter-container">
        <label for="filterDate">Filter by Date:</label>
        <input type="date" id="filterDate" />
    </div>

    <table id="appointmentsTable">
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>Patient Name</th>
                <th>Appointment Date</th>
                <th>Time Slot</th>
                <th>Consultation Fee</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (appointments.isEmpty()) {
            %>
            <tr class="no-data">
                <td colspan="5" style="text-align: center;">No appointments found.</td>
            </tr>
            <%
            } else {
                for (Appointment app : appointments) {
            %>
            <tr>
                <td><%= app.getId() %></td>
                <td><%= app.getPatientName() %></td>
                <td><%= app.getAppointmentDate() %></td>
                <td><%= app.getTimeSlot() %></td>
                <td><%= String.format("%.2f", app.getConsultationFee()) %></td>
            </tr>
            <%
                }
            }
            %>
        </tbody>
    </table>

    <%@ include file="footer.jsp" %>

    <script>
        // JavaScript for filtering appointments by date
        const filterInput = document.getElementById('filterDate');
        const table = document.getElementById('appointmentsTable');
        const tbody = table.querySelector('tbody');

        filterInput.addEventListener('input', function() {
            const filterDate = this.value; // format: yyyy-mm-dd

            const rows = tbody.querySelectorAll('tr');
            let visibleCount = 0;

            rows.forEach(row => {
                // Skip no-data row check
                if(row.classList.contains('no-data')) return;

                const dateCell = row.cells[2].textContent.trim(); // appointment date cell
                
                // Convert displayed date to yyyy-mm-dd for comparison
                const dateObj = new Date(dateCell);
                if (isNaN(dateObj)) {
                    row.style.display = 'none';
                    return;
                }
                const year = dateObj.getFullYear();
                const month = (dateObj.getMonth() + 1).toString().padStart(2, '0');
                const day = dateObj.getDate().toString().padStart(2, '0');
                const formattedDate = `${year}-${month}-${day}`;

                if (!filterDate || formattedDate === filterDate) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });

            // Show no-data message if no rows visible
            let noDataRow = tbody.querySelector('.no-data');
            if (!noDataRow) {
                noDataRow = document.createElement('tr');
                noDataRow.classList.add('no-data');
                noDataRow.innerHTML = '<td colspan="5" style="text-align:center; color:#999;">No appointments found for the selected date.</td>';
                tbody.appendChild(noDataRow);
            }

            if (visibleCount === 0) {
                noDataRow.style.display = '';
            } else {
                noDataRow.style.display = 'none';
            }
        });
    </script>
</body>
</html>
