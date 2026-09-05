import 'package:flutter/material.dart';
import 'package:vinit_enterprise/models/product_model.dart';
import 'package:vinit_enterprise/widgets/animated_entrance.dart';
import 'package:vinit_enterprise/widgets/app_footer.dart';
import 'package:vinit_enterprise/widgets/dairy_domain_ui.dart';
import 'package:vinit_enterprise/widgets/dairy_lottie_widget.dart';
import 'package:vinit_enterprise/widgets/product_detail_sheet.dart';
import 'package:vinit_enterprise/widgets/quote_request_sheet.dart';

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
                  const SizedBox(
                    height: 90,
                    width: 90,
                    child: DairyLottieWidget(
                      assetName: 'assets/products_catalog_animation.json',
                    ),
                  ),
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

          // Category Filter Chips
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

          // Product Grid with Tight Dynamic Aspect Ratio (ZERO EMPTY SPACE)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 850 ? 3 : (constraints.maxWidth > 550 ? 2 : 1);
                final childAspectRatio = constraints.maxWidth > 850
                    ? 0.95
                    : (constraints.maxWidth > 550 ? 0.88 : 0.82);
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: childAspectRatio,
                  children: filteredProducts.map((product) {
                    return StainlessSteelEquipmentCard(
                      badgeTag: product.badgeText,
                      onTap: () => ProductDetailSheet.show(context, product),
                      child: _buildProductCardContent(context, product, isDark),
                    );
                  }).toList(),
                );
              },
            ),
          ),

          const SizedBox(height: 48),

          // Footer
          AppFooter(onNavigateToTab: widget.onNavigateToTab),
        ],
      ),
    );
  }

  Widget _buildProductCardContent(BuildContext context, Product product, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Equipment Image Container
        Container(
          height: 140,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (ctx, e, st) => const Icon(Icons.image, size: 48, color: Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF0A2540)),
              ),
              const SizedBox(height: 4),
              Text(
                product.overview,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11.5, color: isDark ? const Color(0xFFCBD5E1) : Colors.grey[600]),
              ),
              const SizedBox(height: 8),

              // Domain LCD Spec Badges
              Row(
                children: const [
                  DigitalLcdSpecBadge(label: 'Speed', value: '< 30s', icon: Icons.timer_outlined),
                  SizedBox(width: 6),
                  DigitalLcdSpecBadge(label: 'Accuracy', value: '±0.06%', icon: Icons.precision_manufacturing_outlined),
                ],
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => ProductDetailSheet.show(context, product),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0072CE)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                      ),
                      child: const Text('View Specs', style: TextStyle(color: Color(0xFF0072CE), fontSize: 11)),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => QuoteRequestSheet.show(context, initialProduct: product.title),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0072CE),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                      ),
                      child: const Text('Request Quote', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
