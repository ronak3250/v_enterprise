import 'package:flutter/material.dart';
import 'package:vinit_enterprise/widgets/animated_entrance.dart';
import 'package:vinit_enterprise/widgets/app_footer.dart';
import 'package:vinit_enterprise/widgets/dairy_lottie_widget.dart';
import 'package:vinit_enterprise/widgets/quote_request_sheet.dart';

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
          // Header Banner with Page-Specific Maintenance Lottie Graphic
          Container(
            width: double.infinity,
            color: const Color(0xFF07142A),
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            child: FadeSlideTransition(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                    width: 100,
                    child: DairyLottieWidget(
                      assetName: 'assets/services_maintenance_animation.json',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Comprehensive Milk Testing & Technical Support Services',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'We offer end-to-end installation, ultrasonic calibration, and support services to keep your milk collection center operating without disruption.',
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

          // Services Cards List with Tailored Page-Specific Lottie Animations
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 768;
                return GridView.count(
                  crossAxisCount: isWide ? 2 : 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isWide ? 2.0 : 1.7,
                  children: [
                    _buildServiceCard(
                      context,
                      title: 'Milk Testing & Analysis',
                      lottieAsset: 'assets/milk_testing_animation.json',
                      icon: Icons.science_outlined,
                      desc: 'Reliable ultrasonic equipment for raw milk composition testing. Measures Fat (0.01% to 12%), SNF (3% to 15%), Density, Protein, and Added Water.',
                      isDark: isDark,
                    ),
                    _buildServiceCard(
                      context,
                      title: 'Milk Collection Integration',
                      lottieAsset: 'assets/services_cloud_amcu_animation.json',
                      icon: Icons.memory_outlined,
                      desc: 'Turnkey setup of Automatic Milk Collection Units (AMCU) and Data Processing Units (DPU). Connects weighing scales and member card scanners.',
                      isDark: isDark,
                    ),
                    _buildServiceCard(
                      context,
                      title: 'Calibration & Installation',
                      lottieAsset: 'assets/services_maintenance_animation.json',
                      icon: Icons.build_circle_outlined,
                      desc: 'Skilled technicians perform complete hardware mounting, cabling, ultrasonic channel calibration with standard samples, and operator training.',
                      isDark: isDark,
                    ),
                    _buildServiceCard(
                      context,
                      title: 'AMC & Preventive Maintenance',
                      lottieAsset: 'assets/contact_support_animation.json',
                      icon: Icons.settings_outlined,
                      desc: 'Routine preventive maintenance visits, thorough cleaning of ultrasonic channels, sensor alignment, and Annual Maintenance Contracts (AMC).',
                      isDark: isDark,
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 48),

          // CTA Box
          Container(
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
                        'Need Technical Assistance or Maintenance?',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Our field engineers are ready to support your milk collection operations.',
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
                  child: const Text('Contact Support', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required String lottieAsset,
    required IconData icon,
    required String desc,
    required bool isDark,
  }) {
    return AnimatedHoverCard(
      child: Container(
        padding: const EdgeInsets.all(18),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DairyLottieWidget(
                    assetName: lottieAsset,
                    width: 36,
                    height: 36,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF0A2540),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: TextStyle(
                fontSize: 12.5,
                height: 1.4,
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => QuoteRequestSheet.show(context),
              icon: const Icon(Icons.support_agent, size: 14, color: Color(0xFF0072CE)),
              label: const Text('Talk to an Expert', style: TextStyle(color: Color(0xFF0072CE), fontSize: 12, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF0072CE)),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
