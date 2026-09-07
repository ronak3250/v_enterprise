import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinit_enterprise/widgets/animated_entrance.dart';
import 'package:vinit_enterprise/widgets/app_footer.dart';
import 'package:vinit_enterprise/widgets/toast_service.dart';

class ContactScreen extends StatefulWidget {
  final Function(int)? onNavigateToTab;

  const ContactScreen({
    super.key,
    this.onNavigateToTab,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  String _selectedRequirement = 'Select Equipment / Service';

  final List<String> _requirementOptions = [
    'Select Equipment / Service',
    'EKOMILK Bond',
    'EKOMILK Bond Ultra Pro',
    'Digital Ultrasonic Stirrer',
    'Milk Analyzer',
    'Data Processing Unit (DPU)',
    'Annual Maintenance Contract (AMC)',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final company = _companyController.text.trim();
      final phone = _phoneController.text.trim();
      final email = _emailController.text.trim();
      final requirement = _selectedRequirement;
      final details = _detailsController.text.trim();
      final nowStr = DateTime.now().toString().split('.')[0];

      final emailBody = '''
SALES & TECHNICAL INQUIRY
Vinit Enterprise - Dairy Equipment & Testing Solutions
--------------------------------------------------

INQUIRY CATEGORY:
• Requirement: $requirement

CONTACT INFORMATION:
• Full Name: $name
• Company / Dairy Name: ${company.isEmpty ? 'N/A' : company}
• Phone Number: $phone
• Email Address: $email

REQUIREMENT SPECIFICATIONS & MESSAGE:
• Details: $details

--------------------------------------------------
Submitted on: $nowStr
Platform: Vinit Enterprise Mobile/Web Portal
--------------------------------------------------
''';

      final subjectStr = '[SALES INQUIRY] $requirement - $name';
      final mailtoUrl = 'mailto:sales@vinitenterprise.com?subject=${Uri.encodeComponent(subjectStr)}&body=${Uri.encodeComponent(emailBody)}';
      final Uri emailUri = Uri.parse(mailtoUrl);

      try {
        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
        }
      } catch (e) {
        debugPrint('Could not launch mail client: $e');
      }

      if (mounted) {
        ToastService.showToast(
          context,
          'Thank you $name! Sales enquiry sent to sales@vinitenterprise.com',
        );
        _nameController.clear();
        _companyController.clear();
        _phoneController.clear();
        _emailController.clear();
        _detailsController.clear();
        setState(() {
          _selectedRequirement = 'Select Equipment / Service';
        });
      }
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Banner
          Container(
            width: double.infinity,
            color: const Color(0xFF07142A),
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            child: FadeSlideTransition(
              child: Column(
                children: [
                  // const SizedBox(
                  //   height: 90,
                  //   width: 90,
                  //   child: DairyLottieWidget(
                  //     assetName: 'assets/contact_support_animation.json',
                  //   ),
                  // ),
                  const SizedBox(height: 12),
                  Text(
                    "Let's Build the Right Dairy Solution for You",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Have a requirement for milk testing, collection, automation, or dairy equipment? Our technical team is ready to assist.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 36),

          // Main Form and Contact Details Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 800;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column: Get In Touch
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 5,
                      child: FadeSlideTransition(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Get In Touch',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : const Color(0xFF0A2540),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Reach out to Vinit Enterprise for equipment pricing, product brochures, or technical support enquiries.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 24),
                              _buildInfoTile(
                                Icons.location_on_outlined,
                                'Office & Factory Address',
                                '[Vinit Enterprise Plot / Industrial Estate Address]\n[City, District, State - PIN Code]',
                                isDark,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoTile(
                                Icons.phone_outlined,
                                'Phone & WhatsApp',
                                '+91 9173251191',
                                isDark,
                                onTap: () => _launchUrl('tel:+91 91732 51191'),
                              ),
                              const SizedBox(height: 16),
                              _buildInfoTile(
                                Icons.email_outlined,
                                'Email Addresses',
                                'sales@vinitenterprise.com\nsupport@vinitenterprise.com',
                                isDark,
                                onTap: () => _launchUrl('mailto:sales@vinitenterprise.com'),
                              ),
                              const SizedBox(height: 16),
                              _buildInfoTile(
                                Icons.access_time_outlined,
                                'Business Hours',
                                'Monday - Friday: 10:00 AM - 6:00 PM\n Saturday,Sunday: Closed',
                                isDark,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    if (!isWide) const SizedBox(height: 24),
                    if (isWide) const SizedBox(width: 24),

                    // Right Column: Send an Enquiry Form
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 7,
                      child: FadeSlideTransition(
                        delay: const Duration(milliseconds: 150),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF1E293B) : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 15,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Send an Enquiry',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? Colors.white : const Color(0xFF0A2540),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Fill out the form below and our sales engineering team will respond within 24 hours.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                LayoutBuilder(
                                  builder: (context, formConstraints) {
                                    final isFormWide = formConstraints.maxWidth > 500;
                                    return Flex(
                                      direction: isFormWide ? Axis.horizontal : Axis.vertical,
                                      children: [
                                        _buildResponsiveFlexChild(
                                          isWide: isFormWide,
                                          flex: 1,
                                          child: TextFormField(
                                            controller: _nameController,
                                            style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                                            decoration: InputDecoration(
                                              labelText: 'Full Name *',
                                              hintText: 'Your Name',
                                              prefixIcon: const Icon(Icons.person_outline),
                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                            ),
                                            validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                                          ),
                                        ),
                                        if (!isFormWide) const SizedBox(height: 14),
                                        if (isFormWide) const SizedBox(width: 14),
                                        _buildResponsiveFlexChild(
                                          isWide: isFormWide,
                                          flex: 1,
                                          child: TextFormField(
                                            controller: _companyController,
                                            style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                                            decoration: InputDecoration(
                                              labelText: 'Company / Dairy Name',
                                              hintText: 'Dairy Co-op / Plant Name',
                                              prefixIcon: const Icon(Icons.business_outlined),
                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(height: 14),
                                LayoutBuilder(
                                  builder: (context, formConstraints) {
                                    final isFormWide = formConstraints.maxWidth > 500;
                                    return Flex(
                                      direction: isFormWide ? Axis.horizontal : Axis.vertical,
                                      children: [
                                        _buildResponsiveFlexChild(
                                          isWide: isFormWide,
                                          flex: 1,
                                          child: TextFormField(
                                            controller: _phoneController,
                                            keyboardType: TextInputType.phone,
                                            style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                                            decoration: InputDecoration(
                                              labelText: 'Phone Number *',
                                              hintText: '+91 98765 43210',
                                              prefixIcon: const Icon(Icons.phone_outlined),
                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                            ),
                                            validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                                          ),
                                        ),
                                        if (!isFormWide) const SizedBox(height: 14),
                                        if (isFormWide) const SizedBox(width: 14),
                                        _buildResponsiveFlexChild(
                                          isWide: isFormWide,
                                          flex: 1,
                                          child: TextFormField(
                                            controller: _emailController,
                                            keyboardType: TextInputType.emailAddress,
                                            style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                                            decoration: InputDecoration(
                                              labelText: 'Email Address *',
                                              hintText: 'name@company.com',
                                              prefixIcon: const Icon(Icons.email_outlined),
                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                            ),
                                            validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(height: 14),
                                DropdownButtonFormField<String>(
                                  initialValue: _selectedRequirement,
                                  dropdownColor: isDark ? const Color(0xFF1E293B) : Colors.white,
                                  style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                                  decoration: InputDecoration(
                                    labelText: 'Product / Requirement *',
                                    prefixIcon: const Icon(Icons.inventory_2_outlined),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  items: _requirementOptions.map((opt) {
                                    return DropdownMenuItem(value: opt, child: Text(opt, style: TextStyle(fontSize: 13, color: isDark ? Colors.white : Colors.black87)));
                                  }).toList(),
                                  onChanged: (val) {
                                    if (val != null) {
                                      setState(() {
                                        _selectedRequirement = val;
                                      });
                                    }
                                  },
                                ),
                                const SizedBox(height: 14),
                                TextFormField(
                                  controller: _detailsController,
                                  maxLines: 3,
                                  style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                                  decoration: InputDecoration(
                                    labelText: 'Requirement Details / Quantity *',
                                    hintText: 'Specify quantity, locations, or special features needed...',
                                    prefixIcon: const Icon(Icons.notes_outlined),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  validator: (v) => v == null || v.isEmpty ? 'Please enter requirement details' : null,
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton.icon(
                                    onPressed: _submitForm,
                                    icon: const Icon(Icons.send_rounded, color: Colors.white, size: 16),
                                    label: const Text(
                                      'Send Enquiry',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF0072CE),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 48),

          // Footer
          AppFooter(onNavigateToTab: widget.onNavigateToTab),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value, bool isDark, {VoidCallback? onTap}) {
    return AnimatedHoverCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFF0072CE), size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF0A2540),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveFlexChild({required bool isWide, required int flex, required Widget child}) {
    if (isWide) {
      return Expanded(flex: flex, child: child);
    }
    return child;
  }
}
