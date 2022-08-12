import 'package:flutter/material.dart';
import 'package:flutter_project/src/main/widgets/product_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/product_provider.dart';

class SearchPage extends ConsumerWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);
    final notifier = ref.watch(productNotifierProvider.notifier);
    final products = productState.products;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    notifier.initSearch();
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onSubmitted: (String value) {
                notifier.searchProducts(value);
              },
            ),
          ),
        ),
      ),
      body: productState.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : products.isEmpty
              ? const Center(
                  child: Text('No products found'),
                )
              : ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: products.length,
                  itemBuilder: (_, index) => ProductTile(
                    product: products[index],
                  ),
                ),
    );
  }
}
