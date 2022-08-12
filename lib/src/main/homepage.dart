import 'package:flutter/material.dart';
import 'package:flutter_project/src/main/search_page.dart';
import 'package:flutter_project/src/main/widgets/product_tile.dart';
import 'package:flutter_project/src/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateProvider((ref) => 1);

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);
    final products = productState.products;
    final notifier = ref.watch(productNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () async {
                notifier.initSearch();
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SearchPage(),
                  ),
                );
                notifier.loadProducts();
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: productState.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : productState.errorMessage != ''
                ? Center(
                    child: Text('The error is ${productState.errorMessage}'),
                  )
                : ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: products.length,
                    itemBuilder: (_, index) => ProductTile(
                      product: products[index],
                    ),
                  ),
      ),
    );
  }
}
