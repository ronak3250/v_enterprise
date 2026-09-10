import 'package:flutter/material.dart';
import 'package:vinit_enterprise/widgets/animated_entrance.dart';
import 'package:vinit_enterprise/widgets/app_footer.dart';
import 'package:vinit_enterprise/widgets/quote_request_sheet.dart';
import 'package:vinit_enterprise/utils/responsive.dart';

class ServicesScreen extends StatelessWidget {
  final Function(int)? onNavigateToTab;

  const ServicesScreen({
    super.key,
    this.onNavigateToTab,
  });

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
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: FadeSlideTransition(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0072CE).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF0072CE).withValues(alpha: 0.4)),
                    ),
                    child: const Text(
                      'COMPREHENSIVE AFTER-SALES SERVICE NETWORK',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF38BDF8),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Supporting Dairy Success With Precise Equipment & Software Solutions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'With a support network spanning 300+ districts across 28 states, our certified field engineers ensure 24/7 uninterrupted milk collection and processing operations.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.5,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 36),

          // Services Grid
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: ResponsiveLayout.getMaxContainerWidth(screenWidth)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = ResponsiveLayout.getGridColumnCount(constraints.maxWidth, maxColumns: 3);
                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: crossAxisCount >= 3 ? 1.4 : (crossAxisCount == 2 ? 1.25 : 1.5),
                  children: [
                    _buildServiceCard(
                      context,
                      title: 'Customer & Tech Support',
                      icon: Icons.headset_mic_outlined,
                      desc: '24/7 dedicated helpline and rapid on-field technical support. Our engineers assist village operators with hardware inquiries, software rate chart setups, and step-by-step operational troubleshooting to keep your milk intake smooth.',
                      isDark: isDark,
                    ),
                    _buildServiceCard(
                      context,
                      title: 'Training & Education',
                      icon: Icons.school_outlined,
                      desc: 'Interactive on-site training workshops for village secretaries and collection staff. Covers proper equipment operation, daily ultrasonic cleaning routines, sensor handling, and accurate rate chart maintenance to prevent errors.',
                      isDark: isDark,
                    ),
                    _buildServiceCard(
                      context,
                      title: 'Maintenance & AMC',
                      icon: Icons.build_circle_outlined,
                      desc: 'Comprehensive and non-comprehensive Annual Maintenance Contracts (AMC) tailored for milk collection centers. Includes routine sensor recalibration, tubing replacements, channel flushing, and priority emergency repair visits.',
                      isDark: isDark,
                    ),
                    _buildServiceCard(
                      context,
                      title: 'Remote Monitoring',
                      icon: Icons.cell_tower_outlined,
                      desc: 'Proactive remote health tracking for AMCUs, DPUs, and milk testing terminals. Utilizes smart telemetry diagnostics to monitor device performance, detect sensor drift, and resolve system anomalies before downtime occurs.',
                      isDark: isDark,
                    ),
                    _buildServiceCard(
                      context,
                      title: 'Data Analytics & Reporting',
                      icon: Icons.analytics_outlined,
                      desc: 'Automated shift collection reports, member payment ledgers, and RMRD dock intake analytics. Provides dairy unions and management with real-time milk quantity, average fat/SNF trends, and seamless ERP data exports.',
                      isDark: isDark,
                    ),
                    _buildServiceCard(
                      context,
                      title: 'Calibration & QA',
                      icon: Icons.tune_outlined,
                      desc: 'Precision multi-point channel calibration using certified reference milk samples. Ensures ultrasonic and FTIR milk analyzers adhere strictly to ISO and dairy union quality control parameters for uncompromised accuracy.',
                      isDark: isDark,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),

          const SizedBox(height: 48),

          // CTA Box
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: ResponsiveLayout.getMaxContainerWidth(screenWidth)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0072CE), Color(0xFF0A2540)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Need Technical Support or Annual Maintenance (AMC)?',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Our field engineers are active in 300+ districts to keep your milk collection running smoothly.',
                        style: TextStyle(fontSize: 12.5, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => QuoteRequestSheet.show(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Request AMC Quote', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),

          const SizedBox(height: 48),

          // App Footer
          AppFooter(onNavigateToTab: onNavigateToTab),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String desc,
    required bool isDark,
  }) {
    return AnimatedHoverCard(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: const Color(0xFF0072CE), size: 22),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF0A2540),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.5,
                  color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
