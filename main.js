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
    'ekomilk-bond': {
      title: 'EKOMILK Bond',
      category: 'Milk Testing Equipment',
      image: 'assets/ekomilk_bond.jpg',
      overview: 'Vinit Enterprise EKOMILK Bond is a compact, high-speed ultrasonic milk analyzer with integrated sample chamber and LCD display for accurate, non-chemical Fat & SNF analysis.',
      specs: [
        { label: 'Measuring Speed', value: '30 - 40 seconds per sample' },
        { label: 'Parameters', value: 'Fat, SNF, Density, Added Water, Protein' },
        { label: 'Sample Volume', value: '10 mL to 15 mL' },
        { label: 'Power Supply', value: '12V DC / 220V AC with Battery Backup' },
        { label: 'Connectivity', value: 'RS232 / USB Serial Output' }
      ],
      features: [
        'Fast non-chemical ultrasonic measurement probe',
        'User-friendly keypad with clear LCD display',
        'Built-in sample lid chamber for clean operation',
        'Direct interface with scales and printers'
      ],
      applications: 'Milk Collection Centers, Dairy Cooperatives, Raw Milk Purchasing Facilities.'
    },

    'ekomilk-bond-ultra-pro': {
      title: 'EKOMILK Bond Ultra Pro',
      category: 'Integrated Collection Kiosk (AMCU)',
      image: 'assets/ekomilk_bond_ultra_pro.jpg',
      overview: 'The EKOMILK Bond Ultra Pro is an all-in-one stainless steel Automated Milk Collection Unit (AMCU) integrating the milk analyzer, ultrasonic stirrer, data processor, weight display, and printer interface.',
      specs: [
        { label: 'Cabinet Material', value: 'SS-304 Heavy Duty Industrial Stainless Steel' },
        { label: 'Integrated Modules', value: 'Milk Analyzer + Ultrasonic Stirrer + Smart DPU + Weight Display' },
        { label: 'Display Panel', value: 'Multi-line LCD & Digital LED Display System' },
        { label: 'Keypad', value: 'Industrial Numeric Keypad with Function Keys' },
        { label: 'Connectivity', value: 'GPRS Cloud Gateway, USB, RS232 Interface' }
      ],
      features: [
        'All-in-one milk intake and quality testing workstation',
        'Integrated ultrasonic stirrer probe for sample de-aeration',
        'Simultaneous multi-parameter readout and receipt printing',
        'Heavy-duty stainless steel splash-proof build'
      ],
      applications: 'Village Milk Collection Centers (AMCU), Dairy Cooperatives, High-Volume Procurement Plants.'
    },

    'digital-ultrasonic-stirrer': {
      title: 'Digital Ultrasonic Stirrer',
      category: 'Sample Preparation Instrument',
      image: 'assets/digital_ultrasonic_stirrer.jpg',
      overview: 'Digital ultrasonic sample stirrer engineered to eliminate trapped air bubbles in raw milk before testing, ensuring accurate fat and SNF analyzer readings.',
      specs: [
        { label: 'Display', value: '2-Digit RED LED Digital Display' },
        { label: 'Timer Control', value: '5 to 10 Seconds Auto-Timer Control' },
        { label: 'Probe Material', value: 'Titanium / SS-316 Ultrasonic Transducer' },
        { label: 'Operating Buttons', value: 'START/STOP & UP/DOWN Timer Adjustment' }
      ],
      features: [
        'High efficiency ultrasonic cavitation for sample de-aeration',
        'Bright 2-digit LED timer display',
        'Safety warning & dry-run operation protection',
        'Powder-coated stainless housing with beaker holder'
      ],
      applications: 'Milk Testing Counters, Dairy Laboratories, Quality Control Facilities.'
    },

    'milk-analyzer': {
      title: 'Milk Analyzer',
      category: 'Milk Testing Equipment',
      image: 'assets/milk_analyzer.jpg',
      overview: 'Multi-parameter EKOMILK Ultra Pro ultrasonic raw milk analyzer for rapid measurement of Fat, SNF, Density, Added Water, and Protein.',
      specs: [
        { label: 'Measuring Parameters', value: 'FAT%, SNF%, DENSITY, ADDED WATER%, PROTEIN%' },
        { label: 'Measuring Speed', value: '30 - 45 seconds per sample' },
        { label: 'Intake System', value: 'Automatic Peristaltic Intake Pump' },
        { label: 'Display', value: '2-Line Blue Backlit Graphic LCD Display' }
      ],
      features: [
        'Measures 5 key milk composition parameters in seconds',
        'Automatic peristaltic intake pump',
        'Rugged compact metal chassis with top handles',
        'RS232 serial interface for DPU / Printer'
      ],
      applications: 'Raw Milk Collection Counters, Dairy Cooperatives, Testing Laboratories.'
    },

    'dpu': {
      title: 'Data Processing Unit (DPU)',
      category: 'Data Management & Automation',
      image: 'assets/dpu.jpg',
      overview: 'Smart data processing terminal with built-in thermal receipt printer, graphic LCD, and tactile keyboard designed for daily shift intake logging and member receipts.',
      specs: [
        { label: 'Printer Type', value: 'Built-in High Speed Thermal Slip Printer' },
        { label: 'Display', value: 'Wide Graphic LCD Display Panel' },
        { label: 'Keyboard', value: 'Tactile ABC/Numeric Keypad (1-9, PRINT, CANCEL, MENU, ENTER)' },
        { label: 'Memory', value: 'High Capacity Non-Volatile Transaction Storage' }
      ],
      features: [
        'Built-in thermal receipt printer for instant milk collection slips',
        'Automatic rate chart payment calculation based on Fat/SNF',
        'Multi-lingual display support (English, Hindi, Regional)',
        'VINIT Enterprise custom branded heavy-duty console'
      ],
      applications: 'Cooperative Milk Societies, Chilling Centers, Milk Purchasing Units.'
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
      const product = document.getElementById('quote-product-name')?.value || 'General Equipment Enquiry';
      const name = document.getElementById('quote-name')?.value || 'Valued Customer';
      const phone = document.getElementById('quote-phone')?.value || 'N/A';
      const email = document.getElementById('quote-email')?.value || 'Not Provided';
      const qty = document.getElementById('quote-qty')?.value || '1';
      const notes = document.getElementById('quote-notes')?.value || 'None specified';
      const timestamp = new Date().toLocaleString();

      const bodyText = `EQUIPMENT QUOTE REQUEST
Vinit Enterprise - Dairy Equipment & Testing Solutions
--------------------------------------------------

PRODUCT / SERVICE REQUIRED:
• Product Name: ${product}
• Quantity: ${qty} Unit(s)

CUSTOMER CONTACT INFORMATION:
• Full Name / Business: ${name}
• Phone Number: ${phone}
• Email Address: ${email}

REQUIREMENT DETAILS & DELIVERY LOCATION:
• Details / Location: ${notes}

--------------------------------------------------
Submitted on: ${timestamp}
Platform: Vinit Enterprise Web Portal
--------------------------------------------------`;

      const subject = `[EQUIPMENT QUOTE REQUEST] ${product} - ${name}`;
      const mailtoUrl = `mailto:info@vinitenterprise.com?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(bodyText)}`;
      
      quoteModal.classList.remove('active');
      window.location.href = mailtoUrl;
      showToast(`Thank you ${name}! Opening email client to send quote request to info@vinitenterprise.com`);
      quoteForm.reset();
    });
  }

  if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
      e.preventDefault();
      const name = document.getElementById('contact-name')?.value || 'Valued Customer';
      const company = document.getElementById('contact-company')?.value || 'N/A';
      const phone = document.getElementById('contact-phone')?.value || 'N/A';
      const email = document.getElementById('contact-email')?.value || 'N/A';
      const requirement = document.getElementById('contact-product')?.value || 'General Enquiry';
      const details = document.getElementById('contact-message')?.value || 'N/A';
      const timestamp = new Date().toLocaleString();

      const bodyText = `SALES & TECHNICAL INQUIRY
Vinit Enterprise - Dairy Equipment & Testing Solutions
--------------------------------------------------

INQUIRY CATEGORY:
• Requirement: ${requirement}

CONTACT INFORMATION:
• Full Name: ${name}
• Company / Dairy Name: ${company}
• Phone Number: ${phone}
• Email Address: ${email}

REQUIREMENT SPECIFICATIONS & MESSAGE:
• Details: ${details}

--------------------------------------------------
Submitted on: ${timestamp}
Platform: Vinit Enterprise Web Portal
--------------------------------------------------`;

      const subject = `[SALES INQUIRY] ${requirement} - ${name}`;
      const mailtoUrl = `mailto:sales@vinitenterprise.com?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(bodyText)}`;

      window.location.href = mailtoUrl;
      showToast(`Enquiry Sent! Opening email client to send sales inquiry to sales@vinitenterprise.com`);
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
