import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required int price,
    required int discountPercentage,
    required int rating,
    required String brand,
    required String category,
    required String thumbnail,
    required Images images,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({@Default([]) List<String> images}) = _Images;
  factory Images.fromJson(Map<String, Object?> json) => _$ImagesFromJson(json);
}
