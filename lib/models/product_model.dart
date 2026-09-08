class ProductSpec {
  final String label;
  final String value;

  const ProductSpec({required this.label, required this.value});
}

class Product {
  final String id;
  final String title;
  final String category;
  final String categoryId; // testing, amcu, weighing, stirrer, automation
  final String overview;
  final String imagePath;
  final String iconName;
  final String badgeText;
  final String brochurePath;
  final List<ProductSpec> specs;
  final List<String> features;
  final String applications;
  final String priceEstimate;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.categoryId,
    required this.overview,
    required this.imagePath,
    required this.iconName,
    required this.badgeText,
    this.brochurePath = '',
    required this.specs,
    required this.features,
    required this.applications,
    required this.priceEstimate,
  });
}

class ProductCatalog {
  static const List<String> categories = [
    'All Products',
    'Milk Analyzer',
    'Milk Collection & AMCU',
    'Digital Strirrer',
    'Smart DPU',
    'Dairy Management Software',
    'Weighing Scale',
  ];

  static const List<String> allBrochurePaths = [
    'assets/brochures/ekomilk_bond_ultra_pro_kit_brochure.jpg',
    'assets/brochures/digital_ultrasonic_stirrer_brochure.jpg',
    'assets/brochures/mobile_dairy_app_brochure.jpg',
    'assets/brochures/ekomilk_ultra_pro_brochure.jpg',
    'assets/brochures/eko_bond_combo_brochure.jpg',
    'assets/brochures/smart_dpu_brochure.jpeg',
    'assets/brochures/data_processing_unit_dpu_brochure.jpg',
    'assets/brochures/dairy_portal_bochure.jpeg',
    'assets/brochures/ekomilk_ultra_brochure_metal.jpeg',
    'assets/brochures/platform_weighing_scale_brochure.jpg',
  ];

  static const List<Product> sampleProducts = [
    Product(
      id: 'ekomilk-ultra-pro',
      title: 'EKOMILK Bond Ultra Pro',

      category: 'Milk Collection & AMCU',
      categoryId: 'Milk Collection & AMCU',
      imagePath: 'assets/ekomilk_bond.jpg',
      iconName: 'flask',
      badgeText: 'All-in-One Milk Testing',
      brochurePath: 'assets/brochures/ekomilk_bond_ultra_pro_kit_brochure.jpg',

      overview:
          'Compact and reliable ultrasonic milk analyzer designed for fast and accurate real-time milk quality analysis.',
      specs: [
        ProductSpec(
          label: 'Measuring Parameters',
          value: 'Fat, SNF, Protein, Lactose, Added Water',
        ),
        ProductSpec(label: 'Measurement Time', value: 'Less than 30 seconds'),
        ProductSpec(label: 'Average Speed', value: 'Up to 180 samples/hour'),
        ProductSpec(label: 'Connectivity', value: 'RS232'),
        ProductSpec(label: 'Display', value: 'Color LCD Display'),
      ],
      features: [
        'Double Sensor Technology',
        'Accurate & Reliable Results',
        'Color LCD Display',
        'Compact & Portable Design',
        'Low Power Consumption',
        'Easy Operation',
        'Low Maintenance',
      ],
      applications:
          'Milk Collection Centers, Dairy Cooperatives, Milk Testing Laboratories and Quality Control Centers.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),

    Product(
      id: 'digital-ultrasonic-stirrer',
      title: 'Digital Ultrasonic Stirrer',
      category: 'Digital Strirrer',
      categoryId: 'Digital Strirrer',
      imagePath: 'assets/digital_ultrasonic_stirrer.jpg',
      iconName: 'vial',
      badgeText: 'Digital Strirrer',
      brochurePath: 'assets/brochures/digital_ultrasonic_stirrer_brochure.jpg',
      overview:
          'Digital ultrasonic stirrer designed for efficient and uniform mixing and sample homogenization using ultrasonic technology.',
      specs: [
        ProductSpec(label: 'Display', value: 'Digital 7-Segment Display'),
        ProductSpec(label: 'Control', value: 'Start/Stop, Up/Down'),
        ProductSpec(label: 'Stirring Technology', value: 'Ultrasonic'),
        ProductSpec(label: 'Power Supply', value: '220V AC, 50Hz'),
        ProductSpec(
          label: 'Body Material',
          value: 'Mild Steel / Powder Coated Finish',
        ),
        ProductSpec(label: 'Stirrer Material', value: 'Stainless Steel'),
      ],
      features: [
        'Ultrasonic Mixing',
        'Digital Control',
        'Reliable & Durable',
        'Easy Operation',
        'Adjustable Speed / Power',
        'Safe Operation',
        'Compact Design',
      ],
      applications:
          'Laboratories, Research Institutes, Food & Beverage, Pharmaceutical, Chemical and Industrial Processing.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),

    Product(
      id: 'mobile-dairy-app',
      title: 'Mobile Dairy App',
      category: 'Dairy Management Software',
      categoryId: 'Dairy Management Software',
      imagePath: 'assets/mobile_dairy_app.jpeg',
      iconName: 'mobile',
      badgeText: 'Dairy Management',
      brochurePath: 'assets/brochures/mobile_dairy_app_brochure.jpg',
      overview:
          'Smart mobile dairy management application for digitalizing milk collection, transportation, quality management and dairy operations.',
      specs: [
        ProductSpec(label: 'Platform', value: 'Mobile Application'),
        ProductSpec(label: 'Connectivity', value: 'Bluetooth, Cloud'),
        ProductSpec(label: 'Milk Testing', value: 'FAT, SNF, CLR & Protein'),
        ProductSpec(label: 'Synchronization', value: 'Cloud Synchronization'),
        ProductSpec(label: 'Notifications', value: 'SMS & Smart Notifications'),
      ],
      features: [
        'Quick registration for Farmers, VLC, BMC & Chilling Centers',
        'Milk Collection Management',
        'Real-time Milk Quality Testing',
        'Bluetooth integration with weighing scales and milk analyzers',
        'Cloud synchronization',
        'Automated milk rate calculation',
        'SMS alerts and slip printing',
        'Milk dispatch tracking',
        'Transport and Driver Management',
        'Quality Settings and Penalty Rules',
        'Real-time Reports',
      ],
      applications:
          'Farmers, Village Level Collection Centers, BMCs, VLCs, Chilling Centers and Milk Unions.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),

    Product(
      id: 'ekomilk-bond-ultra-pro-kit',
      title: 'EKOMILK Analyzer (Plastic Body)',
      category: 'Milk Analyzer',
      categoryId: 'Milk Analyzer',

      imagePath: 'assets/milk_analyzer.jpg',
      iconName: 'flask',
      badgeText: 'Milk Analyzer',
      brochurePath: 'assets/brochures/ekomilk_ultra_pro_brochure.jpg',
      overview:
          'Fast and efficient milk analyzer kit designed for accurate milk quality testing with a compact and user-friendly design.',
      specs: [
        ProductSpec(label: 'Measuring Time', value: '30 seconds'),
        ProductSpec(label: 'Fat', value: '0.5% to 12%'),
        ProductSpec(label: 'SNF', value: '6% to 12%'),
        ProductSpec(label: 'Added Water', value: '0% to 60%'),
        ProductSpec(label: 'Milk Density', value: '1.0200 to 1.0400 g/cm³'),
        ProductSpec(label: 'Power Supply', value: '220V AC / 100W max'),
        ProductSpec(label: 'Dimensions', value: '380 × 310 × 285 mm'),
        ProductSpec(label: 'Weight', value: '< 4.5 kg'),
      ],
      features: [
        'Fast 30-second analysis',
        'Simple and lightweight design',
        'Low power consumption',
        'Very small quantity of milk required',
        'No acid or chemicals required',
        'RS232 connectivity',
        'USB connectivity',
        'Data collection system',
        'Unlimited memory',
      ],
      applications:
          'Milk Collection Centers, Dairy Cooperatives, Milk Testing Facilities and Quality Control Centers.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),

    Product(
      id: 'eko-bond-combo',
      title: 'EKO Bond Combo',
      category: 'Milk Collection & AMCU',
      categoryId: 'Milk Collection & AMCU',
      imagePath: 'assets/ekomilk_bond_ultra_pro.jpeg',
      iconName: 'microchip',
      badgeText: 'All-in-One Milk Testing',
      brochurePath: 'assets/brochures/eko_bond_combo_brochure.jpg',

      overview:
          'All-in-one milk testing and collection solution combining a milk analyzer, digital ultrasonic stirrer, DPU, weighing scale and thermal printer.',
      specs: [
        ProductSpec(label: 'Measurement Time', value: '27 seconds'),
        ProductSpec(
          label: 'Integrated System',
          value: 'Milk Analyzer + Stirrer + DPU + Weighing Scale + Printer',
        ),
        ProductSpec(
          label: 'Data Storage',
          value: 'Up to 1000 customers per shift',
        ),
        ProductSpec(label: 'Connectivity', value: 'SIM & Wi-Fi'),
        ProductSpec(label: 'Data Transfer', value: 'USB / SIM / Wi-Fi'),
        ProductSpec(label: 'Printer', value: 'Optional Thermal Printer'),
      ],
      features: [
        '27-second milk measurement',
        'Built-in ultrasonic stirrer',
        'Integrated Data Processing Unit',
        'Integrated weighing scale',
        'Cloud connectivity',
        'SIM-based data transfer',
        'Wi-Fi connectivity',
        'Collection, Customer, Shift Summary & Bonus Reports',
        'SMS Alerts',
        'CSV data export',
        'Remote server connectivity',
      ],
      applications:
          'Village Milk Collection Centers, Dairy Cooperatives, Milk Unions, BMCs and High-Volume Milk Procurement Centers.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),

    Product(
      id: 'ekomilk-ulta-pro',
      title: 'EKOMILK Analyzer (Metal Body)',
      category: 'Milk Analyzer',
      categoryId: 'Milk Analyzer',

      imagePath: 'assets/ekomilk_ultra_pro_metal_body.png',
      iconName: 'flask',
      badgeText: 'Milk Analyzer',
      brochurePath: 'assets/brochures/ekomilk_ultra_brochure_metal.jpeg',
      overview:
          'Fast and efficient milk analyzer kit designed for accurate milk quality testing with a compact and user-friendly design.',
      specs: [
        ProductSpec(label: 'Measuring Time', value: '30 seconds'),
        ProductSpec(label: 'Fat', value: '0.5% to 12%'),
        ProductSpec(label: 'SNF', value: '6% to 12%'),
        ProductSpec(label: 'Added Water', value: '0% to 60%'),
        ProductSpec(label: 'Milk Density', value: '1.0200 to 1.0400 g/cm³'),
        ProductSpec(label: 'Power Supply', value: '220V AC / 100W max'),
        ProductSpec(label: 'Dimensions', value: '380 × 310 × 285 mm'),
        ProductSpec(label: 'Weight', value: '< 4.5 kg'),
      ],
      features: [
        'Fast 30-second analysis',
        'Simple and lightweight design',
        'Low power consumption',
        'Very small quantity of milk required',
        'No acid or chemicals required',
        'RS232 connectivity',
        'USB connectivity',
        'Data collection system',
        'Unlimited memory',
      ],
      applications:
          'Milk Collection Centers, Dairy Cooperatives, Milk Testing Facilities and Quality Control Centers.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),

    Product(
      id: 'vinit-smart-dpu',
      title: 'smart DPU',
      category: 'Smart DPU',
      categoryId: 'Smart DPU',
      imagePath: 'assets/smart_dpu_touch.png',
      iconName: 'database',
      badgeText: 'Smart DPU',
      brochurePath: 'assets/brochures/smart_dpu_brochure.jpeg',
      overview:
          'Intelligent milk collection and data processing unit designed for milk collection management, reporting, payment processing and system connectivity.',
      specs: [
        ProductSpec(
          label: 'Processor',
          value: '32-bit High-Performance Microcontroller',
        ),
        ProductSpec(
          label: 'Display',
          value: '5-inch Intelligent Touch Display',
        ),
        ProductSpec(label: 'Connectivity', value: 'Wi-Fi & GSM'),
        ProductSpec(label: 'Storage', value: 'Micro SD Card Support'),
        ProductSpec(label: 'Printer', value: 'Built-in Thermal Printer'),
        ProductSpec(label: 'Power', value: 'AC/DC Power Supply'),
      ],
      features: [
        'Milk Collection Management',
        'USB / Server Data Exchange',
        'View Reports',
        'Dispatch Note Generation',
        'Payment Cycle Management',
        'Milk Collection Records',
        'Wi-Fi Connectivity',
        'GSM Communication',
        'Built-in Thermal Printer',
        'Real-Time Data Monitoring',
        'Secure Data Storage',
        'Multiple Connectivity Options',
      ],
      applications:
          'Cooperative Milk Societies, Milk Collection Centers, Chilling Centers and Milk Procurement Nodes.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'vinit-dpu-unit',
      title: 'Data Processing Unit (DPU)',
      category: 'Smart DPU',
      categoryId: 'Smart DPU',
      imagePath: 'assets/dpu.jpg',
      iconName: 'database',
      badgeText: 'Smart DPU',
      brochurePath: 'assets/brochures/data_processing_unit_dpu_brochure.jpg',
      overview:
          'Micro-controller based Data Processing Unit (DPU) engineered for accurate, reliable, and efficient milk collection operations with built-in thermal printer, keypad, RFID support, and 12 months data storage.',
      specs: [
        ProductSpec(label: 'Display', value: '95mm x 55mm Jumbo LCD Display'),
        ProductSpec(
          label: 'Printer',
          value: 'Thermal Printed - 2.0" Panel Mounted',
        ),
        ProductSpec(label: 'Keyboard', value: 'In-built Keypad'),
        ProductSpec(label: 'Data Storage', value: 'Up to 12 Months'),
        ProductSpec(
          label: 'Communication',
          value: 'USB Flash Drive / GSM / GPRS',
        ),
        ProductSpec(
          label: 'Milk Parameters',
          value: 'Weight (Kg/Ltr), FAT%, SNF%, Added Water%',
        ),
        ProductSpec(
          label: 'Model',
          value: 'Available in different models as per customer requirements',
        ),
      ],
      features: [
        'Micro-Controller based embedded design',
        'RFID for customer identification (Optional)',
        'Direct interface with Milk Analyzer & Weighing Scale',
        'Milk Analyzer sync: Date, Weight (Kg/Ltr), FAT%, SNF%, Added water%',
        'In-built Keypad & Panel Mounted Thermal Printer',
        'Data transfer through USB Flash drive / GSM / GPRS',
        '2 Rate chart storage facility',
        'Print/view shift report with weighted average',
        'Store data up to 12 months',
        'Available Android-based integration option',
      ],
      applications:
          'Cooperative Milk Societies, Village Milk Collection Centers (VLC), Chilling Centers and Milk Procurement Nodes.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'dairy-portal',
      title: 'Dairy Portal',
      category: 'Dairy Management Software',
      categoryId: 'Dairy Management Software',
      imagePath: 'assets/dairy_portal.jpeg',
      iconName: 'cloud',
      badgeText: 'Dairy Cloud Portal',
      brochurePath: 'assets/brochures/dairy_portal_bochure.jpeg',
      overview:
          'Web-based cloud dairy management portal providing centralized real-time monitoring of milk procurement, cooperative ledgers, rate charts, and member payouts.',
      specs: [
        ProductSpec(
          label: 'Platform',
          value: 'Cloud Web Application (Browser & Tablet)',
        ),
        ProductSpec(
          label: 'Synchronization',
          value: 'Real-Time Sync with AMCUs, DPUs & Mobile Apps',
        ),
        ProductSpec(
          label: 'Multi-Society',
          value: 'Multi-Branch, Union & BMC Hierarchy Support',
        ),
        ProductSpec(
          label: 'Reporting',
          value: 'Shift Intake, Farmer Ledgers, Rate Charts & Penalties',
        ),
        ProductSpec(
          label: 'Security',
          value: 'Encrypted Cloud Storage & Role-Based Access',
        ),
      ],
      features: [
        'Real-time cloud dashboard for milk procurement analytics',
        'Automated society ledger management & farmer payment calculations',
        'Remote rate chart manager & instant push to collection centers',
        'Direct integration with AMCU hardware & Mobile Dairy App',
        'Comprehensive analytical reports with Excel & PDF export',
        'Role-based multi-user security controls',
      ],
      applications:
          'Dairy Unions, Cooperative Societies, Bulk Milk Cooler (BMC) Hubs, Milk Processing Plants.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'platform-weighing-scale',
      title: 'Weighing Scale',
      category: 'Weighing Scale',
      categoryId: 'Weighing Scale',
      imagePath: 'assets/platform_weighing_scale.jpg',
      iconName: 'scale',
      badgeText: 'Weighing Scale',
      brochurePath: 'assets/brochures/platform_weighing_scale_brochure.jpg',
      overview:
          'Built for industrial and commercial use, our Weighing Scale combines durability with precision to deliver accurate weight measurements every time.',
      specs: [
        ProductSpec(
          label: 'Platform Size (L x W)',
          value: 'Customizable (As per requirement)',
        ),
        ProductSpec(
          label: 'Capacity',
          value: '50 kg – 500 kg (Available in multiple ranges)',
        ),
        ProductSpec(label: 'Accuracy', value: '± 0.05% – 0.1% FS'),
        ProductSpec(label: 'Display', value: 'LED / LCD (Red / White)'),
        ProductSpec(
          label: 'Power Supply',
          value: 'AC 220V ±10%, 50Hz (or Rechargeable Battery)',
        ),
        ProductSpec(label: 'Material', value: 'MS Frame + SS Platform'),
        ProductSpec(label: 'Load Cell', value: 'High Precision Load Cell'),
        ProductSpec(label: 'Operating Temperature', value: '-10°C to 45°C'),
      ],
      features: [
        'High Accuracy — Reliable and consistent weighing results',
        'Sturdy Construction — Durable MS frame with SS platform top',
        'High Load Capacity — Suitable for wide range of industrial applications',
        'Digital Indicator — Clear LED display for easy reading & operation',
        'Adjustable Feet — Ensures stability on uneven surfaces',
        'Low Power Consumption — Energy efficient with long working hours',
      ],
      applications:
          'Manufacturing, Warehousing, Logistics, Agriculture, Retail & Dairy Milk Collection Centers.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
  ];
}
