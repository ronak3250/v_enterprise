import 'package:flutter/material.dart';
import 'package:vinit_enterprise/models/product_model.dart';
import 'package:vinit_enterprise/widgets/animated_entrance.dart';
import 'package:vinit_enterprise/widgets/app_footer.dart';
import 'package:vinit_enterprise/widgets/product_card_widget.dart';
import 'package:vinit_enterprise/utils/responsive.dart';

class ProductsScreen extends StatefulWidget {
  final Function(int)? onNavigateToTab;

  const ProductsScreen({
    super.key,
    this.onNavigateToTab,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String _selectedCategory = 'All Products';

  List<Product> get filteredProducts {
    if (_selectedCategory == 'All Products') {
      return ProductCatalog.sampleProducts;
    }
    return ProductCatalog.sampleProducts.where((p) => p.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Banner
          Container(
            width: double.infinity,
            color: const Color(0xFF07142A),
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            child: FadeSlideTransition(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Dairy Equipment Designed for Accuracy and Efficiency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Browse our range of precision milk analyzers, automated collection terminals, electronic scales, and accessories.',
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

          const SizedBox(height: 24),

          // Category Filter Chips & Grid Container
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: ResponsiveLayout.getMaxContainerWidth(screenWidth)),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: ProductCatalog.categories.map((category) {
                        final isSelected = _selectedCategory == category;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ChoiceChip(
                            label: Text(category),
                            selected: isSelected,
                            selectedColor: const Color(0xFF0072CE),
                            backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.grey[100],
                            labelStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? Colors.white : (isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155)),
                            ),
                            onSelected: (selected) {
                              if (selected) {
                                setState(() {
                                  _selectedCategory = category;
                                });
                              }
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Product Grid with Responsive Aspect Ratio & Dynamic Laptop Columns
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount = ResponsiveLayout.getGridColumnCount(constraints.maxWidth);
                        const crossAxisSpacing = 20.0;
                        final totalSpacing = (crossAxisCount - 1) * crossAxisSpacing;
                        final itemWidth = (constraints.maxWidth - totalSpacing) / crossAxisCount;
                        const targetHeight = 335.0;
                        final childAspectRatio = itemWidth / targetHeight;

                        return GridView.count(
                          crossAxisCount: crossAxisCount,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: crossAxisSpacing,
                          mainAxisSpacing: 20,
                          childAspectRatio: childAspectRatio,
                          children: filteredProducts.map((product) {
                            return ProductCardWidget(product: product);
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 48),

          // Footer
          AppFooter(onNavigateToTab: widget.onNavigateToTab),
        ],
      ),
    );
  }
}
