<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Hospital Management System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f0f0f0;
      overflow-x: hidden;
    }

    header {
      background-color: #0077b5;
      color: white;
      padding: 2rem 1rem;
      text-align: center;
    }

    .background-slideshow {
      height: 100vh;
      width: 100%;
      background-size: cover;
      background-position: center;
      transition: background-image 1s ease-in-out;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      text-align: center;
      padding: 2rem;
    }

    .message-overlay {
      background: rgba(0, 0, 0, 0.5);
      padding: 1.5rem 2rem;
      border-radius: 12px;
      color: #fff;
      animation: fadeIn 1s ease-in-out;
      max-width: 90%;
    }

    .message-overlay h2 {
      font-size: clamp(1.5rem, 4vw, 2.5rem);
      font-weight: 600;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .carousel-container {
      max-width: 1000px;
      margin: 2rem auto;
      overflow: hidden;
      position: relative;
      user-select: none;
      cursor: grab;
      padding: 0 1rem;
    }

    .carousel-track {
      display: flex;
      transition: transform 0.3s ease-in-out;
      will-change: transform;
    }

    .slide {
      min-width: 100%;
      padding: 0.5rem;
      box-sizing: border-box;
    }

    video {
      width: 100%;
      height: auto;
      aspect-ratio: 16 / 9;
      border-radius: 10px;
    }

    .dots {
      text-align: center;
      margin: 1rem 0;
    }

    .dot {
      height: 12px;
      width: 12px;
      margin: 0 6px;
      background-color: #bbb;
      border-radius: 50%;
      display: inline-block;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .dot.active {
      background-color: #0077b5;
    }

    @media (max-width: 600px) {
      .carousel-container {
        padding: 0;
      }

      video {
        aspect-ratio: 4;
      }
    }
    .cta-section {
  display: flex;
  justify-content: center;
  margin: 30px auto 10px;
}

.cta-section button {
  background-color: #0077b5;
  color: white;
  font-size: 1.1rem;
  padding: 12px 24px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.cta-section button:hover {
  background-color: #005f91;
  transform: scale(1.05);
}.cta-section {
  display: flex;
  justify-content: center;
  gap: 20px;
  flex-wrap: wrap;
  margin: 20px 0;
}

.cta-button {
  background-color: #0077b5;
  color: white;
  padding: 14px 28px;
  font-size: 1.1rem;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  box-shadow: 0 4px 12px rgba(0,0,0,0.2);
  transition: background-color 0.3s ease, transform 0.2s ease;
}

.cta-button:hover {
  background-color: #005e94;
  transform: translateY(-2px);
}

.cta-button.secondary {
  background-color: #28a745;
}

.cta-button.secondary:hover {
  background-color: #218838;
}

@media (max-width: 500px) {
  .cta-section {
    flex-direction: column;
    align-items: center;
  }
  .cta-button {
    width: 90%;
    margin-bottom: 10px;
    font-size: 1rem;
  }
}


section {
      padding: 40px 20px;
      text-align: center;
    }

    h2 {
      color: #0077b5;
    }

    .counters {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 30px;
      margin-top: 20px;
    }

    .counter {
      background: white;
      padding: 20px;
      border-radius: 10px;
      width: 200px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .counter h3 {
      font-size: 2em;
      color: #0077b5;
      margin: 10px 0 5px;
    }

    .testimonials {
      background-color: #fff;
      padding: 40px 20px;
    }

    .testimonial-slider {
      display: flex;
      overflow-x: auto;
      scroll-snap-type: x mandatory;
      gap: 20px;
      padding: 20px;
    }

    .testimonial {
      flex: 0 0 300px;
      background: #e8f4fb;
      border-radius: 10px;
      padding: 20px;
      scroll-snap-align: start;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .testimonial img {
      width: 50px;
      border-radius: 50%;
    }

    .faq {
      max-width: 800px;
      margin: 0 auto;
      text-align: left;
    }

    .faq-item {
      background: white;
      border: 1px solid #ccc;
      border-radius: 8px;
      margin-bottom: 10px;
      overflow: hidden;
    }

    .faq-question {
      padding: 15px;
      background: #0077b5;
      color: white;
      cursor: pointer;
    }

    .faq-answer {
      display: none;
      padding: 15px;
    }

    .faq-item.open .faq-answer {
      display: block;
    }
    /* Header inner flex & hamburger */
.header-inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.hamburger {
  display: none;
  flex-direction: column;
  gap: 5px;
  background: none;
  border: none;
  cursor: pointer;
  padding: 8px;
}

.hamburger span {
  display: block;
  width: 25px;
  height: 3px;
  background-color: white;
  border-radius: 2px;
}

/* Mobile Nav */
.mobile-nav {
  position: fixed;
  top: 0;
  right: -250px;
  width: 250px;
  height: 100vh;
  background-color: #0077b5;
  box-shadow: -2px 0 6px rgba(0,0,0,0.3);
  padding-top: 60px;
  transition: right 0.3s ease-in-out;
  z-index: 1000;
}

.mobile-nav.open {
  right: 0;
}

.mobile-nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.mobile-nav ul li {
  margin: 20px 0;
}

.mobile-nav ul li a {
  color: white;
  text-decoration: none;
  font-size: 1.2rem;
  padding: 10px 20px;
  display: block;
}

/* Services Cards */
.services-cards {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 23px;
  margin-top: 20px;
}

.service-card {
  background: white;
  border-radius: 12px;
  width: 200px;
  height: 200px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-size: 1.9rem;
  color: #0077b5;
  cursor: pointer;
  user-select: none;
  transition: transform 0.2s ease;
}

.service-card:hover {
  transform: scale(1.1);
}

/* Show hamburger on small screens */
@media (max-width: 768px) {
  .hamburger {
    display: flex;
  }

  .mobile-nav {
    display: block;
  }

  nav:not(.mobile-nav) {
    display: none;
  }
}
:root {
  --bg-color: #fff;
  --text-color: #222;
  --primary-color: #0077b5;
}

body {
  background-color: var(--bg-color);
  color: var(--text-color);
  transition: background-color 0.3s, color 0.3s;
}

body.dark-mode {
  --bg-color: #121212;
  --text-color: #ddd;
  --primary-color: #0d95e8;
}

#scrollTopBtn {
  position: fixed;
  bottom: 30px;
  right: 30px;
  background: var(--primary-color);
  color: white;
  border: none;
  border-radius: 50%;
  padding: 12px 15px;
  font-size: 24px;
  cursor: pointer;
  display: none;
  z-index: 1000;
  transition: background-color 0.3s;
}

#scrollTopBtn:hover {
  background: #005fa3;
}

  </style>
</head>
<body>

<header>
  <div class="header-inner">
    <h1>Hospital Management System</h1>
    <button class="hamburger" id="hamburger" aria-label="Toggle menu">
      <span></span>
      <span></span>
      <span></span>
    </button>
  </div>
  <nav class="mobile-nav" id="mobileNav">
    <ul>
      <li><a href="#stats">Achievements</a></li>
      <li><a href="#services">Services</a></li>
      <li><a href="#testimonials">Testimonials</a></li>
      <li><a href="#faq">FAQs</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
  </nav>
  <p>Swipe or click dots to navigate video presentations</p>
  
</header>


<!-- Background Slideshow -->
<div class="background-slideshow" id="backgroundSlideshow">
  <div class="message-overlay">
    <h2 id="slideshowMessage">Welcome to Our Hospital</h2>
    
  </div>
  <div class="cta-section">
  <button onclick="handleBooking()" class="cta-button">Book an Appointment</button>
  <button onclick="handleFindDoctor()" class="cta-button secondary">Find a Doctor</button>
</div>

</div>


<!-- Video Carousel -->
<div class="carousel-container" id="carousel">
  <div class="carousel-track" id="carouselTrack">
    <div class="slide"><video src="videos/video1.mp4" autoplay muted loop playsinline></video></div>
    <div class="slide"><video src="videos/video2.mp4" autoplay muted loop playsinline></video></div>
    <div class="slide"><video src="videos/video3.mp4" autoplay muted loop playsinline></video></div>
    <div class="slide"><video src="videos/video4.mp4" autoplay muted loop playsinline></video></div>
    <div class="slide"><video src="videos/video5.mp4" autoplay muted loop playsinline></video></div>
  </div>
</div>

<div class="dots" id="dots"></div>
<!-- Animated Counters -->
<section id="stats">
  <h2>Our Achievements</h2>
  <div class="counters">
    <div class="counter"><h3 data-target="5000">0</h3><p>Patients Served</p></div>
    <div class="counter"><h3 data-target="100">0</h3><p>Doctors</p></div>
    <div class="counter"><h3 data-target="24">0</h3><p>24/7 Support</p></div>
   <div class="counter"><h3 data-target="50">0</h3><p>Awards Won</p></div>
  </div>
</section>
<section id="services">
  <h2>Our Services</h2>
  <div class="services-cards">
    <div class="service-card">🏥<br>OPD</div>
    <div class="service-card">🛏<br>ICU</div>
    <div class="service-card">🔬<br>Diagnostics</div>
    <div class="service-card">💊<br>Pharmacy</div>
    <div class="service-card">🚑<br>Emergency</div>
  </div>
</section>

<!-- Testimonials -->
<section class="testimonials">
  <h2>What Our Patients Say</h2>
  <div class="testimonial-slider">
    <div class="testimonial">
      <img src="images/patient1.jpg" alt="Patient">
      <p>"The doctors are professional and caring. Highly recommend this hospital!"</p>
    </div>
    <div class="testimonial">
      <img src="images/patient2.jpg" alt="Patient">
      <p>"Excellent service and a clean environment. I felt safe and well cared for."</p>
    </div>
    <div class="testimonial">
      <img src="images/patient3.jpg" alt="Patient">
      <p>"Booking appointments online made it so easy. Thank you for the smooth experience!"</p>
    </div>
    <div class="testimonial">
      <img src="images/patient4.jpg" alt="Patient showing thumbs up">
      <p>"State-of-the-art facilities and a very warm staff. Truly top-notch."</p>
    </div>
    <div class="testimonial">
      <img src="images/patient5.jpg" alt="Young woman giving testimonial">
      <p>"I was nervous about surgery, but the staff made me feel so comfortable. Thank you!"</p>
    </div>
    <div class="testimonial">
      <img src="images/patient6.jpg" alt="Senior patient smiling">
      <p>"The personalized care I received exceeded all my expectations."</p>
    </div>
    <div class="testimonial">
      <img src="images/patient7.jpg" alt="Middle-aged man happy">
      <p>"Prompt service and compassionate doctors made my recovery smooth."</p>
    </div>
  </div>
</section>

<!-- FAQs -->
<section class="faq">
  <h2>Frequently Asked Questions</h2>
  <div class="faq-item">
    <div class="faq-question">Do you accept insurance?</div>
    <div class="faq-answer">Yes, we accept a wide range of insurance providers. Please check with our reception for details.</div>
  </div>
  <div class="faq-item">
    <div class="faq-question">How do I book a consultation?</div>
    <div class="faq-answer">You can book a consultation via our website, mobile app, or by calling our front desk.</div>
  </div>
  <div class="faq-item">
    <div class="faq-question">Are emergency services available 24/7?</div>
    <div class="faq-answer">Absolutely. We have a dedicated emergency wing that's operational 24/7 for all urgent needs.</div>
  </div>
  <div class="faq-item">
    <div class="faq-question">Can I consult with a specialist directly?</div>
    <div class="faq-answer">Yes, you can choose a specialist from our list and book an appointment based on availability.</div>
  </div>
  <div class="faq-item">
    <div class="faq-question">Do you offer online consultations?</div>
    <div class="faq-answer">Yes, we offer telehealth consultations for select services. You can book these via our app or website.</div>
  </div>
</section>
<section id="location">
  <h2>Find Us</h2>
  <iframe 
    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.019869927301!2d-122.41941548468104!3d37.7749297797597!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8085815cd7e879a3%3A0x8b57c4b4b8d46e3a!2sYour%20Hospital%20Name!5e0!3m2!1sen!2sus!4v1684500000000!5m2!1sen!2sus" 
    width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</section>
<button id="scrollTopBtn" aria-label="Scroll to top">⬆</button>

<!-- JavaScript -->
<script>
  // Background Slideshow
  const bgImages = ['images/bg1.jpg', 'images/bg2.jpg', 'images/bg3.jpg'];
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

  function changeBackgroundImage() {
    bgSlideshow.style.backgroundImage = url('${bgImages[bgIndex % bgImages.length]}');
    slideshowMessage.textContent = bgMessages[bgIndex % bgMessages.length];
    bgIndex++;
  }

  setInterval(changeBackgroundImage, 4000);
  window.addEventListener('load', changeBackgroundImage);

  // Carousel
  const track = document.getElementById('carouselTrack');
  const container = document.getElementById('carousel');
  const dotsContainer = document.getElementById('dots');
  const slides = Array.from(track.children);
  const slideCount = slides.length;

  let currentIndex = 0;
  let startX = 0;
  let currentTranslate = 0;
  let prevTranslate = 0;
  let animationID;
  let isDragging = false;

  for (let i = 0; i < slideCount; i++) {
    const dot = document.createElement('span');
    dot.classList.add('dot');
    if (i === 0) dot.classList.add('active');
    dot.addEventListener('click', () => goToSlide(i));
    dotsContainer.appendChild(dot);
  }
  const dots = Array.from(dotsContainer.children);

  function updateSlidePosition() {
    const slideWidth = container.clientWidth;
    currentTranslate = -currentIndex * slideWidth;
    prevTranslate = currentTranslate;
    setSliderPosition(currentTranslate);
    updateDots();
  }

  function updateDots() {
    dots.forEach(dot => dot.classList.remove('active'));
    dots[currentIndex].classList.add('active');
  }

  function goToSlide(index) {
    if (index < 0) index = 0;
    else if (index >= slideCount) index = slideCount - 1;
    currentIndex = index;
    updateSlidePosition();
  }

  function setSliderPosition(position) {
    track.style.transform = translateX(${position}px);
  }

  function getPositionX(event) {
    return event.type.includes('mouse') ? event.pageX : event.touches[0].clientX;
  }

  function animation() {
    setSliderPosition(currentTranslate);
    if (isDragging) requestAnimationFrame(animation);
  }

  function touchStart(event) {
    isDragging = true;
    startX = getPositionX(event);
    animationID = requestAnimationFrame(animation);
    container.style.cursor = 'grabbing';
  }

  function touchMove(event) {
    if (!isDragging) return;
    const currentX = getPositionX(event);
    const diff = currentX - startX;
    currentTranslate = prevTranslate + diff;
  }

  function touchEnd() {
    cancelAnimationFrame(animationID);
    isDragging = false;
    container.style.cursor = 'grab';

    const slideWidth = container.clientWidth;
    const movedBy = currentTranslate - prevTranslate;

    if (movedBy < -50 && currentIndex < slideCount - 1) {
      currentIndex++;
    } else if (movedBy > 50 && currentIndex > 0) {
      currentIndex--;
    }
    updateSlidePosition();
    prevTranslate = currentTranslate;
  }
// Background Slideshow (already done above)

// Carousel (continuing your code)
container.addEventListener('touchstart', touchStart);
container.addEventListener('touchmove', touchMove);
container.addEventListener('touchend', touchEnd);
container.addEventListener('mousedown', touchStart);
container.addEventListener('mousemove', touchMove);
container.addEventListener('mouseup', touchEnd);
container.addEventListener('mouseleave', () => {
  if (isDragging) touchEnd();
});

// Hamburger menu toggle
const hamburger = document.getElementById('hamburger');
const mobileNav = document.getElementById('mobileNav');

hamburger.addEventListener('click', () => {
  mobileNav.classList.toggle('open');
});



// Scroll to top button
const scrollTopBtn = document.getElementById('scrollTopBtn');
window.addEventListener('scroll', () => {
  if (window.scrollY > 300) {
    scrollTopBtn.style.display = 'block';
  } else {
    scrollTopBtn.style.display = 'none';
  }
});
scrollTopBtn.addEventListener('click', () => {
  window.scrollTo({ top: 0, behavior: 'smooth' });
});

// Animated Counters
const counters = document.querySelectorAll('.counter h3');
const speed = 200; // lower is faster

function animateCounters() {
  counters.forEach(counter => {
    const updateCount = () => {
      const target = +counter.getAttribute('data-target');
      const count = +counter.innerText;

      const increment = Math.ceil(target / speed);
      if (count < target) {
        counter.innerText = count + increment > target ? target : count + increment;
        setTimeout(updateCount, 20);
      } else {
        counter.innerText = target;
      }
    };
    updateCount();
  });
}

// Trigger counters when section is visible
let countersStarted = false;
window.addEventListener('scroll', () => {
  const statsSection = document.getElementById('stats');
  const sectionTop = statsSection.getBoundingClientRect().top;
  const windowHeight = window.innerHeight;

  if (!countersStarted && sectionTop < windowHeight) {
    animateCounters();
    countersStarted = true;
  }
});

// FAQ accordion toggle
const faqItems = document.querySelectorAll('.faq-item');

faqItems.forEach(item => {
  const question = item.querySelector('.faq-question');
  question.addEventListener('click', () => {
    item.classList.toggle('open');
  });
});

// CTA Button handlers (you can expand these)
function handleBooking() {
  alert('Redirecting to appointment booking system (placeholder)');
}

function handleFindDoctor() {
  alert('Redirecting to doctor search system (placeholder)');
}



</script>

</body>
</html>