class ProductSpec {
  final String label;
  final String value;

  const ProductSpec({
    required this.label,
    required this.value,
  });
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
    required this.specs,
    required this.features,
    required this.applications,
    required this.priceEstimate,
  });
}

class ProductCatalog {
  static const List<String> categories = [
    'All Products',
    'Milk Testing',
    'Milk Collection & AMCU',
    'Sample Preparation',
    'Automation & DPUs',
  ];

  static const List<Product> sampleProducts = [
    Product(
      id: 'ekomilk-bond',
      title: 'EKOMILK Bond',
      category: 'Milk Testing',
      categoryId: 'Milk Testing',
      imagePath: 'assets/ekomilk_bond.jpg',
      iconName: 'flask',
      badgeText: 'Milk Analyzer',
      overview:
          'Compact, high-speed ultrasonic milk analyzer with integrated sample chamber and LCD display for accurate Fat & SNF analysis.',
      specs: [
        ProductSpec(label: 'Measuring Speed', value: '30 - 40 sec per sample'),
        ProductSpec(label: 'Parameters', value: 'Fat, SNF, Density, Added Water, Protein'),
        ProductSpec(label: 'Sample Volume', value: '10 mL - 15 mL'),
        ProductSpec(label: 'Power Supply', value: '12V DC / 220V AC with Battery Backup'),
        ProductSpec(label: 'Connectivity', value: 'RS232 & USB Serial Port'),
      ],
      features: [
        'Speed: 30–40 sec per sample',
        'Parameters: Fat, SNF, Density, Water, Protein',
        'RS232 & USB Connectivity for scale/printer',
      ],
      applications:
          'Milk Collection Centers, Dairy Cooperatives, Raw Milk Purchasing Facilities.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'ekomilk-bond-ultra-pro',
      title: 'EKOMILK Bond Ultra Pro',
      category: 'Milk Collection & AMCU',
      categoryId: 'Milk Collection & AMCU',
      imagePath: 'assets/ekomilk_bond_ultra_pro.jpg',
      iconName: 'microchip',
      badgeText: 'All-in-One AMCU',
      overview:
          'Integrated heavy-duty stainless steel AMCU console featuring ultrasonic milk analyzer, ultrasonic stirrer, data processor, weight display, and keypad.',
      specs: [
        ProductSpec(label: 'Cabinet Material', value: 'SS-304 Heavy Duty Industrial Stainless Steel'),
        ProductSpec(label: 'Integrated Modules', value: 'Milk Analyzer + Ultrasonic Stirrer + DPU + Scale'),
        ProductSpec(label: 'Display Panel', value: 'Multi-line Digital LCD & RED LED Displays'),
        ProductSpec(label: 'Keypad', value: 'Industrial Numeric Matrix Keypad'),
        ProductSpec(label: 'Connectivity', value: 'Cloud Gateway, USB, RS232 Serial, Printer Port'),
      ],
      features: [
        'All-in-one milk intake and quality testing workstation',
        'Integrated ultrasonic stirrer probe for sample de-aeration',
        'Simultaneous multi-parameter readout and receipt printing',
      ],
      applications:
          'Village Milk Collection Centers (AMCU), Dairy Cooperatives, High-Volume Procurement Plants.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'digital-ultrasonic-stirrer',
      title: 'Digital Ultrasonic Stirrer',
      category: 'Sample Preparation',
      categoryId: 'Sample Preparation',
      imagePath: 'assets/digital_ultrasonic_stirrer.jpg',
      iconName: 'vial',
      badgeText: 'De-Aeration',
      overview:
          'High-performance ultrasonic sample stirrer designed to remove air bubbles from raw milk before testing for zero-error analyzer readings.',
      specs: [
        ProductSpec(label: 'Display', value: '2-Digit RED LED Digital Display'),
        ProductSpec(label: 'Timer Control', value: '5 to 10 Seconds Auto-Timer Control'),
        ProductSpec(label: 'Probe Material', value: 'Titanium / SS-316 Ultrasonic Transducer'),
        ProductSpec(label: 'Control Buttons', value: 'START/STOP & UP/DOWN Timer Adjustment'),
        ProductSpec(label: 'Safety Alert', value: 'Dry Run Protection Alert Indicator'),
      ],
      features: [
        'High frequency ultrasonic cavitation for sample de-aeration',
        '2-Digit LED display with programmable timer',
        'Safety warning & dry run protection alert',
      ],
      applications:
          'Milk Collection Bench Counters, Dairy Testing Laboratories, Quality Control Hubs.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'milk-analyzer',
      title: 'Milk Analyzer',
      category: 'Milk Testing',
      categoryId: 'Milk Testing',
      imagePath: 'assets/milk_analyzer.jpg',
      iconName: 'flask',
      badgeText: 'Milk Testing',
      overview:
          'Multi-parameter EKOMILK Ultra Pro ultrasonic raw milk analyzer for rapid measurement of Fat, SNF, Density, Added Water, and Protein.',
      specs: [
        ProductSpec(label: 'Measuring Parameters', value: 'FAT%, SNF%, DENSITY, ADDED WATER%, PROTEIN%'),
        ProductSpec(label: 'Measuring Speed', value: '30 - 45 seconds per sample'),
        ProductSpec(label: 'Intake System', value: 'Automatic Peristaltic Intake Pump'),
        ProductSpec(label: 'Display', value: '2-Line Blue Backlit Graphic LCD Display'),
        ProductSpec(label: 'Connectivity', value: 'RS232 Serial Port for DPU / Printer'),
      ],
      features: [
        'Measures 5 key milk composition parameters in seconds',
        'Automatic peristaltic intake pump',
        'Rugged compact metal chassis with top handles',
      ],
      applications:
          'Raw Milk Collection Counters, Dairy Cooperatives, Testing Laboratories.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'dpu',
      title: 'Data Processing Unit (DPU)',
      category: 'Automation & DPUs',
      categoryId: 'Automation & DPUs',
      imagePath: 'assets/dpu.jpg',
      iconName: 'database',
      badgeText: 'Data Processing',
      overview:
          'Smart data processing terminal with built-in thermal receipt printer, graphic LCD, and tactile keyboard designed for daily shift intake logging and member receipts.',
      specs: [
        ProductSpec(label: 'Printer Type', value: 'Built-in High Speed Thermal Slip Printer'),
        ProductSpec(label: 'Display', value: 'Wide Graphic LCD Display Panel'),
        ProductSpec(label: 'Keyboard', value: 'Tactile ABC/Numeric Keypad (1-9, PRINT, CANCEL, MENU, ENTER)'),
        ProductSpec(label: 'Memory', value: 'High Capacity Non-Volatile Transaction Storage'),
        ProductSpec(label: 'Rate Calculation', value: 'Automatic Rate Chart Payment Matrix'),
      ],
      features: [
        'Built-in thermal receipt printer for instant member slips',
        'Automatic rate chart payment calculation based on Fat/SNF',
        'High-capacity shift transaction memory storage',
      ],
      applications:
          'Cooperative Milk Societies, Chilling Centers, Milk Procurement Nodes.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
  ];
}
