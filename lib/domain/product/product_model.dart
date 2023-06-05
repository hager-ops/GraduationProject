import 'profuct_type.dart';

class Product {
  final String name;
  final String image;
  final String priceForPiece;
  final ProductEnum category;
  final int count;

  Product({
    required this.name,
    required this.image,
    required this.priceForPiece,
    required this.category,
    this.count = 0,
  });

  Product modify({int? count}) {
    return Product(
      image: image,
      name: name,
      category: category,
      priceForPiece: priceForPiece,
      count: count ?? this.count,
    );
  }
}
