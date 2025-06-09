<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
<h2>Complete Payment</h2>
<form id="paymentForm">
    <input type="hidden" id="appointment_id" value="<%= request.getParameter("appointment_id") %>" />
    <input type="hidden" id="patient_name" value="<%= request.getParameter("patient_name") %>" />
    <input type="hidden" id="amount" value="<%= request.getParameter("amount") %>" />
    <button type="button" onclick="payNow()">Pay ₹<%= request.getParameter("amount") %></button>
</form>

<script>
function payNow() {
    const amount = document.getElementById("amount").value * 100;
    const options = {
        "key": "rzp_test_1234567890abcdef", // Your test key
        "amount": amount,
        "currency": "INR",
        "name": "MediCarePro",
        "description": "Appointment Payment",
        "handler": function (response) {
            fetch('paymentCallback', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    razorpay_payment_id: response.razorpay_payment_id,
                    appointment_id: document.getElementById("appointment_id").value,
                    patient_name: document.getElementById("patient_name").value,
                    amount: document.getElementById("amount").value,
                    payment_method: 'Online',
                    payment_status: 'Paid'
                })
            }).then(res => res.text())
              .then(data => window.location.href = "paymentSuccess.jsp")
              .catch(() => window.location.href = "paymentFailure.jsp");
        }
    };
    const rzp = new Razorpay(options);
    rzp.open();
}
</script>
</body>
</html>
