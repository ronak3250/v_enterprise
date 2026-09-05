import 'package:flutter/material.dart';
import 'package:vinit_enterprise/widgets/dairy_lottie_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  String _milkType = 'Cow Milk';
  double _liters = 50.0;
  double _fatPercent = 4.2;
  double _snfPercent = 8.5;
  double _baseRatePerKgFat = 380.0; // Base Fat Rate in INR
  double _baseRatePerKgSnf = 240.0; // Base SNF Rate in INR

  final TextEditingController _litersController = TextEditingController(text: '50.0');
  final TextEditingController _fatController = TextEditingController(text: '4.2');
  final TextEditingController _snfController = TextEditingController(text: '8.5');
  final TextEditingController _fatRateController = TextEditingController(text: '380.0');
  final TextEditingController _snfRateController = TextEditingController(text: '240.0');

  @override
  void dispose() {
    _litersController.dispose();
    _fatController.dispose();
    _snfController.dispose();
    _fatRateController.dispose();
    _snfRateController.dispose();
    super.dispose();
  }

  // Calculations
  double get totalFatKg => (_liters * _fatPercent) / 100;
  double get totalSnfKg => (_liters * _snfPercent) / 100;
  double get fatValue => totalFatKg * _baseRatePerKgFat;
  double get snfValue => totalSnfKg * _baseRatePerKgSnf;
  double get totalPayout => fatValue + snfValue;
  double get ratePerLiter => _liters > 0 ? totalPayout / _liters : 0.0;

  void _recalculate() {
    setState(() {
      _liters = double.tryParse(_litersController.text) ?? 0.0;
      _fatPercent = double.tryParse(_fatController.text) ?? 0.0;
      _snfPercent = double.tryParse(_snfController.text) ?? 0.0;
      _baseRatePerKgFat = double.tryParse(_fatRateController.text) ?? 0.0;
      _baseRatePerKgSnf = double.tryParse(_snfRateController.text) ?? 0.0;
    });
  }

  void _presetMilkType(String type) {
    setState(() {
      _milkType = type;
      if (type == 'Cow Milk') {
        _fatController.text = '4.0';
        _snfController.text = '8.5';
      } else if (type == 'Buffalo Milk') {
        _fatController.text = '6.8';
        _snfController.text = '9.0';
      } else {
        _fatController.text = '4.8';
        _snfController.text = '8.7';
      }
      _recalculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0A2540), Color(0xFF0072CE)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Cooperative Society Standard',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Milk Payment Rate Calculator',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Instantly estimate member payment payouts based on FAT % and SNF % matrix.',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const SizedBox(
                  width: 64,
                  height: 64,
                  child: DairyLottieWidget(
                    assetName: 'assets/calculator_roi_animation.json',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Preset Milk Type Chips
          Text(
            'Select Sample Type',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0A2540),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: ['Cow Milk', 'Buffalo Milk', 'Mixed Milk'].map((type) {
              final isSel = _milkType == type;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(type),
                  selected: isSel,
                  selectedColor: const Color(0xFF0072CE),
                  backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.grey[200],
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
                    color: isSel ? Colors.white : (isDark ? Colors.grey[300] : const Color(0xFF334155)),
                  ),
                  onSelected: (sel) {
                    if (sel) _presetMilkType(type);
                  },
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Input Form Card
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: isDark ? const Color(0xFF1E293B) : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _litersController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (_) => _recalculate(),
                      decoration: InputDecoration(
                        labelText: 'Milk Quantity (Liters / Kg) *',
                        prefixIcon: const Icon(Icons.local_drink_outlined),
                        suffixText: 'Ltrs',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _fatController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (_) => _recalculate(),
                            decoration: InputDecoration(
                              labelText: 'Fat Percentage *',
                              prefixIcon: const Icon(Icons.water_drop_outlined),
                              suffixText: '%',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _snfController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (_) => _recalculate(),
                            decoration: InputDecoration(
                              labelText: 'SNF Percentage *',
                              prefixIcon: const Icon(Icons.blur_on_outlined),
                              suffixText: '%',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _fatRateController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (_) => _recalculate(),
                            decoration: InputDecoration(
                              labelText: 'Base Fat Rate (₹/Kg)',
                              prefixIcon: const Icon(Icons.currency_rupee),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _snfRateController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (_) => _recalculate(),
                            decoration: InputDecoration(
                              labelText: 'Base SNF Rate (₹/Kg)',
                              prefixIcon: const Icon(Icons.currency_rupee),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Payout Calculation Results Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF0072CE).withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Calculated Farmer Payout',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0072CE),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Live Calculation',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF10B981),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Payout Amount:',
                      style: TextStyle(
                        fontSize: 15,
                        color: isDark ? Colors.grey[300] : const Color(0xFF334155),
                      ),
                    ),
                    Text(
                      '₹${totalPayout.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF10B981),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),
                _buildResultRow('Rate Per Liter:', '₹${ratePerLiter.toStringAsFixed(2)} / Ltr', isDark),
                _buildResultRow('Fat Content (Kg):', '${totalFatKg.toStringAsFixed(3)} kg', isDark),
                _buildResultRow('SNF Content (Kg):', '${totalSnfKg.toStringAsFixed(3)} kg', isDark),
                _buildResultRow('Fat Value Component:', '₹${fatValue.toStringAsFixed(2)}', isDark),
                _buildResultRow('SNF Value Component:', '₹${snfValue.toStringAsFixed(2)}', isDark),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildResultRow(String label, String val, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          Text(
            val,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.grey[200] : const Color(0xFF0A2540),
            ),
          ),
        ],
      ),
    );
  }
}
