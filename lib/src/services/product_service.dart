import 'package:flutter_project/shared/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = Provider(ProductService.new);

class ProductService {
  //
  final ProviderRef ref;
  ApiService get apiService => ref.read(apiServiceProvider);

  ProductService(this.ref);
  Future<dynamic> fetchProducts() async {
    var response = await apiService.dio.get('/products');
    return response.data;
  }

  Future<dynamic> searchProducts(String query) async {
    var response = await apiService.dio.get(
      '/products/search',
      queryParameters: {
        'q': query,
      },
    );
    return response.data;
  }
}
