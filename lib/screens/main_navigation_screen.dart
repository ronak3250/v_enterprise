import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinit_enterprise/providers/theme_provider.dart';
import 'package:vinit_enterprise/screens/about_screen.dart';
import 'package:vinit_enterprise/screens/contact_screen.dart';
import 'package:vinit_enterprise/screens/home_screen.dart';
import 'package:vinit_enterprise/screens/products_screen.dart';
import 'package:vinit_enterprise/screens/services_screen.dart';
import 'package:vinit_enterprise/widgets/adaptive_logo.dart';
import 'package:vinit_enterprise/widgets/quote_request_sheet.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _openWhatsApp() async {
    const phone = "919173251191";
    final text = Uri.encodeComponent(
      "Hello Vinit Enterprise team, I would like to inquire about your milk testing and dairy equipment.",
    );
    final url = Uri.parse("https://wa.me/$phone?text=$text");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;

    final List<Widget> pages = [
      HomeScreen(onNavigateToTab: _onTabTapped),
      AboutScreen(onNavigateToTab: _onTabTapped),
      ServicesScreen(onNavigateToTab: _onTabTapped),
      ProductsScreen(onNavigateToTab: _onTabTapped),
      ContactScreen(onNavigateToTab: _onTabTapped),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isDesktop ? 98 : 114),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Contact Announcement Bar (Full Edge-to-Edge Width)
              Container(
                width: double.infinity,
                color: isDark
                    ? const Color(0xFF040D1B)
                    : const Color(0xFFF1F5F9),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 16,
                    runSpacing: 6,
                    children: [
                      InkWell(
                        onTap: () => _launchUrl('tel:+919173251191'),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Color(0xFF0072CE),
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '+91 91732 51191',
                              style: TextStyle(
                                color: isDark
                                    ? Colors.white
                                    : const Color(0xFF0A2540),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () => _launchUrl(
                          'mailto:info@vinitenterprise.com',
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.email,
                              color: Color(0xFF0072CE),
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'info@vinitenterprise.com',
                              style: TextStyle(
                                color: isDark
                                    ? Colors.white
                                    : const Color(0xFF0A2540),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF0072CE),
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Mon - Sat: 10:00 AM - 7:00 PM',
                            style: TextStyle(
                              color: isDark
                                  ? Colors.white70
                                  : const Color(0xFF475569),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 8,
                      //     vertical: 2,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: isDark
                      //         ? const Color(0xFF10B981).withValues(alpha: 0.2)
                      //         : const Color(0xFFD1FAE5),
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(
                      //       color: isDark
                      //           ? const Color(0xFF10B981).withValues(alpha: 0.3)
                      //           : const Color(0xFF6EE7B7),
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       // Icon(
                      //       //   Icons.shield_outlined,
                      //       //   color: isDark
                      //       //       ? const Color(0xFF10B981)
                      //       //       : const Color(0xFF059669),
                      //       //   size: 12,
                      //       // ),
                      //       const SizedBox(width: 4),
                      //       // Text(
                      //       //   'ISO Certified',
                      //       //   style: TextStyle(
                      //       //     color: isDark
                      //       //         ? const Color(0xFF10B981)
                      //       //         : const Color(0xFF059669),
                      //       //     fontSize: 10,
                      //       //     fontWeight: FontWeight.bold,
                      //       //   ),
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              // Main Header Navbar
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F172A) : Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
                      width: 1,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    // Mobile Hamburger Drawer Icon
                    if (!isDesktop)
                      Builder(
                        builder: (context) => IconButton(
                          icon: Icon(Icons.menu, color: isDark ? Colors.white : const Color(0xFF0A2540)),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),

                    // Official Adaptive & Animated Logo
                    InkWell(
                      onTap: () => _onTabTapped(0),
                      child: AdaptiveLogoTop(height: isDesktop ? 34 : 26),
                    ),

                    const Spacer(),

                    // Full Desktop Header Links
                    if (isDesktop)
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildDesktopNavBtn('Home', 0, isDark),
                              _buildDesktopNavBtn('About Us', 1, isDark),
                              _buildDesktopNavBtn('Services', 2, isDark),
                              _buildDesktopNavBtn('Products', 3, isDark),
                              _buildDesktopNavBtn('Contact', 4, isDark),
                            ],
                          ),
                        ),
                      ),

                    // IconButton(
                    //   icon: Icon(
                    //     isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    //     color: isDark ? Colors.white : const Color(0xFF0A2540),
                    //   ),
                    //   onPressed: () => themeProvider.toggleTheme(),
                    //   tooltip: 'Toggle Theme',
                    // ),

                    if (isDesktop) ...[
                      const SizedBox(width: 6),
                      ElevatedButton.icon(
                        onPressed: () => QuoteRequestSheet.show(context),
                        icon: const Icon(Icons.send_rounded, size: 14, color: Colors.white),
                        label: const Text('Get a Quote', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0072CE),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ] else ...[
                      IconButton(
                        icon: const Icon(Icons.send_rounded, color: Color(0xFF0072CE)),
                        onPressed: () => QuoteRequestSheet.show(context),
                        tooltip: 'Get a Quote',
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Drawer ONLY on mobile view - Redesigned with premium executive styling
      drawer: isDesktop
          ? null
          : Drawer(
              elevation: 16,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
              child: Column(
                children: [
                  // Premium Executive Header
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isDark
                            ? [const Color(0xFF020617), const Color(0xFF0F172A)]
                            : [const Color(0xFF0A192F), const Color(0xFF00529B)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0072CE).withValues(alpha: 0.2),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 48, 20, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // White Frosted Container for Logo
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const AdaptiveLogoTop(height: 38),
                        ),
                        const SizedBox(height: 14),

                        // Subtitle Pill Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF38BDF8).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFF38BDF8).withValues(alpha: 0.35),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified,
                                color: Color(0xFF38BDF8),
                                size: 13,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Milk & Dairy Equipment Specialist',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Navigation Links
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      children: [
                        _buildDrawerTile(context, index: 0, title: 'Home', icon: Icons.home_rounded),
                        _buildDrawerTile(context, index: 1, title: 'About Us', icon: Icons.info_rounded),
                        _buildDrawerTile(context, index: 2, title: 'Services', icon: Icons.handshake_rounded),
                        _buildDrawerTile(context, index: 3, title: 'Products', icon: Icons.inventory_2_rounded),
                        _buildDrawerTile(context, index: 4, title: 'Contact Us', icon: Icons.phone_in_talk_rounded),
                      ],
                    ),
                  ),

                  // Bottom Action Area & Quote Button
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      border: Border(
                        top: BorderSide(
                          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // CTA Quote Button
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0072CE), Color(0xFF0284C7)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0072CE).withValues(alpha: 0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                              QuoteRequestSheet.show(context);
                            },
                            icon: const Icon(Icons.send_rounded, color: Colors.white, size: 16),
                            label: const Text(
                              'Request Equipment Quote',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ISO & Quick Info Badge
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shield_outlined,
                              size: 13,
                              color: isDark ? const Color(0xFF10B981) : const Color(0xFF059669),
                            ),
                            const SizedBox(width: 4),
                            // Text(
                            //   'ISO Certified Standard',
                            //   style: TextStyle(
                            //     fontSize: 11,
                            //     color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

      // Page Body with Animated Transition
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.02),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_currentIndex),
          child: pages[_currentIndex],
        ),
      ),

      // Floating WhatsApp Support FAB
      floatingActionButton: FloatingActionButton(
        onPressed: _openWhatsApp,
        backgroundColor: const Color(0xFF25D366),
        elevation: 4,
        child:  const   FaIcon(
          FontAwesomeIcons.whatsapp,
          color: Colors.white,
          size: 26,
        ),
      ),

    );
  }

  Widget _buildDesktopNavBtn(String title, int index, bool isDark) {
    final isSel = _currentIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () => _onTabTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSel ? const Color(0xFF0072CE) : (isDark ? Colors.grey[300] : const Color(0xFF334155)),
                fontWeight: isSel ? FontWeight.bold : FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 2),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isSel ? 24 : 0,
              color: isSel ? const Color(0xFF0072CE) : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerTile(BuildContext context, {required int index, required String title, required IconData icon}) {
    final isSel = _currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).pop();
            setState(() {
              _currentIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: isSel
                  ? (isDark
                      ? const Color(0xFF0072CE).withValues(alpha: 0.25)
                      : const Color(0xFF0072CE).withValues(alpha: 0.10))
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: isSel
                  ? Border.all(
                      color: const Color(0xFF0072CE).withValues(alpha: 0.3),
                      width: 1,
                    )
                  : null,
            ),
            child: Row(
              children: [
                // Active Bar Indicator
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isSel ? 4 : 0,
                  height: 18,
                  margin: EdgeInsets.only(right: isSel ? 10 : 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0072CE),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Icon(
                  icon,
                  size: 20,
                  color: isSel
                      ? const Color(0xFF0072CE)
                      : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
                      color: isSel
                          ? const Color(0xFF0072CE)
                          : (isDark ? Colors.white : const Color(0xFF0F172A)),
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: isSel
                      ? const Color(0xFF0072CE)
                      : (isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
