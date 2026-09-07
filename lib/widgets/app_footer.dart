import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinit_enterprise/widgets/quote_request_sheet.dart';

import 'adaptive_logo.dart';

class AppFooter extends StatelessWidget {
  final Function(int)? onNavigateToTab;

  const AppFooter({
    super.key,
    this.onNavigateToTab,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF071328),
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 768;
              return Wrap(
                spacing: 32,
                runSpacing: 32,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  // Company Logo & Info Column
                  SizedBox(
                    width: isWide ? 280 : double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Official Company Logo (with Light container for dark mode contrast)
                        AdaptiveLogo(),
                        const SizedBox(height: 14),
                        const Text(
                          'Precision-engineered milk testing instruments, automated milk collection units, and electronic weighing scales designed for maximum efficiency and durability.',
                          style: TextStyle(
                            fontSize: 12.5,
                            height: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Row(
                        //   children: [
                        //     _buildSocialBtn(Icons.business),
                        //     const SizedBox(width: 10),
                        //     _buildSocialBtn(Icons.chat_bubble_outline),
                        //     const SizedBox(width: 10),
                        //     _buildSocialBtn(Icons.play_arrow_outlined),
                        //   ],
                        // ),
                      ],
                    ),
                  ),

                  // Quick Links Column
                  SizedBox(
                    width: isWide ? 140 : 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Quick Links',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _buildFooterLink('Home', () => onNavigateToTab?.call(0)),
                        _buildFooterLink('About Us', () => onNavigateToTab?.call(1)),
                        _buildFooterLink('Services', () => onNavigateToTab?.call(2)),
                        _buildFooterLink('Products', () => onNavigateToTab?.call(3)),
                        _buildFooterLink('Contact', () => onNavigateToTab?.call(4)),
                      ],
                    ),
                  ),

                  // Products Column
                  SizedBox(
                    width: isWide ? 180 : 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Products',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _buildFooterLink('Milk Analyzers', () => onNavigateToTab?.call(3)),
                        _buildFooterLink('Auto Milk Collection Units', () => onNavigateToTab?.call(3)),
                        _buildFooterLink('Milk Weighing Scale Systems', () => onNavigateToTab?.call(3)),
                        _buildFooterLink('Ultrasonic Milk Stirrers', () => onNavigateToTab?.call(3)),
                        _buildFooterLink('Dairy Control Automation', () => onNavigateToTab?.call(3)),
                      ],
                    ),
                  ),

                  // Contact Sales Column
                  SizedBox(
                    width: isWide ? 240 : double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contact Sales',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _buildContactRow(Icons.location_on_outlined, '[Vinit Enterprise Industrial Estate Address]'),
                        _buildContactRow(Icons.phone_outlined, '+91 91732 51191', onTap: () => _launchUrl('tel:+919173251191')),
                        _buildContactRow(Icons.email_outlined, 'sales@vinitenterprise.com', onTap: () => _launchUrl('mailto:sales@vinitenterprise.com')),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () => QuoteRequestSheet.show(context),
                          icon: const Icon(Icons.send_rounded, size: 14, color: Colors.white),
                          label: const Text(
                            'Request a Quote ->',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0072CE),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 32),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),

          // Responsive Copyright Bottom Bar (Overflow-Proof)
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 6,
            children: const [
              Text(
                '© 2026 Vinit Enterprise. All Rights Reserved.',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              Text(
                'Precision Milk Testing & Dairy Automation Equipment',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF0072CE), size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 12.5, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
