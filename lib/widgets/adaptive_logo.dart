import 'package:flutter/material.dart';

/// Highly Adaptive & Animated Company Logo Widget for Light & Dark Themes
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

class _AdaptiveLogoState extends State<AdaptiveLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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

    return Image.asset(
      'assets/company_logo.jpeg',
      height: 45,
      width: 130,
      fit: BoxFit.fitWidth,
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
