<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MediCarePro - Hospital Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<!-- Custom Styles -->
<style>
/* Global Styling */
body, html {
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	scroll-behavior: smooth;
}

h2 {
	text-align: center;
	margin: 2rem 0;
	font-size: 2rem;
	color: #0a3d62;
}

/* Background Slideshow */
.background-slideshow {
	position: relative;
	height: 100vh;
	background: url('images/hospital-bg.jpg') center/cover no-repeat;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	color: white;
	text-shadow: 1px 1px 8px #000;
	text-align: center;
}

.message-overlay h2 {
	font-size: 3rem;
	margin-bottom: 1rem;
}

.cta-section {
	display: flex;
	gap: 1rem;
}

.cta-button {
	background: #27ae60;
	border: none;
	padding: 1rem 2rem;
	font-size: 1rem;
	border-radius: 5px;
	color: white;
	cursor: pointer;
	transition: background 0.3s ease;
}

.cta-button.secondary {
	background: #2980b9;
}

.cta-button:hover {
	background: #145a32;
}

/* Carousel */
.carousel-container {
	position: relative;
	overflow: hidden;
	width: 100%;
	max-height: 500px;
}

.carousel-track {
	display: flex;
	transition: transform 0.5s ease-in-out;
}

.slide video {
	width: 100vw;
	height: auto;
	display: block;
}

.arrow {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	font-size: 2rem;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	cursor: pointer;
	padding: 0.5rem;
	z-index: 2;
}

.arrow.left {
	left: 10px;
}

.arrow.right {
	right: 10px;
}

.dots {
	text-align: center;
	margin-top: 1rem;
}

/* Counters */
#stats {
	background: #f0f0f0;
	padding: 3rem 1rem;
	text-align: center;
}

.counters {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 2rem;
}

.counter {
	background: white;
	padding: 1.5rem;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 200px;
}

.counter h3 {
	font-size: 2rem;
	color: #27ae60;
}

/* Services Section */
#services {
	padding: 60px 20px;
	background-color: #f4f8fb;
	text-align: center;
}

#services h2 {
	font-size: 2rem;
	margin-bottom: 30px;
	color: #2c3e50;
}

.services-cards {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 25px;
}

.service-card {
	background: #ffffff;
	border-radius: 10px;
	padding: 15px;
	width: 250px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.service-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.service-card img {
	width: 200px;
	height: 150px;
	object-fit: contain;
	margin-bottom: 10px;
}

.service-card p {
	font-size: 1rem;
	color: #333;
	margin: 0;
}

/* Specialities */
.speciality-card {
	background-size: cover;
	background-position: center;
	height: 300px;
	position: relative;
	border-radius: 12px;
	display: flex;
	align-items: flex-end;
	padding: 20px;
	color: #fff; /* white text for strong contrast */
	overflow: hidden;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); /* subtle black shadow */
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.speciality-card::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(30, 144, 255, 0.3); /* Dodger Blue with 30% opacity */
	z-index: 0;
	transition: background 0.3s ease;
	border-radius: 12px;
}
.speciality-card:hover::before {
	background: rgba(30, 144, 255, 0.5);
}



.speciality-card .card-body {
	position: relative;
	z-index: 1;
	font-size: 1.3rem;
	font-weight: 600;
	color: #fff000;
	text-shadow: 0 1px 4px rgba(0, 0, 0, 0.7);
}

 /* Testimonials */  
.testimonials {
	background-color: #f9f9f9;
	padding: 50px 0;
}

.testimonial-slider {
	display: flex;
	overflow-x: auto;
	gap: 20px;
	padding: 20px;
	scroll-behavior: smooth;
	background: #ffffff;
	border-radius: 12px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.testimonial-slider::-webkit-scrollbar {
	height: 10px;
}

.testimonial-slider::-webkit-scrollbar-track {
	background: #eee;
	border-radius: 10px;
}

.testimonial-slider::-webkit-scrollbar-thumb {
	background: #007bff;
	border-radius: 10px;
}

.testimonial {
	min-width: 280px;
	max-width: 280px;
	flex: 0 0 auto;
	background-color: #ffffff;
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 20px;
	text-align: center;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s;
}

.testimonial:hover {
	transform: translateY(-5px);
}

.testimonial img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	border-radius: 50%;
	border: 3px solid #007bff;
	margin-bottom: 15px;
}

.testimonial p {
	font-style: italic;
	font-size: 16px;
	line-height: 1.5;
	color: #333;
}

.faq-map-container {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	gap: 20px;
	padding: 20px;
}

.faq {
	flex: 1;
	max-width: 60%;
}

.faq-map-container {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	flex-wrap: wrap;
	gap: 20px;
	margin: 40px auto;
	max-width: 1200px;
	padding: 20px;
	box-sizing: border-box;
}


.faq, .map-section {
	flex: 1 1 45%;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.faq h2, .map-section h2 {
	margin-bottom: 20px;
	color: #2c3e50;
}

.faq-item {
	margin-bottom: 15px;
}

.faq-question {
	font-weight: bold;
	color: #333;
	margin-bottom: 5px;
}

.faq-answer {
	color: #555;
}

@media (max-width: 768px) {
	.faq-map-container {
		flex-direction: column;
	}
}


/* Responsive */
@media ( max-width : 768px) {
	.cta-section {
		flex-direction: column;
	}
	.counters, #services .services-cards, .testimonial-slider {
		flex-direction: column;
		align-items: center;
	}
	.speciality-card {
		height: 250px;
	}
	.carousel-track {
		flex-direction: column;
	}
}

/* Floating Button */
.floating-btn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 14px 22px;
	border-radius: 50px;
	font-size: 16px;
	cursor: pointer;
	z-index: 1000;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
	transition: background-color 0.3s ease;
}

.floating-btn:hover {
	background-color: #0056b3;
}

/* Modal Styling */
.enquiry-modal {
	display: none;
	position: fixed;
	z-index: 2000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	justify-content: center;
	align-items: center;
}

.enquiry-modal-content {
	background-color: white;
	width: 90%;
	max-width: 500px;
	padding: 30px;
	border-radius: 12px;
	text-align: center;
	position: relative;
	animation: fadeIn 0.4s ease-in-out;
}

@
keyframes fadeIn {
	from {opacity: 0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.enquiry-modal-content h2 {
	margin-bottom: 10px;
	font-size: 26px;
}

.enquiry-modal-content h2 span {
	color: #007bff;
}

.enquiry-modal-content p {
	font-size: 16px;
	margin-bottom: 20px;
}

.enquiry-modal-content input, .enquiry-modal-content textarea {
	width: 100%;
	padding: 10px 14px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 15px;
}

.submit-btn {
	background-color: #28a745;
	color: white;
	padding: 12px 22px;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.submit-btn:hover {
	background-color: #218838;
}

.close-btn {
	position: absolute;
	top: 15px;
	right: 20px;
	font-size: 22px;
	color: #333;
	cursor: pointer;
}
</style>

</head>
<body>
<%@ include file="header.jsp"%>
<!-- anil.kumar@hospital.com   9876543210 -->
	<!-- Background Slideshow -->
	<div class="background-slideshow" id="backgroundSlideshow">
	<div class="message-overlay">
		<h2 id="slideshowMessage">Welcome to Our Hospital</h2>
	</div>
	<div class="cta-section">
		<button onclick="window.location.href='indexappointmentbooking.jsp'" class="cta-button">Book an Appointment</button>
		<button onclick="window.location.href='doctors.jsp'" class="cta-button secondary">Find a Doctor</button>
	</div>
</div>


	<!-- Video Carousel -->
	<div class="carousel-container" id="carousel">
		<div class="carousel-track" id="carouselTrack">
			<div class="slide">
				<video src="videos/video1.mp4" autoplay muted loop playsinline></video>
			</div>
			<div class="slide">
				<video src="videos/video2.mp4" autoplay muted loop playsinline></video>
			</div>
			<div class="slide">
				<video src="videos/video3.mp4" autoplay muted loop playsinline></video>
			</div>
			<div class="slide">
				<video src="videos/video4.mp4" autoplay muted loop playsinline></video>
			</div>
			<div class="slide">
				<video src="videos/video5.mp4" autoplay muted loop playsinline></video>
			</div>
		</div>
		<button class="arrow left" onclick="moveSlide(-1)">&#10094;</button>
		<button class="arrow right" onclick="moveSlide(1)">&#10095;</button>
	</div>
	<div class="dots" id="dots"></div>

	<!-- Animated Counters -->
	<section id="stats">
		<h2>Our Achievements</h2>
		<div class="counters">
			<div class="counter">
				<h3 data-target="5000">0</h3>
				<p>Patients Served</p>
			</div>
			<div class="counter">
				<h3 data-target="100">0</h3>
				<p>Doctors</p>
			</div>
			<div class="counter">
				<h3 data-target="24">0</h3>
				<p>24/7 Support</p>
			</div>
			<div class="counter">
				<h3 data-target="50">0</h3>
				<p>Awards Won</p>
			</div>
		</div>
	</section>

	<section id="services">
		<h2>Our Services</h2>
		<div class="services-cards">
			<div class="service-card">
				<img src="images/opd.jpg" alt="OPD"> 
				<p>OPD</p>
			</div>
			<div class="service-card">
				<img src="images/icu.jpg" alt="ICU"> 
				<p>ICU</p>
			</div>
			<div class="service-card">
				<img src="images/diagnostics.jpg" alt="Diagnostics"> 
				<p>Diagnostics</p>
			</div>
			<div class="service-card">
				<img src="images/pharmacy.jpg" alt="Pharmacy"> 
				<p>Pharmacy</p>
			</div>
			<div class="service-card">
				<img src="images/Emergency.jpg" alt="Emergency"> 
				<p>Emergency</p>
			</div>
		</div>
	</section>



	<!-- Specialities Section -->
	<section id="specialities" class="py-5 bg-light">
		<div class="container">
			<h2 class="text-center mb-5">Our Specialities</h2>
			<div class="row g-4">
				<%-- Cards for Specialities --%>
				<%
				String[][] specialities = {{"Cardiology",
						"Comprehensive heart care services including diagnostics, interventions, and rehabilitation by expert cardiologists.",
						"https://example.com/cardiology.jpg"},
						{"Neurology",
						"Advanced treatment for neurological disorders with state-of-the-art technology and skilled specialists.",
						"https://example.com/neurology.jpg"},
						{"Orthopedics",
						"Expert care for bone, joint, and spine-related issues, offering both surgical and non-surgical treatments.",
						"https://example.com/orthopedics.jpg"},
						{"Pediatrics",
						"Dedicated child care services covering preventive, diagnostic, and therapeutic needs for infants to teens.",
						"https://example.com/pediatrics.jpg"},
						{"Oncology",
						"Comprehensive cancer care with multidisciplinary approach, advanced treatments, and compassionate support.",
						"https://example.com/oncology.jpg"},
						{"Gynecology", "Complete women’s health services from maternity care to advanced gynecological surgeries.",
						"https://example.com/gynecology.jpg"},
						{"Dermatology",
						"Specialized skin care treatments for various dermatological conditions using the latest technologies.",
						"https://example.com/dermatology.jpg"},
						{"Nephrology",
						"Advanced kidney care services, including dialysis and transplant support by expert nephrologists.",
						"https://example.com/nephrology.jpg"}};
				for (String[] speciality : specialities) {
				%>
				<div class="col-md-3">
					<div class="card h-100 shadow-sm speciality-card"
						style="background-image: url('<%=speciality[2]%>');">
						<div class="card-body text-center text-white">
							<h5 class="card-title"><%=speciality[0]%></h5>
							<p class="card-text"><%=speciality[1]%></p>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>

	<!-- Testimonials -->
	<section id="testimonials" class=" py-5 bg-light">
		<div class="container">
			<h2 class="text-center mb-4">What Our Patients Say</h2>
			<div class="testimonial-slider">
				<div class="testimonial">
					<img src="images/patient1.jpg" alt="Patient">
					<p>"The doctors are professional and caring. Highly recommend
						this hospital!"</p>
				</div>
				<div class="testimonial">
					<img src="images/patient2.jpg" alt="Patient">
					<p>"Excellent service and a clean environment. I felt safe and
						well cared for."</p>
				</div>
				<div class="testimonial">
					<img src="images/patient3.jpg" alt="Patient">
					<p>"Booking appointments online made it so easy. Thank you for
						the smooth experience!"</p>
				</div>
				<div class="testimonial">
					<img src="images/patient4.jpg" alt="Thumbs up patient">
					<p>"State-of-the-art facilities and a very warm staff. Truly
						top-notch."</p>
				</div>
				<div class="testimonial">
					<img src="images/patient5.jpg" alt="Young woman">
					<p>"I was nervous about surgery, but the staff made me feel so
						comfortable. Thank you!"</p>
				</div>
				<div class="testimonial">
					<img src="images/patient6.jpg" alt="Senior patient">
					<p>"The personalized care I received exceeded all my
						expectations."</p>
				</div>
				<div class="testimonial">
					<img src="images/patient7.jpg" alt="Middle-aged man">
					<p>"Prompt service and compassionate doctors made my recovery
						smooth."</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Container for FAQ and Map -->
	<div class="faq-map-container">
		<!-- FAQs -->
		<section class="faq">
			<h2>Frequently Asked Questions</h2>
			<div class="faq-item">
				<div class="faq-question">Do you accept insurance?</div>
				<div class="faq-answer">Yes, we accept a wide range of
					insurance providers. Please check with our reception for details.</div>
			</div>
			<div class="faq-item">
				<div class="faq-question">How do I book a consultation?</div>
				<div class="faq-answer">You can book a consultation via our
					website, mobile app, or by calling our front desk.</div>
			</div>
			<div class="faq-item">
				<div class="faq-question">Are emergency services available
					24/7?</div>
				<div class="faq-answer">Absolutely. We have a dedicated
					emergency wing that's operational 24/7 for all urgent needs.</div>
			</div>
			<div class="faq-item">
				<div class="faq-question">Can I consult with a specialist
					directly?</div>
				<div class="faq-answer">Yes, you can choose a specialist from
					our list and book an appointment based on availability.</div>
			</div>
			<div class="faq-item">
				<div class="faq-question">Do you offer online consultations?</div>
				<div class="faq-answer">Yes, we offer telehealth consultations
					for select services. You can book these via our app or website.</div>
			</div>
		</section>

		<!-- Map -->
<div class="map-section">
	<h2>Find Us</h2>
	<iframe
		src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3890.233006031882!2d77.61161287508368!3d12.916289887390692!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae15c5da18d24b%3A0x62e3cf68199a27b1!2sPentagon%20Space%20-%20BTM%20layout!5e0!3m2!1sen!2sin!4v1717938328003!5m2!1sen!2sin"
		width="100%" height="300" style="border:0;" allowfullscreen=""
		loading="lazy" referrerpolicy="no-referrer-when-downgrade">
	</iframe>
</div>





	<!-- Floating Enquire Button -->
	<button id="enquireBtn" class="floating-btn">Enquire Now</button>

	<!-- Enquiry Modal -->
	<div id="enquiryModal" class="enquiry-modal">
		<div class="enquiry-modal-content">
			<span class="close-btn">&times;</span>
			<h2>
				Do you have a <span>Question?</span>
			</h2>
			<p>We're happy to help! Please fill out the form below.</p>
			<form action="submitEnquiry.jsp" method="post"
				onsubmit="return validateEnquiryForm()">
				<input type="text" name="name" placeholder="Your Name" required>
				<input type="email" name="email" placeholder="Your Email" required>
				<textarea name="message" rows="4" placeholder="Your Message"
					required></textarea>
				<button type="submit" class="submit-btn">Submit Enquiry</button>
			</form>
		</div>
	</div>


	<button id="scrollTopBtn" aria-label="Scroll to top">⬆</button>

	<%@ include file="footer.jsp"%>
	<script>
  const track = document.getElementById("carouselTrack");
  const dotsContainer = document.getElementById("dots");
  const slides = document.querySelectorAll(".slide");
  let index = 0;

  // Create dots
  slides.forEach((_, i) => {
    const dot = document.createElement("span");
    dot.addEventListener("click", () => moveToSlide(i));
    dotsContainer.appendChild(dot);
  });

  function updateDots() {
    document.querySelectorAll("#dots span").forEach((dot, i) => {
      dot.classList.toggle("active", i === index);
    });
  }

  function moveToSlide(i) {
    index = (i + slides.length) % slides.length;
    track.style.transform = `translateX(-${index * 100}%)`;
    updateDots();
  }

  function moveSlide(step) {
    moveToSlide(index + step);
  }

  // Auto-scroll every 15 seconds
  setInterval(() => moveSlide(1), 15000);

  updateDots(); // Initialize

  const bgImages = [
    'images/bg1.jpg',
    'images/bg2.jpg',
    'images/bg3.jpg'
  ];

  const bgMessages = [
    "Caring for You with Compassion and Commitment",
    "Your Health is Our Top Priority",
    "Trusted Healthcare for Every Step of Your Journey",
    "Together, We Heal. Together, We Thrive.",
    "Because Every Life Deserves the Best Care"
  ];

  let bgIndex = 0;
  const bgSlideshow = document.getElementById('backgroundSlideshow');
  const slideshowMessage = document.getElementById('slideshowMessage');

  function typeMessage(message, index = 0) {
    if (index < message.length) {
      slideshowMessage.textContent += message.charAt(index);
      setTimeout(() => typeMessage(message, index + 1), 50);
    }
  }

  function changeBackgroundImage() {
    const image = bgImages[bgIndex % bgImages.length];
    const message = bgMessages[bgIndex % bgMessages.length];

    bgSlideshow.style.backgroundImage = `url('${image}')`;
    slideshowMessage.textContent = '';
    typeMessage(message);
    bgIndex++;
  }

  window.addEventListener('load', changeBackgroundImage);
  setInterval(changeBackgroundImage, 6000); // 6s interval for better readability
  
  

// Function to animate each counter
function animateCounters() {
  const counters = document.querySelectorAll('.counter h3');

  counters.forEach(counter => {
    const target = +counter.getAttribute('data-target');
    const duration = 2000;
    const increment = target / (duration / 20);
    let count = 0;

    const updateCounter = () => {
      count += increment;
      if (count >= target) {
        counter.innerText = target;
      } else {
        counter.innerText = Math.ceil(count);
        requestAnimationFrame(updateCounter);
      }
    };

    updateCounter();
  });
}

// Intersection Observer to trigger animation when visible
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      animateCounters();
      observer.disconnect(); // Run only once
    }
  });
}, {
  threshold: 0.5
});

observer.observe(document.querySelector('#stats'));


  // FAQ Toggle
  function toggleAnswer(el) {
    const answer = el.nextElementSibling;
    answer.style.display = answer.style.display === 'none' ? 'block' : 'none';
  }

  
  const enquireBtn = document.getElementById("enquireBtn");
  const enquiryModal = document.getElementById("enquiryModal");
  const closeBtn = document.querySelector(".close-btn");

  enquireBtn.onclick = () => enquiryModal.style.display = "flex";
  closeBtn.onclick = () => enquiryModal.style.display = "none";
  window.onclick = (e) => {
    if (e.target === enquiryModal) {
      enquiryModal.style.display = "none";
    }
  };

  function validateEnquiryForm() {
	  const name = document.querySelector("input[name='name']").value.trim();
	  const email = document.querySelector("input[name='email']").value.trim();
	  const message = document.querySelector("textarea[name='message']").value.trim();

	  if (!name || !email || !message) {
	    alert("Please fill in all fields.");
	    return false;
	  }
	  return true;
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
