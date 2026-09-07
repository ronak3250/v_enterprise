import 'package:flutter/material.dart';
import 'package:vinit_enterprise/models/product_model.dart';
import 'package:vinit_enterprise/widgets/dairy_domain_ui.dart';
import 'package:vinit_enterprise/widgets/product_detail_sheet.dart';
import 'package:vinit_enterprise/widgets/quote_request_sheet.dart';

/// Reusable Unique Product Card Widget for Product Catalogs and Lists
class ProductCardWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCardWidget({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return StainlessSteelEquipmentCard(
      badgeTag: product.badgeText,
      onTap: onTap ?? () => ProductDetailSheet.show(context, product),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Equipment Image Container with subtle background tint
            Container(
              height: 105,
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (ctx, e, st) => const Icon(
                    Icons.inventory_2_outlined,
                    size: 48,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Product Title
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : const Color(0xFF0A2540),
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 4),

            // Product Overview Description
            Text(
              product.overview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.5,
                height: 1.35,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 12),

            // Action Buttons (Specs & Quote)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(

                    onPressed: () => ProductDetailSheet.show(context, product),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF0072CE), width: 1.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      minimumSize: const Size(0, 44),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'View Specs',
                      style: TextStyle(
                        color: Color(0xFF0072CE),
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => QuoteRequestSheet.show(
                      context,
                      initialProduct: product.title,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0072CE),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      minimumSize: const Size(0, 44),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Request Quote',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
