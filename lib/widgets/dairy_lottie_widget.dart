import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vinit_enterprise/widgets/dairy_domain_ui.dart';

/// Highly Versatile & Page-Specific Lottie Animation Widget for Milk & Dairy Equipment
class DairyLottieWidget extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? fallbackWidget;

  const DairyLottieWidget({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.fallbackWidget,
  });

  /// Preset Lottie for Milk Analyzer & Ultrasonic Testing (Renders Animated Milk Bottle)
  factory DairyLottieWidget.milkTesting({double? width, double? height}) {
    return DairyLottieWidget(
      assetName: 'assets/milk_testing_animation.json',
      width: width,
      height: height,
      fallbackWidget: AnimatedMilkBottleWidget(width: width ?? 100, height: height ?? 100),
    );
  }

  /// Preset Lottie for Milk Cans, Collection & Equipment (Renders Animated Milk Can)
  factory DairyLottieWidget.milkEquipment({double? width, double? height}) {
    return DairyLottieWidget(
      assetName: 'assets/milk_can_animation.json',
      width: width,
      height: height,
      fallbackWidget: AnimatedMilkCanWidget(width: width ?? 100, height: height ?? 100),
    );
  }

  /// Preset Lottie for Services Page Maintenance & Calibration
  factory DairyLottieWidget.servicesMaintenance({double? width, double? height}) {
    return DairyLottieWidget(
      assetName: 'assets/services_maintenance_animation.json',
      width: width,
      height: height,
      fallbackWidget: AnimatedMilkCanWidget(width: width ?? 100, height: height ?? 100),
    );
  }

  /// Preset Lottie for Services Page Cloud AMCU & Wireless System
  factory DairyLottieWidget.servicesCloud({double? width, double? height}) {
    return DairyLottieWidget(
      assetName: 'assets/services_cloud_amcu_animation.json',
      width: width,
      height: height,
      fallbackWidget: AnimatedMilkBottleWidget(width: width ?? 100, height: height ?? 100),
    );
  }

  /// Preset Lottie for Products Page Equipment Catalog Box
  factory DairyLottieWidget.productsCatalog({double? width, double? height}) {
    return DairyLottieWidget(
      assetName: 'assets/products_catalog_animation.json',
      width: width,
      height: height,
      fallbackWidget: AnimatedMilkCanWidget(width: width ?? 100, height: height ?? 100),
    );
  }

  /// Preset Lottie for About Page ISO Dairy Plant & Shield
  factory DairyLottieWidget.aboutFactory({double? width, double? height}) {
    return DairyLottieWidget(
      assetName: 'assets/about_factory_animation.json',
      width: width,
      height: height,
      fallbackWidget: AnimatedMilkBottleWidget(width: width ?? 100, height: height ?? 100),
    );
  }

  /// Preset Lottie for Contact Page 24/7 Factory Support
  factory DairyLottieWidget.contactSupport({double? width, double? height}) {
    return DairyLottieWidget(
      assetName: 'assets/contact_support_animation.json',
      width: width,
      height: height,
      fallbackWidget: AnimatedMilkBottleWidget(width: width ?? 100, height: height ?? 100),
    );
  }

  /// Preset Lottie for Calculator Page Yield & ROI Growth
  factory DairyLottieWidget.calculatorRoi({double? width, double? height}) {
    return DairyLottieWidget(
      assetName: 'assets/calculator_roi_animation.json',
      width: width,
      height: height,
      fallbackWidget: AnimatedMilkBottleWidget(width: width ?? 100, height: height ?? 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return fallbackWidget ?? AnimatedMilkBottleWidget(width: width ?? 100, height: height ?? 100);
      },
    );
  }
}

/// Specialized Lottie Badge Card for Dairy Services & Features
class DairyLottieServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String lottieAsset;
  final IconData icon;

  const DairyLottieServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.lottieAsset,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return StainlessSteelEquipmentCard(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // Lottie Animated Icon Frame
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF0072CE).withValues(alpha: 0.3)),
              ),
              child: DairyLottieWidget(
                assetName: lottieAsset,
                width: 64,
                height: 64,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: const Color(0xFF0072CE), size: 18),
                      const SizedBox(width: 6),
                      Flexible(
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
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.4,
                      color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600],
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
}
