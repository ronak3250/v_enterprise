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
    'Milk Collection',
    'Weighing Systems',
    'Automation & DPUs',
  ];

  static const List<Product> sampleProducts = [
    Product(
      id: 'milk-analyzer',
      title: 'Ultrasonic Milk Analyzer',
      category: 'Milk Testing',
      categoryId: 'Milk Testing',
      imagePath: 'assets/milk_analyzer.jpg',
      iconName: 'flask',
      badgeText: 'Milk Testing',
      overview:
          'High-precision electronic analyzer for fast fat and SNF testing of cow, buffalo, and mixed milk.',
      specs: [
        ProductSpec(label: 'Measuring Speed', value: '30 - 40 sec per sample'),
        ProductSpec(label: 'Parameters', value: 'Fat, SNF, Density, Added Water'),
        ProductSpec(label: 'Connectivity', value: 'RS232 & USB Connectivity'),
        ProductSpec(label: 'Power Supply', value: '12V DC / 220V AC with Internal Battery'),
      ],
      features: [
        'Speed: 30–40 sec per sample',
        'Parameters: Fat, SNF, Density, Water',
        'RS232 & USB Connectivity',
      ],
      applications:
          'Milk Collection Centers, Dairy Cooperatives, Raw Milk Procurement Centers, Testing Labs.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'amcu',
      title: 'Automatic Milk Collection Unit (AMCU)',
      category: 'Milk Collection',
      categoryId: 'Milk Collection',
      imagePath: 'assets/automatic_milk_collection_unit.jpg',
      iconName: 'microchip',
      badgeText: 'Milk Collection',
      overview:
          'All-in-one smart collection terminal with integrated scale interface, printer, and member RFID reader.',
      specs: [
        ProductSpec(label: 'Printer', value: 'Built-in Thermal Receipt Printer'),
        ProductSpec(label: 'Rate Chart', value: 'Automatic Rate Chart Calculation'),
        ProductSpec(label: 'Connectivity', value: 'GPRS / Cloud Data Transfer Ready'),
        ProductSpec(label: 'Display', value: '7-inch High Contrast Color LCD'),
      ],
      features: [
        'Built-in Thermal Receipt Printer',
        'Automatic Rate Chart Calculation',
        'GPRS / Cloud Data Transfer Ready',
      ],
      applications: 'Village Milk Collection Centers, Dairy Unions, Private Procurement Hubs.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'dpu-collection',
      title: 'Data Processing Milk Collection Unit',
      category: 'Automation & DPUs',
      categoryId: 'Automation & DPUs',
      imagePath: 'assets/automatic_milk_collection_unit.jpg',
      iconName: 'database',
      badgeText: 'Data Processing',
      overview:
          'Smart data processing unit (DPU) specifically designed for milk cooperative societies to record daily intake.',
      specs: [
        ProductSpec(label: 'Memory', value: 'High Capacity Internal Memory'),
        ProductSpec(label: 'Language', value: 'Multi-language Display Support'),
        ProductSpec(label: 'Keyboard', value: 'Rugged Keypad Interface'),
      ],
      features: [
        'High Capacity Internal Memory',
        'Multi-language Display Support',
        'Rugged Keypad Interface',
      ],
      applications: 'Cooperative Milk Societies, Chilling Centers, Milk Procurement Units.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'weighing-system',
      title: 'Electronic Milk Weighing System',
      category: 'Weighing Systems',
      categoryId: 'Weighing Systems',
      imagePath: 'assets/milk_weighing_system.jpg',
      iconName: 'scale',
      badgeText: 'Weighing Systems',
      overview:
          'Heavy-duty stainless steel bowl scale platform with wall indicator for accurate milk weight recording.',
      specs: [
        ProductSpec(label: 'Bowl Capacity', value: '100L / 200L / 500L'),
        ProductSpec(label: 'Load Cell', value: 'Waterproof Load Cell Assembly'),
        ProductSpec(label: 'Display', value: 'Bright RED LED Weight Indicator'),
      ],
      features: [
        'Bowl Capacity: 100L / 200L / 500L',
        'Waterproof Load Cell Assembly',
        'Bright RED LED Weight Indicator',
      ],
      applications: 'Milk Reception Counters, Dairy Chilling Plants, Processing Factories.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'milk-stirrer',
      title: 'Ultrasonic Milk Stirrer',
      category: 'Milk Testing',
      categoryId: 'Milk Testing',
      imagePath: 'assets/ultrasonic_milk_stirrer.jpg',
      iconName: 'vial',
      badgeText: 'Accessories',
      overview:
          'De-aeration device that removes air bubbles from fresh milk samples before ultrasonic testing.',
      specs: [
        ProductSpec(label: 'Cavitation', value: 'High Frequency Ultrasonic Cavitation'),
        ProductSpec(label: 'Stand', value: 'Stainless Steel Probe & Beaker Stand'),
        ProductSpec(label: 'Timer', value: 'Auto-Timer Control (5–10 sec)'),
      ],
      features: [
        'High Frequency Ultrasonic Cavitation',
        'Stainless Steel Probe & Beaker Stand',
        'Auto-Timer Control (5–10 sec)',
      ],
      applications: 'Milk Testing Bench Counters, Quality Control Laboratories.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
    Product(
      id: 'dairy-automation',
      title: 'Dairy Automation System Panel',
      category: 'Automation & DPUs',
      categoryId: 'Automation & DPUs',
      imagePath: 'assets/dairy_automation_system.jpg',
      iconName: 'gears',
      badgeText: 'Automation',
      overview:
          'PLC-driven control panel with touchscreen interface for milk chilling, pasteurization, and flow control.',
      specs: [
        ProductSpec(label: 'Controller', value: 'Industrial PLC Controller'),
        ProductSpec(label: 'HMI Screen', value: 'Touchscreen HMI Display'),
        ProductSpec(label: 'Cabinet', value: 'IP65 Stainless Steel Cabinet'),
      ],
      features: [
        'Industrial PLC Controller',
        'Touchscreen HMI Display',
        'IP65 Stainless Steel Cabinet',
      ],
      applications: 'Milk Processing Factories, Bulk Milk Coolers (BMC), Pasteurization Lines.',
      priceEstimate: 'Contact for Enterprise Pricing',
    ),
  ];
}
