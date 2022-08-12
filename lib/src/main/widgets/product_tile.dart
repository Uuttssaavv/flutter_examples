import 'package:flutter/material.dart';
import 'package:flutter_project/src/models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.thumbnail),
      ),
      title: Text(
        product.title,
      ),
      subtitle: Text(product.description),
    );
  }
}
