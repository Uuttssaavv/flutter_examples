import 'package:flutter/material.dart';
import 'package:flutter_project/src/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateProvider((ref) => 1);

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);
    final products = productState.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
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
                    itemBuilder: (_, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(products[index].thumbnail),
                      ),
                      title: Text(
                        products[index].title,
                      ),
                      subtitle: Text(products[index].description),
                    ),
                  ),
      ),
    );
  }
}
