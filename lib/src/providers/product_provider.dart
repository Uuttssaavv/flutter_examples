import 'package:flutter_project/src/models/product.dart';
import 'package:flutter_project/src/services/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_provider.freezed.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    @Default([]) List<Product> products,
    @Default(true) bool isLoading,
    @Default('') String errorMessage,
  }) = _ProductState;
  const ProductState._();
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(ProductNotifier.new);

class ProductNotifier extends StateNotifier<ProductState> {
  final StateNotifierProviderRef ref;

  ProductService get _service => ref.read(productProvider);
  ProductNotifier(this.ref) : super(const ProductState()) {
    loadProducts();
  }

  void loadProducts() async {
    state = state.copyWith(isLoading: true);
    //fetch products
    final responseBody = await _service.fetchProducts();
    print(responseBody['products']);
    final List<Product> products = [];
    for (var product in responseBody['products']) {
      products.add(Product.fromJson(product));
    }

    state = state.copyWith(isLoading: false, products: products);
  }
}
