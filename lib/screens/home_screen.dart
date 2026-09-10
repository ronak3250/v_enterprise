import 'package:flutter/material.dart';
import 'package:vinit_enterprise/models/product_model.dart';

import 'package:vinit_enterprise/widgets/animated_entrance.dart';
import 'package:vinit_enterprise/widgets/app_footer.dart';
import 'package:vinit_enterprise/widgets/brochure_viewer.dart';
import 'package:vinit_enterprise/widgets/dairy_domain_ui.dart';
import 'package:vinit_enterprise/widgets/dairy_lottie_widget.dart';
import 'package:vinit_enterprise/widgets/product_card_widget.dart';
import 'package:vinit_enterprise/widgets/quote_request_sheet.dart';
import 'package:vinit_enterprise/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onNavigateToTab;

  const HomeScreen({super.key, required this.onNavigateToTab});



  void _openCorporateBrochure(BuildContext context) {
    BrochureViewerDialog.show(
      context,
      title: 'Vinit Enterprise Product Catalog Brochure',
      brochurePath: ProductCatalog.allBrochurePaths.first,
      allBrochures: ProductCatalog.allBrochurePaths,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. HERO SECTION WITH HIGH-CONVERTING COPY
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [const Color(0xFF0F172A), const Color(0xFF1E293B)]
                    : [const Color(0xFF07142A), const Color(0xFF0A2540)],
              ),
            ),
            padding: EdgeInsets.fromLTRB(
              screenWidth < 600 ? 16 : 24,
              screenWidth < 600 ? 24 : 40,
              screenWidth < 600 ? 16 : 24,
              screenWidth < 600 ? 32 : 52,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: ResponsiveLayout.getMaxContainerWidth(screenWidth)),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth >= 850;
                    return Column(
                      children: [
                        Flex(
                          direction: isWide ? Axis.horizontal : Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left Content
                            _buildResponsiveFlexChild(
                              isWide: isWide,
                              flex: 5,
                              child: FadeSlideTransition(
                                duration: const Duration(milliseconds: 700),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const DairyMilkDropBadge(
                                      text:
                                          'Food-Grade SS-304 Certified Dairy Equipment',
                                      icon: Icons.water_drop,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Innovative Solutions for a\nHealthier Dairy Future',
                                      style: TextStyle(
                                        fontSize: screenWidth < 600
                                            ? 24
                                            : (screenWidth >= 1600 ? 42 : (screenWidth < 1200 ? 28 : 34)),
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        height: 1.2,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Text(
                                      'Comprehensive product suite including Milk Analyzers, Portable Milk Analyzers, Sample Testing Equipment, Milk Weighing Scales, Ultrasonic Stirrers, and Smart DPU engineered for 99.8% measurement accuracy.',
                                      style: TextStyle(
                                        fontSize: screenWidth < 600
                                            ? 13
                                            : (screenWidth >= 1600 ? 17.5 : (screenWidth < 1200 ? 14 : 15)),
                                        color: Colors.white.withValues(alpha: 0.90),
                                        height: 1.45,
                                      ),
                                    ),
                                    const SizedBox(height: 18),

                                    // Feature Highlight Chips
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        _buildHeroHighlightChip('Milk Analyzer'),
                                        _buildHeroHighlightChip(
                                          'Portable Milk Analyzer',
                                        ),
                                        _buildHeroHighlightChip(
                                          'Sample Testing Equipment',
                                        ),
                                        _buildHeroHighlightChip(
                                          'Milk Weighing Scale',
                                        ),
                                        _buildHeroHighlightChip(
                                          'Ultrasonic Stirrer',
                                        ),
                                        _buildHeroHighlightChip(
                                          'DPU / Data Processor Unit',
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 24),
                                    Wrap(
                                      spacing: 12,
                                      runSpacing: 12,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () =>
                                              QuoteRequestSheet.show(context),
                                          icon: Icon(
                                            Icons.send_rounded,
                                            color: Colors.white,
                                            size: screenWidth >= 1600 ? 19 : 17,
                                          ),
                                          label: Text(
                                            'Get Quote & Pricing',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: screenWidth >= 1600 ? 15.5 : 14,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(
                                              0xFF0072CE,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth >= 1600
                                                  ? 26
                                                  : (screenWidth < 1200 ? 18 : 22),
                                              vertical: screenWidth >= 1600 ? 16 : 14,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 4,
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () =>
                                              _openCorporateBrochure(context),
                                          icon: Icon(
                                            Icons.picture_as_pdf_rounded,
                                            color: Colors.white,
                                            size: screenWidth >= 1600 ? 19 : 17,
                                          ),
                                          label: Text(
                                            'View Brochure',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: screenWidth >= 1600 ? 15.5 : 14,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(
                                              0xFF10B981,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth >= 1600
                                                  ? 26
                                                  : (screenWidth < 1200 ? 18 : 22),
                                              vertical: screenWidth >= 1600 ? 16 : 14,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 4,
                                          ),
                                        ),
                                        OutlinedButton.icon(
                                          onPressed: () => onNavigateToTab(3),
                                          icon: Icon(
                                            Icons.inventory_2_outlined,
                                            color: Colors.white,
                                            size: screenWidth >= 1600 ? 19 : 17,
                                          ),
                                          label: Text(
                                            'Explore Catalog',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenWidth >= 1600 ? 15.5 : 14,
                                            ),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                              color: Colors.white,
                                              width: 1.5,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth >= 1600
                                                  ? 26
                                                  : (screenWidth < 1200 ? 18 : 22),
                                              vertical: screenWidth >= 1600 ? 16 : 14,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            if (!isWide) const SizedBox(height: 32),

                            // Right Hero Equipment Graphic Showcase (Enlarged on 17.3"+ displays)
                            _buildResponsiveFlexChild(
                              isWide: isWide,
                              flex: 5,
                              child: Center(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: isWide
                                        ? (screenWidth >= 1600 ? 580 : (screenWidth < 1200 ? 390 : 460))
                                        : 360,
                                    maxWidth: double.infinity,
                                  ),
                                  child: Image.asset(
                                    'assets/hero_dairy_equipment.png',
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    errorBuilder: (ctx, e, st) =>
                                        DairyLottieWidget.milkTesting(
                                      width: 140,
                                      height: 140,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),

          // 2. COMPACT TRUST STATS BAR
          // FadeSlideTransition(
          //   delay: const Duration(milliseconds: 150),
          //   child: Container(
          //     width: double.infinity,
          //     color: isDark ? const Color(0xFF1E293B) : Colors.white,
          //     padding: const EdgeInsets.only(
          //       bottom: 0,
          //       top: 30,
          //       left: 16,right: 16,
          //     ),
          //     child: LayoutBuilder(
          //       builder: (context, constraints) {
          //         final isMobile = constraints.maxWidth < 600;
          //
          //         final stats = [
          //           ('10+', 'Years of Industry Expertise'),
          //           ('50+', 'Dairy & Equipment Solutions'),
          //           ('500+', 'Installations & Satisfied Clients'),
          //           ('24/7', 'Technical Support Assistance'),
          //         ];
          //
          //         if (isMobile) {
          //           return GridView.builder(
          //             shrinkWrap: true,
          //             physics: const NeverScrollableScrollPhysics(),
          //             itemCount: stats.length,
          //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 2,
          //               mainAxisSpacing: 22,
          //               crossAxisSpacing: 12,
          //               childAspectRatio: 1.8,
          //             ),
          //             itemBuilder: (context, index) {
          //               return _buildStatItem(
          //                 stats[index].$1,
          //                 stats[index].$2,
          //                 isDark,
          //               );
          //             },
          //           );
          //         }
          //
          //         return Row(
          //           children: [
          //             for (int i = 0; i < stats.length; i++) ...[
          //               Expanded(
          //                 child: _buildStatItem(
          //                   stats[i].$1,
          //                   stats[i].$2,
          //                   isDark,
          //                 ),
          //               ),
          //               if (i < stats.length - 1)
          //                 Container(
          //                   height: 55,
          //                   width: 1,
          //                   color: isDark
          //                       ? Colors.white.withOpacity(0.12)
          //                       : Colors.black.withOpacity(0.08),
          //                 ),
          //             ],
          //           ],
          //         );
          //       },
          //     ),
          //   ),
          // ),

          // const SizedBox(height: 36),

          // 3. ABOUT PREVIEW SECTION
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: LayoutBuilder(
          //     builder: (context, constraints) {
          //       final isWide = constraints.maxWidth > 800;
          //       return Flex(
          //         direction: isWide ? Axis.horizontal : Axis.vertical,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           // Left Image Box
          //           _buildResponsiveFlexChild(
          //             isWide: isWide,
          //             flex: 5,
          //             child: FadeSlideTransition(
          //               child: FuturisticTechFrame(
          //                 glowColor: const Color(0xFF38BDF8),
          //                 child: Container(
          //                   height: screenWidth < 600 ? 220 : 280,
          //                   width: double.infinity,
          //                   padding: const EdgeInsets.all(12),
          //                   child: Image.asset(
          //                     'assets/dairy_automation_system.jpg',
          //                     fit: BoxFit.contain,
          //                     errorBuilder: (ctx, e, st) => const Icon(
          //                       Icons.settings_suggest,
          //                       size: 64,
          //                       color: Colors.grey,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           if (!isWide) const SizedBox(height: 20),
          //           if (isWide) const SizedBox(width: 32),
          //           // Right Content
          //           _buildResponsiveFlexChild(
          //             isWide: isWide,
          //             flex: 6,
          //             child: FadeSlideTransition(
          //               delay: const Duration(milliseconds: 150),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   const Text(
          //                     'ABOUT VINIT ENTERPRISE',
          //                     style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold,
          //                       color: Color(0xFF0072CE),
          //                       letterSpacing: 1.0,
          //                     ),
          //                   ),
          //                   const SizedBox(height: 6),
          //                   Text(
          //                     'Engineering Better Solutions for the Dairy Industry',
          //                     style: TextStyle(
          //                       fontSize: screenWidth < 600 ? 20 : 24,
          //                       fontWeight: FontWeight.bold,
          //                       color: isDark
          //                           ? Colors.white
          //                           : const Color(0xFF0A2540),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 12),
          //                   Text(
          //                     'Vinit Enterprise is a modern industrial manufacturer specializing in milk testing equipment, automatic milk collection terminals, electronic weighing systems, and ultrasonic sample stirrers.',
          //                     style: TextStyle(
          //                       fontSize: 13.5,
          //                       height: 1.5,
          //                       color: isDark
          //                           ? const Color(0xFFCBD5E1)
          //                           : const Color(0xFF475569),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 16),
          //                   _buildCheckItem(
          //                     'Precision Milk Testing',
          //                     'Automated Collection',
          //                     isDark,
          //                     screenWidth,
          //                   ),
          //                   const SizedBox(height: 10),
          //                   _buildCheckItem(
          //                     'Heavy-Duty Weighing Scales',
          //                     '24/7 Installation & Support',
          //                     isDark,
          //                     screenWidth,
          //                   ),
          //                   const SizedBox(height: 20),
          //                   OutlinedButton.icon(
          //                     onPressed: () => onNavigateToTab(1),
          //                     icon: const Icon(
          //                       Icons.arrow_forward,
          //                       size: 16,
          //                       color: Color(0xFF0072CE),
          //                     ),
          //                     label: const Text(
          //                       'Learn More',
          //                       style: TextStyle(
          //                         color: Color(0xFF0072CE),
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     style: OutlinedButton.styleFrom(
          //                       side: const BorderSide(
          //                         color: Color(0xFF0072CE),
          //                       ),
          //                       padding: const EdgeInsets.symmetric(
          //                         horizontal: 18,
          //                         vertical: 12,
          //                       ),
          //                       shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(8),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),

          const SizedBox(height: 44),

          // 4. EXPERT SERVICES (COMPACT HORIZONTAL ACCORDION / TIGHT CARDS WITH ZERO EMPTY SPACE)
          Container(
            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'EXPERT SERVICES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0072CE),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Complete Dairy Equipment & Support Solutions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 20 : (screenWidth >= 1600 ? 28 : 24),
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0A2540),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'End-to-end services tailored to village milk collection centers and processing plants.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth >= 1600 ? 14.5 : 13,
                    color: isDark ? const Color(0xFF94A3B8) : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),

                // Compact Tight Service Grid (childAspectRatio 2.2 to remove blank space)
                GridView.count(
                  crossAxisCount: screenWidth > 800
                      ? 3
                      : (screenWidth > 550 ? 2 : 1),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: screenWidth >= 1600
                      ? 1.9
                      : (screenWidth > 800 ? 1.4 : (screenWidth > 550 ? 1.2 : 1.5)),
                  children: [
                    _buildServiceCard(
                      context,
                      Icons.science_outlined,
                      'Milk Testing Solutions',
                      'High-precision ultrasonic analyzers for instant, automated testing of Fat, SNF, Added Water, Density, and Protein. Delivers tamper-proof quality results in under 30 seconds per sample with minimal upkeep.',
                      () => onNavigateToTab(2),
                    ),
                    _buildServiceCard(
                      context,
                      Icons.memory_outlined,
                      'Milk Collection Systems',
                      'Turnkey AMCU & DPU integration connecting milk analyzers, weighing scales, smart thermal printers, and cloud servers. Eliminates manual logbook entry errors while printing instant farmer payment receipts.',
                      () => onNavigateToTab(2),
                    ),
                    _buildServiceCard(
                      context,
                      Icons.build_circle_outlined,
                      'Dairy Equipment Installation',
                      'Hassle-free on-site commissioning by experienced field engineers. Handles complete hardware mounting, electrical wiring, network setup, sensor calibration, and hands-on staff training.',
                      () => onNavigateToTab(2),
                    ),
                    _buildServiceCard(
                      context,
                      Icons.settings_outlined,
                      'Equipment Maintenance',
                      'Preventive care programs and ultrasonic channel cleaning services. Keeps your testing sensors and scales operating flawlessly during peak morning and evening intake cycles to prevent unexpected downtime.',
                      () => onNavigateToTab(2),
                    ),
                    _buildServiceCard(
                      context,
                      Icons.support_agent_outlined,
                      'Technical Support',
                      'Dedicated hotline assistance and rapid field technician dispatch for quick troubleshooting. Priority availability of genuine spare parts guarantees continuous, uninterrupted collection operations year-round.',
                      () => onNavigateToTab(2),
                    ),
                    _buildServiceCard(
                      context,
                      Icons.tune_outlined,
                      'Customized Dairy Solutions',
                      'Tailor-made automation panel configurations, rate chart formulas, and localized software setups. Designed to align perfectly with regional society guidelines and central dairy cooperative ERP systems.',
                      () => onNavigateToTab(2),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 44),

          // 5. OUR FEATURED PRODUCTS (TIGHT STAINLESS STEEL METALLIC CARDS WITH ZERO EMPTY SPACE)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'OUR PRODUCTS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0072CE),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Our Featured Dairy Equipment',
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 20 : (screenWidth >= 1600 ? 28 : 24),
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0A2540),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'High precision milk analyzers, automated collection terminals, electronic scales, and accessories.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth >= 1600 ? 14.5 : 13,
                    color: isDark ? const Color(0xFF94A3B8) : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),

                // Product Cards Grid with Dynamic Aspect Ratio (FIXED 238px HEIGHT ON ANY SCREEN)
                LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = ResponsiveLayout.getGridColumnCount(constraints.maxWidth);
                    const crossAxisSpacing = 16.0;
                    final totalSpacing =
                        (crossAxisCount - 1) * crossAxisSpacing;
                    final itemWidth =
                        (constraints.maxWidth - totalSpacing) / crossAxisCount;
                    const targetHeight = 335.0;
                    final childAspectRatio = itemWidth / targetHeight;
                    final productCount = crossAxisCount >= 4 ? 4 : 3;

                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: crossAxisSpacing,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                      children: ProductCatalog.sampleProducts.take(productCount).map((
                        product,
                      ) {
                        return ProductCardWidget(product: product);
                      }).toList(),
                    );
                  },
                ),

                const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => onNavigateToTab(3),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0072CE),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.inventory_2_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'View Complete Product Catalog',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
              ],
            ),
          ),
          const SizedBox(height: 44),

          // LIVE VIDEO DEMONSTRATION SECTION (EKOMILK & WEIGHING SCALE MOBILE SYNC)
          _buildVideoDemoSection(context, isDark, screenWidth),

          const SizedBox(height: 44),

          // 6. WHY CHOOSE US (COMPACT DARK BENTO GRID)
          Container(
            color: const Color(0xFF07142A),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'WHY CHOOSE US',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF38BDF8),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Built on Precision. Trusted for Performance.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Empowering dairy cooperatives with transparency, accuracy, and robust engineering.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 24),

                // Compact Bento Cards (childAspectRatio 2.5)
                GridView.count(
                  crossAxisCount: screenWidth > 800
                      ? 3
                      : (screenWidth > 550 ? 2 : 1),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: screenWidth >= 1600
                      ? 1.8
                      : (screenWidth > 800 ? 1.35 : (screenWidth > 550 ? 1.15 : 1.45)),
                  children: [
                    _buildDarkFeatureCard(
                      Icons.verified_outlined,
                      'Uncompromising Accuracy',
                      'Calibrated ultrasonic sensors engineered for 99.8% repeat measurement accuracy. Built to maintain continuous precision during morning milk rushes, ensuring transparent and fair farmer payouts.',
                    ),
                    _buildDarkFeatureCard(
                      Icons.shield_outlined,
                      'Reliable Quality',
                      'Fabricated with food-grade SS-304 stainless steel and industrial-grade circuitry. Resists acidic milk washdown solutions, dust, humidity, and daily wear in tough rural collection environments.',
                    ),
                    _buildDarkFeatureCard(
                      Icons.workspace_premium_outlined,
                      'Industry Expertise',
                      'Over 10 years of specialized engineering experience in dairy collection automation. Deep operational knowledge of village collection centers, cooperative workflows, and industrial dairy needs.',
                    ),
                    _buildDarkFeatureCard(
                      Icons.support_agent_outlined,
                      'Complete Support',
                      'Comprehensive operational guidance from field installation and operator training to preventive care. Backed by a responsive 24/7 technical helpdesk and prompt on-site field services.',
                    ),
                    _buildDarkFeatureCard(
                      Icons.memory_outlined,
                      'Customized Solutions',
                      'Flexible hardware layouts and adaptable software options built for your workflow. Includes custom rate charts, Bluetooth/USB data logging, and seamless cloud ERP API integrations.',
                    ),
                    _buildDarkFeatureCard(
                      Icons.handshake_outlined,
                      'Long-term Partnership',
                      'We prioritize transparent communication, honest pricing, and dedicated after-sales service. Readily available genuine spare parts and long-term AMCs keep your investment yielding value for years.',
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 44),

          // 7. OUR STRUCTURED 4-STEP PROCESS (INTERCONNECTED HORIZONTAL PROCESS TIMELINE)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'HOW WE WORK',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0072CE),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Our Structured 4-Step Process',
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0A2540),
                  ),
                ),
                const SizedBox(height: 24),

                // Compact Step Timeline Grid (childAspectRatio 2.0 to eliminate vertical empty space)
                GridView.count(
                  crossAxisCount: screenWidth > 800
                      ? 4
                      : (screenWidth > 500 ? 2 : 1),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: screenWidth >= 1600
                      ? 1.5
                      : (screenWidth > 800 ? 1.2 : (screenWidth > 500 ? 1.1 : 1.45)),
                  children: [
                    _buildStepCard(
                      context,
                      '1',
                      'Requirement Assessment',
                      'We evaluate your village collection center or dairy plant layout, daily milk volume, and infrastructure to determine the exact testing speed, hardware units, and software setup required.',
                    ),
                    _buildStepCard(
                      context,
                      '2',
                      'Tailored Proposal',
                      'Our engineering team recommends an ideal solution package matching your budget. We select optimal milk analyzer models, digital weighing scales, stirrers, rate charts, and data processors.',
                    ),
                    _buildStepCard(
                      context,
                      '3',
                      'Installation & Training',
                      'Certified technicians execute complete hardware mounting, cabling, sensor calibration, and device pairing. We provide hands-on operator training for local staff to ensure immediate, smooth intake.',
                    ),
                    _buildStepCard(
                      context,
                      '4',
                      'Support & Maintenance',
                      'Continuous post-deployment backing with scheduled preventive maintenance, routine sensor recalibration, fast spare part delivery, and helpline support to keep your operations zero-downtime.',
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 44),

          // 8. CALL TO ACTION BANNER
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0072CE), Color(0xFF0A2540)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildResponsiveFlexChild(
                      isWide: isWide,
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Looking for the Right Dairy Equipment?',
                            style: TextStyle(
                              fontSize: screenWidth < 600 ? 18 : 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Get in touch with our sales team for equipment pricing, product brochures, or custom plant quotes.',
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!isWide) const SizedBox(height: 18),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => QuoteRequestSheet.show(context),
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Color(0xFF0A2540),
                            size: 16,
                          ),
                          label: const Text(
                            'Request a Quote',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A2540),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () => onNavigateToTab(4),
                          icon: const Icon(
                            Icons.phone_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                          label: const Text(
                            'Contact Our Team',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 44),

          // 9. FOOTER
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
      return Expanded(flex: flex, child: child);
    }
    return child;
  }

  Widget _buildHeroHighlightChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Color(0xFF10B981),
            size: 14,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildServiceCard(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
    VoidCallback onTap,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimatedHoverCard(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFF0072CE), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                    desc,
                    style: TextStyle(
                      fontSize: 11.5,
                      color: isDark
                          ? const Color(0xFFCBD5E1)
                          : Colors.grey[600],
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

  Widget _buildDarkFeatureCard(IconData icon, String title, String desc) {
    return AnimatedHoverCard(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF38BDF8), size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFCBD5E1),
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

  Widget _buildStepCard(
    BuildContext context,
    String num,
    String title,
    String desc,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimatedHoverCard(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF0072CE).withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Text(
                num,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0072CE),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF0A2540),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 10.5,
                      color: isDark
                          ? const Color(0xFFCBD5E1)
                          : Colors.grey[600],
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

  Widget _buildVideoDemoSection(BuildContext context, bool isDark, double screenWidth) {
    final isWide = screenWidth > 800;
    return Container(
      width: double.infinity,
      color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.play_circle_fill_rounded, color: Colors.red, size: 20),
              const SizedBox(width: 8),
              const Text(
                'LIVE VIDEO DEMONSTRATION',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0072CE),
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Direct Ekomilk & Weighing Scale Mobile Data Sync',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth < 600 ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0A2540),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Watch how our mobile app connects via Bluetooth to capture weight & milk testing parameters (Fat, SNF, Water) with zero manual typing.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: isDark ? const Color(0xFF94A3B8) : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 28),

          Flex(
            direction: isWide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Video Showcase Box
              _buildResponsiveFlexChild(
                isWide: isWide,
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF07142A),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.bluetooth_connected, color: Colors.redAccent, size: 14),
                            SizedBox(width: 6),
                            Text(
                              'Live Hardware Bluetooth Sync',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/vinit_dairy_product_suite.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (ctx, e, st) => Container(color: Colors.black),
                              ),
                              Container(
                                color: Colors.black.withValues(alpha: 0.45),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0072CE),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF0072CE).withValues(alpha: 0.6),
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Click to Play Live Video Demo',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Demo: EKOMILK Analyzer + Weighing Scale Machine → Instant Mobile App Transfer',
                        style: TextStyle(fontSize: 11.5, color: Color(0xFF94A3B8)),
                      ),
                    ],
                  ),
                ),
              ),

              if (!isWide) const SizedBox(height: 24),
              if (isWide) const SizedBox(width: 28),

              // Right Steps List
              _buildResponsiveFlexChild(
                isWide: isWide,
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildVideoStepItem(
                      Icons.bluetooth_rounded,
                      '1. Automatic Bluetooth Pairing',
                      'App connects automatically to weighing scale load cell & EKOMILK analyzer.',
                      isDark,
                    ),
                    const SizedBox(height: 12),
                    _buildVideoStepItem(
                      Icons.science_rounded,
                      '2. Real-Time Fat & SNF Transfer',
                      'Fat%, SNF%, and Added Water% parameters populate directly on phone screen.',
                      isDark,
                    ),
                    const SizedBox(height: 12),
                    _buildVideoStepItem(
                      Icons.scale_rounded,
                      '3. Zero-Error Weight Sync',
                      'Milk weight locks automatically from scale without manual operator typing.',
                      isDark,
                    ),
                    const SizedBox(height: 12),
                    _buildVideoStepItem(
                      Icons.receipt_long_rounded,
                      '4. Instant Slip & Cloud Record',
                      'Calculates payout per rate chart, prints receipt & sends farmer SMS alert.',
                      isDark,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => QuoteRequestSheet.show(context, initialProduct: 'Mobile App & Scale Sync Setup'),
                      icon: const Icon(Icons.videocam_rounded, color: Colors.white, size: 18),
                      label: const Text('Request Live Demo Setup', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0072CE),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVideoStepItem(IconData icon, String title, String desc, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF0072CE).withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF0072CE), size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF0A2540),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 11.5,
                  color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

