import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/models/product_model.dart';
import '../../../core/providers/app_provider.dart';
import 'selectable_product_tile.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.categoryId,
    required this.selectedProducts,
    required this.onProductToggle,
  });

  final String? categoryId;
  final List<ProductModel> selectedProducts;
  final ValueChanged<ProductModel> onProductToggle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          final products = categoryId == null
              ? appProvider.products
              : appProvider.getProductsByCategory(categoryId);

          if (products.isEmpty) {
            return const Center(
              child: Text('No products available'),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.only(top: AppDefaults.padding),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final selected = selectedProducts.contains(product);
              return SelectableProductTile(
                product: product,
                selected: selected,
                onToggle: () => onProductToggle(product),
              );
            },
          );
        },
      ),
    );
  }
}