<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
.footer {
	background: linear-gradient(to right, #007bff, #0056b3);
	color: #ffffff;
	padding: 40px 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin-top: 50px;
	box-shadow: 0 -3px 10px rgba(0, 0, 0, 0.1);
}

.footer-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: flex-start;
	max-width: 1200px;
	margin: auto;
	padding: 0 20px;
}

.footer-section {
	flex: 1 1 280px;
	margin: 20px 10px;
}

.footer-section h3 {
	font-size: 1.25rem;
	margin-bottom: 15px;
	border-bottom: 2px solid #ffffff50;
	padding-bottom: 5px;
}

.footer-section p, .footer-section a {
	font-size: 1rem;
	color: #ffffff;
	text-decoration: none;
	margin: 6px 0;
	display: block;
	transition: color 0.3s ease;
}

.footer-section a:hover {
	color: #ffd700;
}

.social-icons a {
	display: inline-block;
	margin-right: 15px;
	color: #ffffff;
	font-size: 1.4rem;
	transition: transform 0.3s ease, color 0.3s ease;
}

.social-icons a:hover {
	color: #ffd700;
	transform: scale(1.2);
}

.footer-bottom {
	text-align: center;
	padding-top: 20px;
	border-top: 1px solid #ffffff30;
	font-size: 0.9rem;
	margin-top: 20px;
	color: #ffffff;
}

.footer-bottom a {
	color: #ffffff;
	margin: 0 8px;
	text-decoration: none;
	transition: color 0.3s ease;
}

.footer-bottom a:hover {
	color: #ffd700;
}

.highlight-developer {
	color: #ffd700;
	font-weight: 600;
	background-color: rgba(255, 255, 255, 0.1);
	padding: 3px 8px;
	border-radius: 6px;
	display: inline-block;
	box-shadow: 0 0 5px rgba(255, 215, 0, 0.4);
	transition: background-color 0.3s ease, color 0.3s ease;
}

.highlight-developer:hover {
	background-color: #ffd700;
	color: #0056b3;
	cursor: pointer;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.footer-container {
		flex-direction: column;
		align-items: center;
		padding: 0 10px;
	}
	.footer-section {
		text-align: center;
		margin: 15px 0;
	}
	.social-icons a {
		margin: 10px;
	}
}

@media ( max-width : 480px) {
	.footer-section h3 {
		font-size: 1.1rem;
	}
	.footer-section p, .footer-section a {
		font-size: 0.95rem;
	}
	.footer-bottom {
		font-size: 0.8rem;
	}
}
</style>

<footer class="footer">
	<div class="footer-container">
		<!-- About Section -->
		<div class="footer-section">
			<h3>About MediCarePro</h3>
			<p>Your trusted partner in healthcare, providing top-notch
				medical services with compassion and excellence.</p>
		</div>

		<!-- Contact Info -->
		<div class="footer-section">
			<h3>Contact Us</h3>
			<p>
				<i class="fas fa-envelope"></i> pallapusuresh2000@gmail.com
			</p>
			<p>
				<i class="fas fa-phone"></i> +91 77994 65956
			</p>
			<p>
				<i class="fas fa-map-marker-alt"></i> Site No 24, Outer Ring Rd,
				Kuvempu Nagar, BTM 2nd Stage, BTM Layout, Bengaluru, Karnataka
				5600766.
			</p>
		</div>

		<!-- Social Media -->
		<div class="footer-section">
			<h3>Follow Us</h3>
			<div class="social-icons">
				<a href="https://www.facebook.com/" title="Facebook"><i class="fab fa-facebook-f"></i></a> <a
					href="https://www.linkedin.com/in/suresh-pallapu" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a> <a
					href="https://www.instagram.com/the.only_suresh_" title="Instagram"><i class="fab fa-instagram"></i></a> <a
					href="https://x.com/sureshpallapu7" title="Twitter"><i class="fab fa-twitter"></i></a>
			</div>
		</div>
	</div>

	<!-- Bottom Section -->
	<div class="footer-bottom" role="contentinfo">
		<p>
			&copy; 2025 MediCarePro. All Rights Reserved. | <span
				class="highlight-developer"> <i class="fas fa-code"></i>
				Developed & Designed by Suresh
			</span>
		</p>
		<p>
			<a href="privacyPolicy.jsp">Privacy Policy</a> | <a
				href="termsConditions.jsp">Terms & Conditions</a>
		</p>
	</div>
</footer>
