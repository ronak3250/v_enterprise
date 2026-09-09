import 'package:flutter/material.dart';
import 'package:vinit_enterprise/widgets/animated_entrance.dart';
import 'package:vinit_enterprise/widgets/app_footer.dart';
import 'package:vinit_enterprise/utils/responsive.dart';

class AboutScreen extends StatelessWidget {
  final Function(int)? onNavigateToTab;

  const AboutScreen({
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
            padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 20),
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
                      'PAN-INDIA DAIRY AUTOMATION LEADERS',
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
                    'Precision Behind Purity: Cow-to-Consumer Dairy Tech',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 22 : 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'With over 25+ years of industry legacy, we pioneer advanced milk testing instruments, IoT collection systems, and cloud-connected dairy software across 28 states and 300+ districts in India.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // const SizedBox(height: 40),

          // Key Impact Statistics Bar
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 20),
          //   padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          //   decoration: BoxDecoration(
          //     color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
          //     borderRadius: BorderRadius.circular(20),
          //     border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withValues(alpha: 0.04),
          //         blurRadius: 16,
          //         offset: const Offset(0, 4),
          //       ),
          //     ],
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       _buildStatItem('25+', 'Years Legacy', isDark),
          //       _buildStatDivider(isDark),
          //       _buildStatItem('28+', 'States Covered', isDark),
          //       _buildStatDivider(isDark),
          //       _buildStatItem('300+', 'Districts Active', isDark),
          //       if (screenWidth >= 600) ...[
          //         _buildStatDivider(isDark),
          //         _buildStatItem('15,000+', 'AMCUs Installed', isDark),
          //       ],
          //     ],
          //   ),
          // ),

          const SizedBox(height: 48),

          // Detailed Company Overview
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: ResponsiveLayout.getMaxContainerWidth(screenWidth)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 800;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 6,
                      child: FadeSlideTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ABOUT VINIT ENTERPRISE',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0072CE), letterSpacing: 1.2),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Empowering Dairy Cooperatives & Unions with Intelligent Technology',
                              style: TextStyle(
                                fontSize: screenWidth < 600 ? 20 : 24,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : const Color(0xFF0A2540),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'Drawing deep technical expertise from Indian dairy leaders like STIPL, Everest Instruments, and Prompt Dairy Tech, Vinit Enterprise delivers state-of-the-art milk testing analyzers, Automatic Milk Collection Units (AMCU), Data Processing Units (DPU), and Cloud Procurement Portals.',
                              style: TextStyle(fontSize: 14, height: 1.6, color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'We solve the core challenges of raw milk procurement: eliminating measurement error, preventing adulteration, automating rate charts based on FAT/SNF, and facilitating instant transparent payments directly to dairy farmers.',
                              style: TextStyle(fontSize: 14, height: 1.6, color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isWide) const SizedBox(height: 24),
                    if (isWide) const SizedBox(width: 36),
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 5,
                      child: FadeSlideTransition(
                        delay: const Duration(milliseconds: 150),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/hero_dairy_equipment.png',
                            height: screenWidth < 600 ? 220 : 290,
                            width: double.infinity,
                            fit: BoxFit.contain,
                            errorBuilder: (ctx, e, st) => Container(
                              height: 250,
                              color: Colors.grey[800],
                              child: const Icon(Icons.precision_manufacturing, size: 64, color: Colors.white70),
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
        ),
      ),

          const SizedBox(height: 48),

          // Mission, Vision & Values Cards
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: ResponsiveLayout.getMaxContainerWidth(screenWidth)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 768;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  children: [
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 1,
                      child: _buildInfoBox(
                        context,
                        icon: Icons.explore_outlined,
                        title: 'Our Mission',
                        desc: 'To provide error-free ultrasonic milk analyzers, smart AMCUs, and real-time cloud portals that build unconditional trust between milk producers, village societies, and milk unions.',
                        isDark: isDark,
                      ),
                    ),
                    if (!isWide) const SizedBox(height: 16),
                    if (isWide) const SizedBox(width: 16),
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 1,
                      child: _buildInfoBox(
                        context,
                        icon: Icons.visibility_outlined,
                        title: 'Our Vision',
                        desc: 'To drive complete "Cow-to-Consumer" digital transformation across the Indian dairy supply chain, optimizing cold chain logistics, milk quality assurance, and rural farmer prosperity.',
                        isDark: isDark,
                      ),
                    ),
                    if (!isWide) const SizedBox(height: 16),
                    if (isWide) const SizedBox(width: 16),
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 1,
                      child: _buildInfoBox(
                        context,
                        icon: Icons.headset_mic_outlined,
                        title: '24/7 Support Culture',
                        desc: 'Products can be duplicated, but an unwavering customer support culture cannot. Our dedicated field engineers provide round-the-clock service across 300+ districts.',
                        isDark: isDark,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),

          const SizedBox(height: 48),

          // Core Industry Pillars / Strengths
          Container(
            width: double.infinity,
            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                Text(
                  'WHY LEADING DAIRY UNIONS CHOOSE US',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0072CE), letterSpacing: 1.2),
                ),
                const SizedBox(height: 8),
                Text(
                  'Unmatched Reliability & End-to-End Solutions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0A2540),
                  ),
                ),
                const SizedBox(height: 28),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildFeaturePillar(
                          context,
                          title: 'Double Sensor Technology',
                          desc: 'Dual ultrasonic sensors deliver sub-30 second milk analysis for Fat, SNF, Density, Protein, and Added Water.',
                          icon: Icons.sensors_rounded,
                          isDark: isDark,
                        ),
                        _buildFeaturePillar(
                          context,
                          title: 'Solar AMCU Off-Grid Capability',
                          desc: 'Green solar power charge controllers keep collection terminals active in remote rural societies during power outages.',
                          icon: Icons.solar_power_rounded,
                          isDark: isDark,
                        ),
                        _buildFeaturePillar(
                          context,
                          title: 'RMRD & Milk Union ERP Sync',
                          desc: 'Seamless data integration with Raw Milk Receiving Docks, society ledgers, and central union databases.',
                          icon: Icons.cloud_sync_rounded,
                          isDark: isDark,
                        ),
                        _buildFeaturePillar(
                          context,
                          title: 'PAN-India AMC Service Network',
                          desc: 'Comprehensive Annual Maintenance Contracts (AMC) backed by on-site calibration and technician training workshops.',
                          icon: Icons.handshake_rounded,
                          isDark: isDark,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // App Footer
          AppFooter(onNavigateToTab: onNavigateToTab),
        ],
      ),
    );
  }

  Widget _buildResponsiveFlexChild({
    required bool isWide,
    required int flex,
    required Widget child,
  }) {
    if (isWide) {
      return Expanded(
        flex: flex,
        child: child,
      );
    }
    return child;
  }

  Widget _buildStatItem(String number, String label, bool isDark) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0072CE),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider(bool isDark) {
    return Container(
      height: 30,
      width: 1,
      color: isDark ? Colors.grey[800] : Colors.grey[300],
    );
  }

  Widget _buildInfoBox(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String desc,
    required bool isDark,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF0072CE), size: 22),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF0A2540)),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: TextStyle(fontSize: 12.5, height: 1.5, color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturePillar(
    BuildContext context, {
    required String title,
    required String desc,
    required IconData icon,
    required bool isDark,
  }) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF0072CE).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF0072CE), size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF0A2540)),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: TextStyle(fontSize: 12, height: 1.5, color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
