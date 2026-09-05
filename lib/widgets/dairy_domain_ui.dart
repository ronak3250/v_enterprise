import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Food-Grade Stainless Steel (SS-304) Metallic Equipment Card Styling
class StainlessSteelEquipmentCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final String? badgeTag;

  const StainlessSteelEquipmentCard({
    super.key,
    required this.child,
    this.onTap,
    this.badgeTag,
  });

  @override
  State<StainlessSteelEquipmentCard> createState() => _StainlessSteelEquipmentCardState();
}

class _StainlessSteelEquipmentCardState extends State<StainlessSteelEquipmentCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [const Color(0xFF1E293B), const Color(0xFF0F172A)]
                    : [const Color(0xFFFFFFFF), const Color(0xFFF1F5F9)],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(6),
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(20),
              ),
              border: Border.all(
                color: _isHovered
                    ? const Color(0xFF0072CE)
                    : (isDark ? Colors.grey[800]! : const Color(0xFFCBD5E1)),
                width: _isHovered ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? const Color(0xFF0072CE).withValues(alpha: 0.25)
                      : Colors.black.withValues(alpha: 0.05),
                  blurRadius: _isHovered ? 20 : 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                widget.child,

                // Metallic Rivet Accent Dots on Top Corners
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark ? Colors.grey[700] : Colors.grey[400],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark ? Colors.grey[700] : Colors.grey[400],
                    ),
                  ),
                ),

                // Asymmetrical Milk Drop Style Badge
                if (widget.badgeTag != null)
                  Positioned(
                    top: 0,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF0072CE),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                      ),
                      child: Text(
                        widget.badgeTag!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9.5,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Digital LCD/LED Measurement Spec Meter Badge
class DigitalLcdSpecBadge extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const DigitalLcdSpecBadge({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF07142A) : const Color(0xFF0A2540),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF0072CE).withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF38BDF8), size: 14),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 8.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF10B981),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Animated Asymmetrical Milk Drop Badge
class DairyMilkDropBadge extends StatefulWidget {
  final String text;
  final IconData icon;

  const DairyMilkDropBadge({
    super.key,
    required this.text,
    this.icon = Icons.water_drop,
  });

  @override
  State<DairyMilkDropBadge> createState() => _DairyMilkDropBadgeState();
}

class _DairyMilkDropBadgeState extends State<DairyMilkDropBadge> with SingleTickerProviderStateMixin {
  late AnimationController _anim;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0072CE), Color(0xFF0A2540)],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
          topRight: Radius.circular(4),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0072CE).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _anim,
            builder: (context, child) {
              return Transform.scale(
                scale: 0.9 + (_anim.value * 0.2),
                child: Icon(widget.icon, color: const Color(0xFF38BDF8), size: 14),
              );
            },
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Animated Ultrasonic Milk Analyzer Live Display Gauge
class AnimatedMilkAnalyzerGauge extends StatefulWidget {
  const AnimatedMilkAnalyzerGauge({super.key});

  @override
  State<AnimatedMilkAnalyzerGauge> createState() => _AnimatedMilkAnalyzerGaugeState();
}

class _AnimatedMilkAnalyzerGaugeState extends State<AnimatedMilkAnalyzerGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF040D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF0072CE), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0072CE).withValues(alpha: 0.3),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header status row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF10B981),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'ULTRASONIC TESTER - READY',
                    style: TextStyle(
                      color: Color(0xFF38BDF8),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              const Text(
                '30 SEC FAST',
                style: TextStyle(
                  color: Color(0xFFFFC107),
                  fontSize: 9.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Live Oscilloscope Wave Monitor
          SizedBox(
            height: 44,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _WaveOscilloscopePainter(_controller.value),
                );
              },
            ),
          ),
          const SizedBox(height: 14),

          // Realtime LCD Testing Readings Grid
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final fatVal = (4.15 + 0.15 * math.sin(_controller.value * 2 * math.pi)).toStringAsFixed(2);
              final snfVal = (8.50 + 0.10 * math.cos(_controller.value * 2 * math.pi)).toStringAsFixed(2);
              final clrVal = (28.4 + 0.4 * math.sin(_controller.value * 4 * math.pi)).toStringAsFixed(1);

              return Row(
                children: [
                  Expanded(
                    child: _buildMetricTile(
                      label: 'FAT %',
                      value: '$fatVal%',
                      color: const Color(0xFF10B981),
                      icon: Icons.opacity,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildMetricTile(
                      label: 'SNF %',
                      value: '$snfVal%',
                      color: const Color(0xFF38BDF8),
                      icon: Icons.analytics_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildMetricTile(
                      label: 'DENSITY',
                      value: clrVal,
                      color: const Color(0xFFFFC107),
                      icon: Icons.speed,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile({
    required String label,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 12),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w900,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Oscilloscope Painter for Milk Analyzer Wave animation
class _WaveOscilloscopePainter extends CustomPainter {
  final double progress;

  _WaveOscilloscopePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color(0xFF0072CE).withValues(alpha: 0.15)
      ..strokeWidth = 1.0;

    // Draw background grid lines
    const gridCols = 8;
    const gridRows = 3;
    final stepX = size.width / gridCols;
    final stepY = size.height / gridRows;

    for (int i = 1; i < gridCols; i++) {
      canvas.drawLine(Offset(i * stepX, 0), Offset(i * stepX, size.height), gridPaint);
    }
    for (int j = 1; j < gridRows; j++) {
      canvas.drawLine(Offset(0, j * stepY), Offset(size.width, j * stepY), gridPaint);
    }

    final wavePaint = Paint()
      ..color = const Color(0xFF38BDF8)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final glowPaint = Paint()
      ..color = const Color(0xFF0072CE).withValues(alpha: 0.5)
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    final midY = size.height / 2;

    for (double x = 0; x <= size.width; x += 2) {
      final normX = x / size.width;
      final y = midY +
          math.sin((normX * 4 * math.pi) + (progress * 2 * math.pi)) * 10 * math.exp(-math.pow(normX - 0.5, 2) * 4);
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, glowPaint);
    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(covariant _WaveOscilloscopePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/// Animated Dripping Milk Droplet & Fluid Ripple Effect
class AnimatedMilkDropRipple extends StatefulWidget {
  const AnimatedMilkDropRipple({super.key});

  @override
  State<AnimatedMilkDropRipple> createState() => _AnimatedMilkDropRippleState();
}

class _AnimatedMilkDropRippleState extends State<AnimatedMilkDropRipple>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 160,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _MilkDropRipplePainter(_controller.value),
          );
        },
      ),
    );
  }
}

class _MilkDropRipplePainter extends CustomPainter {
  final double progress;

  _MilkDropRipplePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final surfaceY = size.height * 0.75;

    // 1. Draw Liquid Base Surface
    final surfacePaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..style = PaintingStyle.fill;

    final surfacePath = Path()
      ..moveTo(0, surfaceY)
      ..quadraticBezierTo(
          centerX, surfaceY + math.sin(progress * 2 * math.pi) * 3, size.width, surfaceY)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(surfacePath, surfacePaint);

    // 2. Dripping Milk Drop
    if (progress < 0.6) {
      final dropProgress = progress / 0.6;
      final dropY = dropProgress * surfaceY;
      final dropRadius = 6.0 * (1.0 - dropProgress * 0.2);

      final dropPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      final glowPaint = Paint()
        ..color = const Color(0xFF38BDF8).withValues(alpha: 0.5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

      // Teardrop path
      final dropPath = Path()
        ..moveTo(centerX, dropY - dropRadius * 1.5)
        ..quadraticBezierTo(
            centerX + dropRadius, dropY, centerX, dropY + dropRadius)
        ..quadraticBezierTo(
            centerX - dropRadius, dropY, centerX, dropY - dropRadius * 1.5);

      canvas.drawPath(dropPath, glowPaint);
      canvas.drawPath(dropPath, dropPaint);
    }

    // 3. Expanding Milk Ripples
    if (progress >= 0.5) {
      final rippleProgress = (progress - 0.5) / 0.5;
      final maxRadius = size.width * 0.4;
      final rippleRadius = rippleProgress * maxRadius;
      final alpha = (1.0 - rippleProgress).clamp(0.0, 1.0);

      final ripplePaint = Paint()
        ..color = const Color(0xFF0072CE).withValues(alpha: alpha * 0.6)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5;

      final innerRipplePaint = Paint()
        ..color = Colors.white.withValues(alpha: alpha)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(centerX, surfaceY),
          width: rippleRadius * 2,
          height: rippleRadius * 0.6,
        ),
        ripplePaint,
      );

      if (rippleProgress > 0.2) {
        final innerRadius = (rippleProgress - 0.2) * maxRadius;
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(centerX, surfaceY),
            width: innerRadius * 2,
            height: innerRadius * 0.6,
          ),
          innerRipplePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _MilkDropRipplePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/// Animated Food-Grade Glass Milk Bottle with Rising Bubbles & Fill Level
class AnimatedMilkBottleWidget extends StatefulWidget {
  final double width;
  final double height;

  const AnimatedMilkBottleWidget({
    super.key,
    this.width = 120,
    this.height = 120,
  });

  @override
  State<AnimatedMilkBottleWidget> createState() => _AnimatedMilkBottleWidgetState();
}

class _AnimatedMilkBottleWidgetState extends State<AnimatedMilkBottleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _MilkBottlePainter(_controller.value),
          );
        },
      ),
    );
  }
}

class _MilkBottlePainter extends CustomPainter {
  final double progress;

  _MilkBottlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Glass bottle outline path
    final bottlePath = Path()
      ..moveTo(w * 0.35, h * 0.1)
      ..lineTo(w * 0.65, h * 0.1)
      ..lineTo(w * 0.65, h * 0.25)
      ..quadraticBezierTo(w * 0.8, h * 0.35, w * 0.8, h * 0.5)
      ..lineTo(w * 0.8, h * 0.9)
      ..quadraticBezierTo(w * 0.8, h * 0.95, w * 0.75, h * 0.95)
      ..lineTo(w * 0.25, h * 0.95)
      ..quadraticBezierTo(w * 0.2, h * 0.95, w * 0.2, h * 0.9)
      ..lineTo(w * 0.2, h * 0.5)
      ..quadraticBezierTo(w * 0.2, h * 0.35, w * 0.35, h * 0.25)
      ..close();

    // Bottle Cap
    final capPaint = Paint()..color = const Color(0xFF0072CE);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(w * 0.32, h * 0.05, w * 0.68, h * 0.11),
        const Radius.circular(4),
      ),
      capPaint,
    );

    // Glass stroke
    final glassPaint = Paint()
      ..color = const Color(0xFF38BDF8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Background bottle glass fill
    final glassBg = Paint()..color = const Color(0xFF0F172A).withValues(alpha: 0.2);
    canvas.drawPath(bottlePath, glassBg);

    // Liquid fill level (Wave math)
    final liquidY = h * (0.4 + 0.05 * math.sin(progress * 2 * math.pi));
    final liquidPath = Path()
      ..moveTo(w * 0.21, h * 0.92)
      ..lineTo(w * 0.79, h * 0.92)
      ..lineTo(w * 0.79, liquidY)
      ..quadraticBezierTo(
          w * 0.5, liquidY + math.sin(progress * 4 * math.pi) * 4, w * 0.21, liquidY)
      ..close();

    final liquidPaint = Paint()..color = Colors.white;
    canvas.save();
    canvas.clipPath(bottlePath);
    canvas.drawPath(liquidPath, liquidPaint);

    // Animated rising bubbles
    for (int i = 0; i < 3; i++) {
      final bubbleProgress = (progress + (i * 0.33)) % 1.0;
      final bx = w * (0.35 + (i * 0.15));
      final by = h * 0.9 - (bubbleProgress * (h * 0.45));
      final bubbleAlpha = (1.0 - bubbleProgress).clamp(0.0, 1.0);

      final bubblePaint = Paint()
        ..color = const Color(0xFF38BDF8).withValues(alpha: bubbleAlpha * 0.8)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(bx, by), 3.0 + i, bubblePaint);
    }

    canvas.restore();
    canvas.drawPath(bottlePath, glassPaint);
  }

  @override
  bool shouldRepaint(covariant _MilkBottlePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/// Animated Food-Grade SS-304 Milk Collection Can
class AnimatedMilkCanWidget extends StatefulWidget {
  final double width;
  final double height;

  const AnimatedMilkCanWidget({
    super.key,
    this.width = 120,
    this.height = 120,
  });

  @override
  State<AnimatedMilkCanWidget> createState() => _AnimatedMilkCanWidgetState();
}

class _AnimatedMilkCanWidgetState extends State<AnimatedMilkCanWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _MilkCanPainter(_controller.value),
          );
        },
      ),
    );
  }
}

class _MilkCanPainter extends CustomPainter {
  final double progress;

  _MilkCanPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Milk Can Body Path
    final canPath = Path()
      ..moveTo(w * 0.35, h * 0.2)
      ..lineTo(w * 0.65, h * 0.2)
      ..lineTo(w * 0.7, h * 0.35)
      ..lineTo(w * 0.85, h * 0.88)
      ..quadraticBezierTo(w * 0.85, h * 0.95, w * 0.78, h * 0.95)
      ..lineTo(w * 0.22, h * 0.95)
      ..quadraticBezierTo(w * 0.15, h * 0.95, w * 0.15, h * 0.88)
      ..lineTo(w * 0.3, h * 0.35)
      ..close();

    // Metallic gradient paint
    final canPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF94A3B8), Color(0xFF334155), Color(0xFFE2E8F0)],
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    final outlinePaint = Paint()
      ..color = const Color(0xFF0072CE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawPath(canPath, canPaint);
    canvas.drawPath(canPath, outlinePaint);

    // Can Lid
    final lidPaint = Paint()..color = const Color(0xFF0A2540);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(w * 0.3, h * 0.12, w * 0.7, h * 0.2),
        const Radius.circular(6),
      ),
      lidPaint,
    );

    // Handles on sides
    final handlePaint = Paint()
      ..color = const Color(0xFF0072CE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawArc(
      Rect.fromLTWH(w * 0.1, h * 0.4, 20, 30),
      1.5,
      3.14,
      false,
      handlePaint,
    );

    canvas.drawArc(
      Rect.fromLTWH(w * 0.75, h * 0.4, 20, 30),
      -1.5,
      3.14,
      false,
      handlePaint,
    );

    // Animated Laser Scanning Line
    final scanY = h * (0.35 + (progress * 0.5));
    final scanPaint = Paint()
      ..color = const Color(0xFF10B981)
      ..strokeWidth = 2.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    canvas.drawLine(Offset(w * 0.2, scanY), Offset(w * 0.8, scanY), scanPaint);
  }

  @override
  bool shouldRepaint(covariant _MilkCanPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

