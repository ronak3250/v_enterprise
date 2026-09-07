import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinit_enterprise/widgets/toast_service.dart';

class QuoteRequestSheet extends StatefulWidget {
  final String initialProduct;

  const QuoteRequestSheet({
    super.key,
    this.initialProduct = 'General Equipment Enquiry',
  });

  static void show(BuildContext context, {String initialProduct = 'General Equipment Enquiry'}) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    if (isDesktop) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Container(
            width: 560,
            constraints: const BoxConstraints(maxHeight: 720),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            child: QuoteRequestSheet(initialProduct: initialProduct),
          ),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => QuoteRequestSheet(initialProduct: initialProduct),
      );
    }
  }

  @override
  State<QuoteRequestSheet> createState() => _QuoteRequestSheetState();
}

class _QuoteRequestSheetState extends State<QuoteRequestSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _productController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController(text: '1');
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _productController = TextEditingController(text: widget.initialProduct);
  }

  @override
  void dispose() {
    _productController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _qtyController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final productName = _productController.text.trim();
      final customerName = _nameController.text.trim();
      final phone = _phoneController.text.trim();
      final email = _emailController.text.trim();
      final qty = _qtyController.text.trim().isEmpty ? '1' : _qtyController.text.trim();
      final notes = _notesController.text.trim();
      final nowStr = DateTime.now().toString().split('.')[0];

      final emailBody = '''
EQUIPMENT QUOTE REQUEST
Vinit Enterprise - Dairy Equipment & Testing Solutions
--------------------------------------------------

PRODUCT / SERVICE REQUIRED:
• Product Name: $productName
• Quantity: $qty Unit(s)

CUSTOMER CONTACT INFORMATION:
• Full Name / Business: $customerName
• Phone Number: $phone
• Email Address: ${email.isEmpty ? 'Not Provided' : email}

REQUIREMENT DETAILS & DELIVERY LOCATION:
• Details / Location: ${notes.isEmpty ? 'None specified' : notes}

--------------------------------------------------
Submitted on: $nowStr
Platform: Vinit Enterprise Mobile/Web Portal
--------------------------------------------------
''';

      final subjectStr = '[EQUIPMENT QUOTE REQUEST] $productName - $customerName';
      final mailtoUrl = 'mailto:info@vinitenterprise.com?subject=${Uri.encodeComponent(subjectStr)}&body=${Uri.encodeComponent(emailBody)}';
      final Uri emailUri = Uri.parse(mailtoUrl);

      try {
        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
        }
      } catch (e) {
        debugPrint('Could not launch mail client: $e');
      }

      if (mounted) {
        Navigator.of(context).pop();
        ToastService.showToast(
          context,
          'Thank you $customerName! Quote request sent to info@vinitenterprise.com',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          const SizedBox(height: 12),
          Container(
            width: 44,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 8),

          // Header Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A2540), Color(0xFF0072CE)],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.request_quote_rounded, color: Color(0xFFFFC107), size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Request Equipment Quote',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Direct pricing & technical proposal from Vinit Enterprise',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),

          // Form Body wrapped in Flexible SingleChildScrollView to prevent ANY overflow
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, 20, 24, 24 + bottomInset),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Selected Product Input
                    Text(
                      'SELECTED EQUIPMENT / SERVICE',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0072CE),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _productController,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.inventory_2, color: Color(0xFF0072CE)),
                        filled: true,
                        fillColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                        ),
                      ),
                      validator: (v) => v == null || v.isEmpty ? 'Please enter product name' : null,
                    ),
                    const SizedBox(height: 16),

                    // Customer Details
                    Text(
                      'YOUR CONTACT DETAILS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0072CE),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name / Business Name *',
                        hintText: 'e.g. Vinit Patel / Anand Dairy Co-op',
                        prefixIcon: const Icon(Icons.person_outline),
                        filled: true,
                        fillColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (v) => v == null || v.isEmpty ? 'Please enter your name' : null,
                    ),
                    const SizedBox(height: 14),

                    // Phone & Quantity
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Phone Number *',
                              hintText: '+91 98765 43210',
                              prefixIcon: const Icon(Icons.phone_outlined),
                              filled: true,
                              fillColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (v) => v == null || v.length < 8 ? 'Valid phone required' : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _qtyController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Qty (Units)',
                              prefixIcon: const Icon(Icons.numbers_outlined),
                              filled: true,
                              fillColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Email Address
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'name@company.com',
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Notes / Location
                    TextFormField(
                      controller: _notesController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: 'Requirement Details / Delivery Location',
                        hintText: 'Specify plant location, rate chart format, or voltage requirements...',
                        prefixIcon: const Icon(Icons.notes_outlined),
                        filled: true,
                        fillColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Submit Button with glowing gradient
                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0072CE), Color(0xFF0A2540)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF0072CE).withValues(alpha: 0.35),
                            blurRadius: 14,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: _submitForm,
                        icon: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
                        label: const Text(
                          'Submit Quote Request',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
