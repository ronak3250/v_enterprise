import 'package:flutter/material.dart';

/// Highly Adaptive & Animated Company Logo Widget
/// Automatically switches between light and dark company logos.
class AdaptiveLogo extends StatefulWidget {
  final double height;
  final bool showSubtitle;

  const AdaptiveLogo({
    super.key,
    this.height = 36,
    this.showSubtitle = true,
  });

  @override
  State<AdaptiveLogo> createState() => _AdaptiveLogoState();
}

class _AdaptiveLogoState extends State<AdaptiveLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.96,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Automatically select the correct logo.
    final logoAsset = isDark
        ? 'assets/company_logo_dark.png'
        : 'assets/company_logo_light.png';

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF1E293B).withValues(alpha: 0.95)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark
                    ? const Color(0xFF0072CE).withValues(alpha: 0.5)
                    : const Color(0xFF0072CE).withValues(alpha: 0.2),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? const Color(0xFF0072CE).withValues(alpha: 0.25)
                      : Colors.black.withValues(alpha: 0.06),
                  blurRadius: _isHovered ? 16 : 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Image.asset(
              logoAsset,
              height: widget.height,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return _buildFallbackLogo(isDark);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackLogo(bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF0072CE),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.science,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'VINIT ENTERPRISE',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: isDark
                ? Colors.white
                : const Color(0xFF0A2540),
          ),
        ),
      ],
    );
  }
}

/// Highly Adaptive Company Logo Widget for Light & Dark Themes
class AdaptiveLogoTop extends StatelessWidget {
  final double height;
  final bool showSubtitle;
  final bool? forceDark;

  const AdaptiveLogoTop({
    super.key,
    this.height = 45,
    this.showSubtitle = true,
    this.forceDark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = forceDark ?? (theme.brightness == Brightness.dark);
    final logoAsset = isDark
        ? 'assets/company_logo_dark.png'
        : 'assets/company_logo_light.jpg';

    return Image.asset(
      logoAsset,
      height: 45,
      width: 130,
      fit: BoxFit.cover,
      errorBuilder: (ctx, e, st) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF0072CE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.science, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 8),
          Text(
            'VINIT ENTERPRISE',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: isDark ? Colors.white : const Color(0xFF0A2540),
            ),
          ),
        ],
      ),
    );
  }
}
