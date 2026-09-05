import 'package:flutter/material.dart';
import 'package:vinit_enterprise/widgets/animated_entrance.dart';
import 'package:vinit_enterprise/widgets/app_footer.dart';
import 'package:vinit_enterprise/widgets/dairy_lottie_widget.dart';

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
          // Header Banner with Lottie Milk Testing Animation
          Container(
            width: double.infinity,
            color: const Color(0xFF07142A),
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            child: FadeSlideTransition(
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                    width: 90,
                    child: DairyLottieWidget(
                      assetName: 'assets/about_factory_animation.json',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Engineering Reliable Solutions for the Dairy Industry',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Dedicated to precision, innovation, and dependable after-sales service for milk collection centers and processing plants.',
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

          // Company Overview Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 800;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left Text
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 6,
                      child: FadeSlideTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'COMPANY OVERVIEW',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0072CE), letterSpacing: 1),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Vinit Enterprise — Trusted Name in Dairy Instrumentation',
                              style: TextStyle(
                                fontSize: screenWidth < 600 ? 20 : 24,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : const Color(0xFF0A2540),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'Vinit Enterprise is a modern industrial manufacturer and supplier specializing in milk testing equipment, automatic milk collection terminals, electronic weighing systems, and ultrasonic sample stirrers.',
                              style: TextStyle(fontSize: 14, height: 1.5, color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'We understand that accurate milk fat and SNF measurements directly impact fair pricing and farmer trust in collection centers. Hence, our equipment is built with high-grade sensors, durable stainless steel housing, and user-friendly digital interfaces.',
                              style: TextStyle(fontSize: 14, height: 1.5, color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isWide) const SizedBox(height: 24),
                    if (isWide) const SizedBox(width: 32),
                    // Right Image
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 5,
                      child: FadeSlideTransition(
                        delay: const Duration(milliseconds: 150),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/hero_dairy_equipment.jpg',
                            height: screenWidth < 600 ? 220 : 280,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, e, st) => Container(
                              height: screenWidth < 600 ? 220 : 280,
                              color: Colors.grey[300],
                              child: const Icon(Icons.precision_manufacturing, size: 64, color: Colors.grey),
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

          // Mission & Vision Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  children: [
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 1,
                      child: AnimatedHoverCard(
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.explore_outlined, color: Color(0xFF0072CE), size: 24),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Our Mission',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF0A2540)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'To provide dependable, innovative, and accurate dairy equipment that enables dairy cooperatives, centers, and processing units to improve milk quality measurement, operational productivity, and fair transaction trust.',
                                  style: TextStyle(fontSize: 13, height: 1.5, color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (!isWide) const SizedBox(height: 20),
                    if (isWide) const SizedBox(width: 20),
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 1,
                      child: AnimatedHoverCard(
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.visibility_outlined, color: Color(0xFF0072CE), size: 24),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Our Vision',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF0A2540)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'To become a leading, trusted equipment and technology partner across the milk testing and dairy automation sector through continuous engineering refinement, product quality, and responsive service support.',
                                  style: TextStyle(fontSize: 13, height: 1.5, color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600]),
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

          // Core Values Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'WHAT DRIVES US',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0072CE), letterSpacing: 1),
                ),
                const SizedBox(height: 6),
                Text(
                  'Our Core Values',
                  style: TextStyle(fontSize: screenWidth < 600 ? 20 : 24, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF0A2540)),
                ),
                const SizedBox(height: 32),
                GridView.count(
                  crossAxisCount: screenWidth > 800 ? 3 : (screenWidth > 550 ? 2 : 1),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: screenWidth > 800 ? 1.4 : (screenWidth > 550 ? 1.4 : 1.8),
                  children: [
                    _buildValueCard(context, Icons.military_tech_outlined, 'Quality First', 'Every component and instrument undergoes stringent multi-stage inspection prior to deployment.', isDark),
                    _buildValueCard(context, Icons.lightbulb_outline, 'Engineering Innovation', 'Integrating digital loggers, ultrasonic sensors, and smart interfaces for modern dairy requirements.', isDark),
                    _buildValueCard(context, Icons.balance_outlined, 'Integrity & Precision', 'Transparent business practices and uncompromised accuracy in measurement instruments.', isDark),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Footer
          AppFooter(onNavigateToTab: onNavigateToTab),
        ],
      ),
    );
  }

  Widget _buildValueCard(BuildContext context, IconData icon, String title, String desc, bool isDark) {
    return AnimatedHoverCard(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: const Color(0xFF0072CE), size: 24),
              ),
              const SizedBox(height: 14),
              Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF0A2540))),
              const SizedBox(height: 6),
              Text(desc, style: TextStyle(fontSize: 12, height: 1.4, color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600])),
            ],
          ),
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
