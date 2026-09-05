/* ==========================================================================
   VINIT ENTERPRISE - INTERACTIVE JAVASCRIPT LOGIC
   ========================================================================== */

document.addEventListener('DOMContentLoaded', () => {
  // DOM Elements
  const header = document.getElementById('main-header');
  const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
  const navMenu = document.getElementById('nav-menu');
  const navLinks = document.querySelectorAll('.nav-link');
  const viewNavBtns = document.querySelectorAll('.view-nav-btn');
  const viewSections = document.querySelectorAll('.view-section');

  // Modals
  const quoteModal = document.getElementById('quote-modal');
  const quoteModalClose = document.getElementById('quote-modal-close');
  const quoteForm = document.getElementById('quote-form');
  const quoteProductName = document.getElementById('quote-product-name');

  const productModal = document.getElementById('product-modal');
  const productModalClose = document.getElementById('product-modal-close');
  const productModalBody = document.getElementById('product-modal-body');

  const contactForm = document.getElementById('contact-form');
  const toastNotify = document.getElementById('toast-notify');
  const toastMessage = document.getElementById('toast-message');
  const whatsappBtn = document.getElementById('whatsapp-btn');

  // Product Database for Modals
  const productData = {
    'milk-analyzer': {
      title: 'Ultrasonic Milk Analyzer',
      category: 'Milk Testing Equipment',
      image: 'assets/milk_analyzer.jpg',
      overview: 'Vinit Enterprise Ultrasonic Milk Analyzer is designed for rapid, non-chemical composition analysis of raw cow, buffalo, and mixed milk samples. It provides high precision results in under 30 seconds, making it ideal for daily milk collection centers and dairy labs.',
      specs: [
        { label: 'Measuring Speed', value: '30 - 40 seconds per sample' },
        { label: 'Fat Range', value: '0.01% to 12.00% (Accuracy ±0.06%)' },
        { label: 'SNF Range', value: '3.00% to 15.00% (Accuracy ±0.15%)' },
        { label: 'Density Range', value: '1015 to 1040 kg/m³' },
        { label: 'Added Water Range', value: '0% to 70%' },
        { label: 'Sample Volume', value: '12 mL to 15 mL' },
        { label: 'Data Output', value: 'RS232 Interface / USB Serial Port' },
        { label: 'Power Supply', value: '12V DC / 220V AC with Battery Backup' }
      ],
      features: [
        'High reliability ultrasonic measurement probe with automatic cleaning prompt',
        'Built-in memory to store up to 500 testing records',
        'Compact stainless steel corrosion-resistant chassis',
        'Direct interface with electronic weighing scales and thermal printers'
      ],
      applications: 'Milk Collection Centers, Dairy Cooperatives, Raw Milk Purchasing Facilities, Dairy Testing Laboratories.'
    },

    'amcu': {
      title: 'Automatic Milk Collection Unit (AMCU)',
      category: 'Integrated Collection Kiosk',
      image: 'assets/automatic_milk_collection_unit.jpg',
      overview: 'The Vinit Enterprise AMCU is an all-in-one automated collection terminal that integrates the milk weighing scale, ultrasonic analyzer, member smart card reader, and thermal slip printer into a single streamlined system.',
      specs: [
        { label: 'System Hardware', value: 'Embedded Microcontroller / Industrial PC' },
        { label: 'Printer Type', value: 'High-speed 2-inch Thermal Slip Printer' },
        { label: 'Display Screen', value: '7-inch High Contrast Color LCD Display' },
        { label: 'Card Reader', value: 'Contactless RFID Member Card Scanner' },
        { label: 'Connectivity', value: 'GSM/GPRS Cloud Gateway, USB, RS232' },
        { label: 'Rate Chart Storage', value: 'Up to 50 Custom Rate Charts' }
      ],
      features: [
        'Instant slip printout with Farmer ID, Weight, Fat %, SNF %, and Total Amount',
        'Zero manual tampering — direct automated measurement transfer',
        'Rugged food-grade stainless steel bowl platform included',
        'Automatic data synchronization to central cooperative cloud server'
      ],
      applications: 'Village Milk Collection Centers, Dairy Unions, Private Milk Procurement Hubs.'
    },

    'dpu-collection': {
      title: 'Data Processing Milk Collection Unit (DPU)',
      category: 'Data Management System',
      image: 'assets/automatic_milk_collection_unit.jpg',
      overview: 'A specialized heavy-duty data processing unit built for dairy cooperative societies to manage daily morning and evening shift transactions with instant member ledger reporting.',
      specs: [
        { label: 'Memory Capacity', value: 'Stores up to 10,000 transaction records' },
        { label: 'Keyboard', value: 'Waterproof Dustproof Industrial Keypad' },
        { label: 'Display', value: 'Multi-lingual Graphic Display (English / Hindi / Regional)' },
        { label: 'Power Input', value: '160V - 270V AC with in-built Battery Charger' }
      ],
      features: [
        'Automatic calculation of member payments based on fat/SNF rate matrix',
        'Shift summary reporting and monthly member payment statements',
        'Pen-drive data backup export facility'
      ],
      applications: 'Cooperative Milk Societies, Chilling Centers, Milk Purchasing Units.'
    },

    'weighing-system': {
      title: 'Electronic Milk Weighing System',
      category: 'Industrial Weighing Platform',
      image: 'assets/milk_weighing_system.jpg',
      overview: 'Heavy-duty industrial milk weighing scale featuring a food-grade stainless steel bowl and wall-mountable LED indicator, engineered for harsh dairy washing environments.',
      specs: [
        { label: 'Available Capacities', value: '100 kg / 200 kg / 500 kg' },
        { label: 'Accuracy Class', value: 'Class III High Accuracy Load Cell' },
        { label: 'Bowl Material', value: 'SS-304 Food-Grade Stainless Steel' },
        { label: 'Indicator Display', value: '1-inch Bright Red LED Digital Display' },
        { label: 'Protection Rating', value: 'IP65 Waterproof Load Cell Housing' }
      ],
      features: [
        'Fast response time with tare/zero facility',
        'Heavy-gauge stainless steel base frame resisting corrosion',
        'Direct serial output interface to AMCU & Data Processing Units'
      ],
      applications: 'Milk Reception Counters, Chilling Plants, Processing Factories.'
    },

    'milk-stirrer': {
      title: 'Ultrasonic Milk Stirrer',
      category: 'Sample Preparation Instrument',
      image: 'assets/ultrasonic_milk_stirrer.jpg',
      overview: 'Essential pre-testing device that uses high-frequency ultrasonic waves to quickly de-aerate raw milk samples, removing trapped air bubbles to guarantee accurate analyzer readings.',
      specs: [
        { label: 'Operating Frequency', value: '40 kHz High Power Ultrasonic Cavitation' },
        { label: 'Stirring Duration', value: 'Programmable Auto-Timer (5 to 10 seconds)' },
        { label: 'Probe Material', value: 'Titanium / SS-316 Ultrasonic Transducer' },
        { label: 'Beaker Compatibility', value: 'Standard 100mL to 250mL Sample Beakers' }
      ],
      features: [
        'Prevents falsely low fat/SNF readings caused by air bubbles',
        'Quiet, maintenance-free solid-state ultrasonic generator',
        'Adjustable beaker stand height'
      ],
      applications: 'Milk Testing Bench Counters, Quality Control Labs.'
    },

    'dairy-automation': {
      title: 'Dairy Automation System Panel',
      category: 'Plant Automation & Control',
      image: 'assets/dairy_automation_system.jpg',
      overview: 'Custom-engineered PLC automation panel with HMI touchscreen interface designed to monitor and automate chilling tanks, pasteurization lines, and pump valves.',
      specs: [
        { label: 'PLC Hardware', value: 'Industrial Grade Programmable Logic Controller' },
        { label: 'HMI Screen', value: '7-inch / 10-inch Color Touchscreen Display' },
        { label: 'Enclosure Material', value: 'SS-304 / Powder-Coated IP65 Enclosure' },
        { label: 'Temperature Sensors', value: 'RTD Pt100 High Precision Sensors' }
      ],
      features: [
        'Real-time temperature, flow rate, and storage level monitoring',
        'Automatic audio-visual safety alarms and emergency shutdown',
        'Data logging and process trend graph history display'
      ],
      applications: 'Milk Processing Plants, Bulk Milk Coolers (BMC), Pasteurization Units.'
    }
  };

  // 1. Navigation View Switching Logic
  function switchView(viewId) {
    // Hide all views
    viewSections.forEach(sec => sec.classList.remove('active-view'));

    // Show target view
    const targetSection = document.getElementById(`view-${viewId}`);
    if (targetSection) {
      targetSection.classList.add('active-view');
    } else {
      document.getElementById('view-home').classList.add('active-view');
    }

    // Update active nav link
    navLinks.forEach(link => {
      if (link.dataset.view === viewId) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });

    // Close mobile menu if open
    navMenu.classList.remove('active');

    // Scroll to top smoothly
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  // Click listeners for nav links
  navLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      const view = link.dataset.view;
      if (view) switchView(view);
    });
  });

  // Click listeners for general view buttons
  viewNavBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      const view = btn.dataset.view;
      if (view) switchView(view);
    });
  });

  // 2. Sticky Header Scroll Effect
  window.addEventListener('scroll', () => {
    if (window.scrollY > 40) {
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  });

  // 3. Mobile Menu Toggle
  if (mobileMenuToggle) {
    mobileMenuToggle.addEventListener('click', () => {
      navMenu.classList.toggle('active');
    });
  }

  // 4. Product Catalog Filtering Logic
  const filterBtns = document.querySelectorAll('.filter-btn');
  const catalogCards = document.querySelectorAll('#catalog-grid .product-card');

  filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      filterBtns.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      const filter = btn.dataset.filter;

      catalogCards.forEach(card => {
        if (filter === 'all' || card.dataset.category === filter) {
          card.style.display = 'flex';
        } else {
          card.style.display = 'none';
        }
      });
    });
  });

  // 5. Product Specs Modal Handler
  document.addEventListener('click', (e) => {
    if (e.target.classList.contains('open-product-detail')) {
      const productId = e.target.dataset.id;
      const data = productData[productId];

      if (data) {
        let specsHtml = data.specs.map(s => `
          <div style="display: flex; justify-content: space-between; padding: 0.5rem 0; border-bottom: 1px dashed var(--border-color); font-size: 0.9rem;">
            <strong style="color: var(--primary);">${s.label}:</strong>
            <span style="color: var(--text-muted); text-align: right;">${s.value}</span>
          </div>
        `).join('');

        let featuresHtml = data.features.map(f => `
          <li style="margin-bottom: 0.4rem; font-size: 0.9rem; color: var(--text-main); display: flex; gap: 0.5rem; align-items: flex-start;">
            <i class="fa-solid fa-circle-check" style="color: var(--accent-green); margin-top: 4px;"></i> ${f}
          </li>
        `).join('');

        productModalBody.innerHTML = `
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; align-items: start; margin-top: 1rem;">
            <div>
              <img src="${data.image}" alt="${data.title}" style="width: 100%; border-radius: var(--radius-md); border: 1px solid var(--border-color);">
              <span style="display: inline-block; margin-top: 1rem; background: var(--royal-blue-light); color: var(--royal-blue); padding: 0.25rem 0.75rem; border-radius: var(--radius-full); font-size: 0.8rem; font-weight: 700;">
                ${data.category}
              </span>
            </div>
            <div>
              <h2 style="font-size: 1.6rem; color: var(--primary); font-weight: 800; margin-bottom: 0.5rem;">${data.title}</h2>
              <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 1.25rem; line-height: 1.5;">${data.overview}</p>
              
              <h4 style="font-size: 1rem; color: var(--primary); margin-bottom: 0.5rem;">Key Benefits & Features</h4>
              <ul style="list-style: none; margin-bottom: 1.5rem;">${featuresHtml}</ul>

              <div style="display: flex; gap: 0.75rem; margin-top: 1.5rem;">
                <button class="btn btn-primary open-quote-modal" data-product="${data.title}" style="flex: 1;">
                  <i class="fa-solid fa-paper-plane"></i> Enquire Now
                </button>
                <button class="btn btn-secondary download-brochure-btn" style="flex: 1;">
                  <i class="fa-solid fa-download"></i> Download Specs
                </button>
              </div>
            </div>
          </div>

          <div style="margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid var(--border-color);">
            <h3 style="font-size: 1.15rem; color: var(--primary); font-weight: 700; margin-bottom: 1rem;">Technical Specifications</h3>
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; background: var(--bg-light); padding: 1.25rem; border-radius: var(--radius-md);">
              ${specsHtml}
            </div>
            <p style="font-size: 0.85rem; color: var(--text-muted); margin-top: 1rem; font-style: italic;">
              * Note: Custom voltage configurations and rate chart formats available upon request.
            </p>
          </div>
        `;

        productModal.classList.add('active');
      }
    }
  });

  // Close Product Modal
  if (productModalClose) {
    productModalClose.addEventListener('click', () => {
      productModal.classList.remove('active');
    });
  }

  // 6. Quote Modal Logic
  document.addEventListener('click', (e) => {
    const btn = e.target.closest('.open-quote-modal');
    if (btn) {
      const prodName = btn.dataset.product || 'General Equipment Enquiry';
      quoteProductName.value = prodName;
      
      // Close product modal if open
      productModal.classList.remove('active');
      
      quoteModal.classList.add('active');
    }
  });

  if (quoteModalClose) {
    quoteModalClose.addEventListener('click', () => {
      quoteModal.classList.remove('active');
    });
  }

  // Close Modals on overlay backdrop click
  [quoteModal, productModal].forEach(modal => {
    if (modal) {
      modal.addEventListener('click', (e) => {
        if (e.target === modal) {
          modal.classList.remove('active');
        }
      });
    }
  });

  // 7. Form Submission Handling
  if (quoteForm) {
    quoteForm.addEventListener('submit', (e) => {
      e.preventDefault();
      quoteModal.classList.remove('active');
      showToast('Thank you! Your quote request has been submitted to Vinit Enterprise.');
      quoteForm.reset();
    });
  }

  if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
      e.preventDefault();
      showToast('Enquiry Sent! Our technical team will get back to you shortly.');
      contactForm.reset();
    });
  }

  // Download Brochure Click Simulation
  document.addEventListener('click', (e) => {
    if (e.target.closest('.download-brochure-btn')) {
      showToast('Downloading Vinit Enterprise Technical Specification Sheet...');
    }
  });

  // 8. Toast Helper
  function showToast(msg) {
    toastMessage.textContent = msg;
    toastNotify.classList.add('show');
    setTimeout(() => {
      toastNotify.classList.remove('show');
    }, 4500);
  }

  // 9. Floating WhatsApp Widget Handler
  if (whatsappBtn) {
    whatsappBtn.addEventListener('click', () => {
      const phone = "919876543210";
      const text = encodeURIComponent("Hello Vinit Enterprise team, I would like to inquire about your milk testing and dairy equipment.");
      window.open(`https://wa.me/${phone}?text=${text}`, '_blank');
    });
  }
});
