import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Premium Equipment Showcase Frame (Clean, Modern & Uncluttered)
class FuturisticTechFrame extends StatelessWidget {
  final Widget child;
  final Color glowColor;

  const FuturisticTechFrame({
    super.key,
    required this.child,
    this.glowColor = const Color(0xFF0072CE),
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0B132B) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: glowColor.withValues(alpha: isDark ? 0.3 : 0.15),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: glowColor.withValues(alpha: isDark ? 0.15 : 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}

/// Continuous Glowing Pulse Ring Dot Indicator
class AnimatedPulsingDot extends StatefulWidget {
  final Color color;
  final double size;

  const AnimatedPulsingDot({
    super.key,
    this.color = const Color(0xFF10B981),
    this.size = 8.0,
  });

  @override
  State<AnimatedPulsingDot> createState() => _AnimatedPulsingDotState();
}

class _AnimatedPulsingDotState extends State<AnimatedPulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.size + (_controller.value * 6),
              height: widget.size + (_controller.value * 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withValues(alpha: 0.4 - (_controller.value * 0.3)),
              ),
            ),
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
                boxShadow: [
                  BoxShadow(
                    color: widget.color,
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Custom Animated Ultrasonic Soundwave & Analyzer Bar Visualizer
class UltrasonicWaveGraphic extends StatefulWidget {
  final int barCount;
  final Color color;

  const UltrasonicWaveGraphic({
    super.key,
    this.barCount = 12,
    this.color = const Color(0xFF0072CE),
  });

  @override
  State<UltrasonicWaveGraphic> createState() => _UltrasonicWaveGraphicState();
}

class _UltrasonicWaveGraphicState extends State<UltrasonicWaveGraphic>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.barCount, (index) {
            final phase = (index / widget.barCount) * math.pi * 2;
            final heightFactor = 0.3 + 0.7 * math.sin(_controller.value * math.pi + phase).abs();
            return Container(
              width: 3.5,
              height: 24 * heightFactor,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.6 + (0.4 * heightFactor)),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.4),
                    blurRadius: 4,
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
