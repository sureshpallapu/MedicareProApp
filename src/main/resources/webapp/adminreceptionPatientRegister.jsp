<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="patientHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Registration Form</title>
<style>
body {
	margin: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
	padding: 40px;
}

.form-container {
	background-color: #ffffff;
	padding: 35px;
	border-radius: 20px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
	max-width: 1000px;
	margin: auto;
	animation: fadeIn 0.6s ease-in-out;
}

h1, h2, h3 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

h3 {
	margin-top: 30px;
	border-bottom: 2px solid #66a6ff;
	padding-bottom: 5px;
	font-size: 20px;
}

.form-row {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
	flex-wrap: wrap;
}

.form-group {
	flex: 1;
	display: flex;
	flex-direction: column;
	min-width: 250px;
}

label {
	margin-bottom: 6px;
	font-weight: 600;
	color: #555;
}

input, select, textarea, button {
	padding: 10px;
	border-radius: 10px;
	border: 1px solid #ccc;
	font-size: 15px;
	transition: all 0.3s ease-in-out;
	background-color: #f9f9f9;
}

input:focus, select:focus, textarea:focus {
	border-color: #66a6ff;
	box-shadow: 0 0 5px rgba(102, 166, 255, 0.6);
	outline: none;
}

textarea {
	resize: vertical;
	min-height: 60px;
}

button {
	cursor: pointer;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	border: none;
	font-weight: 700;
	margin-top: 24px;
	flex-shrink: 0;
	min-width: 120px;
	transition: background 0.4s ease-in-out;
}

button:hover {
	background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
}

.submit-btn {
	text-align: center;
	margin-top: 30px;
}

.submit-btn input {
	padding: 12px 30px;
	border: none;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	font-size: 16px;
	border-radius: 25px;
	cursor: pointer;
	transition: background 0.4s ease-in-out;
}

.submit-btn input:hover {
	background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
}

@
keyframes fadeIn { 0% {
	transform: translateY(30px);
	opacity: 0;
}
100
%
{
transform
:
translateY(
0
);
opacity
:
1;
}
}
</style>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
	<div class="form-container">
		<h1>Medicare-Pro</h1>
		<h2>🩺 Patient Registration Form</h2>
		<form id="patientForm" action="RegisterPatientServlet" method="post">

			<!-- Personal Information -->
			<h3>1. Personal Information</h3>
			<div class="form-row">
				<div class="form-group">
					<label>Full Name <span style="color: red;">*</span></label> <input
						type="text" name="fullName" placeholder="Enter your full Name"
						required>
				</div>

				<div class="form-group">
					<label>Date of Birth <span style="color: red;">*</span></label> <input
						type="date" name="dob" id="dob" required onchange="calculateAge()">
				</div>

				<div class="form-group">
					<label>Age <span style="color: red;">*</span></label> <input
						type="number" id="age" name="age" readonly
						placeholder="Auto-calculated">
				</div>
				<div class="form-group">
					<label>Gender <span style="color: red;">*</span></label> <select
						name="gender">
						<option>Male</option>
						<option>Female</option>
						<option>Other</option>
					</select>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label>Blood Group <span style="color: red;">*</span></label> <select
						name="bloodGroup">
						<option>A+</option>
						<option>A-</option>
						<option>B+</option>
						<option>B-</option>
						<option>AB+</option>
						<option>AB-</option>
						<option>O+</option>
						<option>O-</option>
					</select>
				</div>
				<div class="form-group">
					<label>Marital Status <span style="color: red;">*</span></label> <select
						name="maritalStatus">
						<option>Single</option>
						<option>Married</option>
						<option>Other</option>
					</select>
				</div>
			</div>

			<!-- Contact Information -->
			<h3>2. Contact Information</h3>
			<div class="form-row">
				<div class="form-group" style="flex: 2;">
					<label>Phone Number <span style="color: red;">*</span></label> <input
						type="text" id="phone" name="phone" required maxlength="10"
						pattern="\d{10}" title="Enter 10-digit phone number">
				</div>

			</div>



			<div class="form-row">
				<div class="form-group">
					<label>Alternate Phone</label> <input type="text"
						name="alternatePhone">
				</div>
				<div class="form-group">
					<label>Email <span style="color: red;">*</span></label> <input
						type="email" name="email" required onblur="checkEmailExists()">
				</div>
				<div id="emailStatus"
					style="color: red; font-weight: bold; margin-top: 5px;"></div>

			</div>

			<div class="form-row">
				<div class="form-group" style="flex: 1 1 100%;">
					<label>Address <span style="color: red;">*</span></label>
					<textarea name="address" required></textarea>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label>Emergency Contact Name <span style="color: red;">*</span></label>
					<input type="text" name="emergencyName" required>
				</div>
				<div class="form-group">
					<label>Emergency Contact Relationship <span
						style="color: red;">*</span></label> <input type="text"
						name="emergencyRelation" required>
				</div>
				<div class="form-group">
					<label>Emergency Contact Phone <span style="color: red;">*</span></label>
					<input type="text" name="emergencyPhone" required>
				</div>
			</div>

			<!-- Identification Details -->
			<h3>3. Identification Details</h3>
			<div class="form-row">
				<div class="form-group">
					<label>Government ID Type <span style="color: red;">*</span></label>
					<select name="govtIdType" required>
						<option value="">Select ID Type</option>
						<option value="aadhaar">Aadhaar Card</option>
						<option value="pan">PAN Card</option>
						<option value="voter">Voter ID</option>
						<option value="passport">Passport</option>
						<option value="driving_license">Driving License</option>
						<!-- Add more as needed -->
					</select>
				</div>
				<div class="form-group">
					<label>Government ID Number <span style="color: red;">*</span></label>
					<input type="text" name="govtIdNumber" required
						placeholder="Enter Government ID Number">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label>Insurance Company</label> <input type="text"
						name="insuranceCompany" placeholder="Enter Insurance Company Name">
				</div>
				<div class="form-group">
					<label>Insurance Number</label> <input type="text"
						name="insuranceNumber" placeholder="Enter Insurance Number">
				</div>
			</div>


			<!-- Medical Details -->
			<h3>4. Medical Details</h3>
			<div class="form-row">
				<div class="form-group">
					<label>Known Allergies</label>
					<textarea name="allergies"></textarea>
				</div>
				<div class="form-group">
					<label>Medical History</label>
					<textarea name="history"></textarea>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label>Current Medications</label>
					<textarea name="medications"></textarea>
				</div>

				<div class="form-group">
					<label>Smoking / Alcohol Habits <span style="color: red;">*</span></label>
					<input type="text" name="habits" required>
				</div>
			</div>
			<!-- Patient Type -->
			<h3>5. Patient Type</h3>
			<div class="form-row">
				<div class="form-group">
					<label>Type <span style="color: red;">*</span></label> <select
						name="patientType">
						<option value="Outpatient">Outpatient</option>
						<option value="Inpatient">Inpatient</option>
					</select>
				</div>
			</div>

			<!-- Admission Details -->
			<h3>6. Admission Details (For Inpatients)</h3>
			<div class="form-row">
				<div class="form-group">
					<label>Admission Date</label> <input type="date"
						name="admissionDate">
				</div>
				<div class="form-group">
					<label>Ward / Room No</label> <input type="text" name="ward">
				</div>
				<div class="form-group">
					<label>Bed No</label> <input type="text" name="bed">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label>Attending Doctor</label> <input type="text" name="doctor">
				</div>
				<div class="form-group">
					<label>Diagnosis / Reason</label> <input type="text" name="reason">
				</div>
				<div class="form-group">
					<label>Expected Discharge Date</label> <input type="date"
						name="dischargeDate">
				</div>
			</div>



			<!-- Additional Notes -->
			<h3>7. Additional Notes</h3>
			<div class="form-row">
				<div class="form-group">
					<label>Special Instructions</label>
					<textarea name="instructions"></textarea>
				</div>
				<div class="form-group">
					<label>Dietary Restrictions</label>
					<textarea name="diet"></textarea>
				</div>
			</div>
			<div class="g-recaptcha"
				data-sitekey="6LfAHD8rAAAAALtOHv3AEzYRZj2W0voqztybj-W1"></div>
			<div class="submit-btn">
				<input type="submit" value="Register Patient" id="submitBtn">
			</div>

		</form>
	</div>
	<div>
		<!-- External reCAPTCHA script -->
		<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	</div>
	<%@ include file="footer.jsp"%>
	<!-- Your custom JS code -->
	<script>
	function calculateAge() {
	    const dob = document.getElementById('dob').value;
	    if (dob) {
	        const birthDate = new Date(dob);
	        const today = new Date();
	        let age = today.getFullYear() - birthDate.getFullYear();
	        const monthDiff = today.getMonth() - birthDate.getMonth();
	        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
	            age--;
	        }
	        document.getElementById('age').value = age >= 0 ? age : '';
	    } else {
	        document.getElementById('age').value = '';
	    }
	}


	function checkEmailExists() {
	    const email = document.querySelector('input[name="email"]').value.trim();
	    const statusDiv = document.getElementById('emailStatus');

	    if(email === '') {
	        statusDiv.textContent = '';
	        document.getElementById('submitBtn').disabled = false;
	        return;
	    }

	    fetch('CheckEmailServlet?email=' + encodeURIComponent(email))
	        .then(response => response.text())
	        .then(data => {
	            if(data === 'exists') {
	                statusDiv.textContent = 'Email is already registered!';
	                document.getElementById('submitBtn').disabled = true;
	            } else {
	                statusDiv.textContent = '';
	                document.getElementById('submitBtn').disabled = false;
	            }
	        })
	        .catch(error => {
	            console.error('Error checking email:', error);
	            statusDiv.textContent = 'Error checking email';
	            document.getElementById('submitBtn').disabled = false;
	        });
	}
	</script>


</body>
</html>
