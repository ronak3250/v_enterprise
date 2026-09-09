import 'package:flutter/material.dart';

/// Enum representing the target laptop and display device profile
enum LaptopCategory {
  compact,      // 13.3 inch (viewport ~1024px - 1199px)
  portable,     // 14 inch   (viewport ~1200px - 1439px)
  standard,     // 15.6 inch (viewport ~1440px - 1599px)
  larger,       // 16 inch   (viewport ~1600px - 1727px)
  large,        // 17.3 inch (viewport >= 1728px)
  mobile,       // Mobile device (< 768px)
  tablet,       // Tablet device (768px - 1023px)
}

class ResponsiveLayout {
  /// Returns the screen width category
  static LaptopCategory getCategory(double screenWidth) {
    if (screenWidth < 768) return LaptopCategory.mobile;
    if (screenWidth < 1024) return LaptopCategory.tablet;
    if (screenWidth < 1200) return LaptopCategory.compact;   // 13.3 inch
    if (screenWidth < 1440) return LaptopCategory.portable;  // 14 inch
    if (screenWidth < 1600) return LaptopCategory.standard;  // 15.6 inch
    if (screenWidth < 1728) return LaptopCategory.larger;    // 16 inch
    return LaptopCategory.large;                       // 17.3 inch
  }

  /// Calculates dynamic maximum container width for current screen (full-width 100% edge-to-edge)
  static double getMaxContainerWidth(double screenWidth) {
    return double.infinity;
  }

  /// Returns grid column count based on available width
  static int getGridColumnCount(double width, {int maxColumns = 4}) {
    if (width >= 1536) return maxColumns.clamp(1, 4); // 16" and 17.3" (4 cols)
    if (width >= 1400) return (maxColumns >= 4 ? 4 : maxColumns); // 15.6"
    if (width >= 1024) return 3; // 13.3" and 14" (3 cols)
    if (width >= 600) return 2;  // Tablets
    return 1;                    // Mobile
  }

  /// Returns responsive horizontal padding for section containers
  static EdgeInsets getSectionPadding(double screenWidth) {
    if (screenWidth >= 1728) return const EdgeInsets.symmetric(horizontal: 48, vertical: 40);
    if (screenWidth >= 1600) return const EdgeInsets.symmetric(horizontal: 40, vertical: 36);
    if (screenWidth >= 1440) return const EdgeInsets.symmetric(horizontal: 32, vertical: 32);
    if (screenWidth >= 1200) return const EdgeInsets.symmetric(horizontal: 24, vertical: 28);
    if (screenWidth >= 1024) return const EdgeInsets.symmetric(horizontal: 20, vertical: 24);
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 20);
  }

  /// Returns responsive section gap
  static double getSectionGap(double screenWidth) {
    if (screenWidth >= 1728) return 64.0;
    if (screenWidth >= 1600) return 56.0;
    if (screenWidth >= 1440) return 48.0;
    if (screenWidth >= 1200) return 40.0;
    if (screenWidth >= 1024) return 32.0;
    return 24.0;
  }
}
