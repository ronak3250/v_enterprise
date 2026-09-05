import 'package:flutter/material.dart';
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
    const phone = "919876543210";
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
        preferredSize: Size.fromHeight(isDesktop ? 98 : 94),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Contact Announcement Bar (Full Edge-to-Edge Width)
              Container(
                width: double.infinity,
                color: isDark ? const Color(0xFF040D1B) : const Color(0xFFF1F5F9),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => _launchUrl('tel:+919876543210'),
                          child: Row(
                            children: [
                              const Icon(Icons.phone, color: Color(0xFF0072CE), size: 12),
                              const SizedBox(width: 4),
                              Text(
                                '+91 98765 43210',
                                style: TextStyle(
                                  color: isDark ? Colors.white : const Color(0xFF0A2540),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        InkWell(
                          onTap: () => _launchUrl('mailto:info@vinitenterprise.com'),
                          child: Row(
                            children: [
                              const Icon(Icons.email, color: Color(0xFF0072CE), size: 12),
                              const SizedBox(width: 4),
                              Text(
                                'info@vinitenterprise.com',
                                style: TextStyle(
                                  color: isDark ? Colors.white : const Color(0xFF0A2540),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: Color(0xFF0072CE), size: 12),
                            const SizedBox(width: 4),
                            Text(
                              'Mon - Sat: 9:00 AM - 6:30 PM',
                              style: TextStyle(
                                color: isDark ? Colors.white70 : const Color(0xFF475569),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF10B981).withValues(alpha: 0.2)
                                : const Color(0xFFD1FAE5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isDark
                                  ? const Color(0xFF10B981).withValues(alpha: 0.3)
                                  : const Color(0xFF6EE7B7),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shield_outlined,
                                color: isDark ? const Color(0xFF10B981) : const Color(0xFF059669),
                                size: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'ISO Certified',
                                style: TextStyle(
                                  color: isDark ? const Color(0xFF10B981) : const Color(0xFF059669),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                      child: AdaptiveLogo(height: isDesktop ? 34 : 26),
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

                    IconButton(
                      icon: Icon(
                        isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                        color: isDark ? Colors.white : const Color(0xFF0A2540),
                      ),
                      onPressed: () => themeProvider.toggleTheme(),
                      tooltip: 'Toggle Theme',
                    ),

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

      // Drawer ONLY on mobile view
      drawer: isDesktop
          ? null
          : Drawer(
              backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0A2540), Color(0xFF0072CE)],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        AdaptiveLogo(height: 34),
                        SizedBox(height: 12),
                        Text(
                          'Milk & Dairy Equipment Specialist',
                          style: TextStyle(fontSize: 12, color: Color(0xFFFFC107), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  _buildDrawerTile(context, index: 0, title: 'Home', icon: Icons.home_outlined),
                  _buildDrawerTile(context, index: 1, title: 'About Us', icon: Icons.info_outline),
                  _buildDrawerTile(context, index: 2, title: 'Services', icon: Icons.handshake_outlined),
                  _buildDrawerTile(context, index: 3, title: 'Products', icon: Icons.inventory_2_outlined),
                  _buildDrawerTile(context, index: 4, title: 'Contact Us', icon: Icons.phone_in_talk_outlined),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        QuoteRequestSheet.show(context);
                      },
                      icon: const Icon(Icons.send, color: Colors.white),
                      label: const Text('Request Equipment Quote', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0072CE),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
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
        child: const Icon(Icons.chat_bubble, color: Colors.white, size: 26),
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

    return ListTile(
      leading: Icon(icon, color: isSel ? const Color(0xFF0072CE) : (isDark ? Colors.grey[400] : Colors.grey[700])),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
          color: isSel ? const Color(0xFF0072CE) : (isDark ? Colors.white : const Color(0xFF0A2540)),
        ),
      ),
      selected: isSel,
      selectedTileColor: const Color(0xFF0072CE).withValues(alpha: 0.1),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
