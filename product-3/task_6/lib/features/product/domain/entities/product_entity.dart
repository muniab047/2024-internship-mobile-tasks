import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String item;
  final String image;
  final List<int> sizes;
  final double price;
  final int id;

  const ProductEntity({
    required this.image,
    required this.item,
    required this.name,
    required this.price,
    required this.sizes,
    required this.id,
  });

  @override
  List<Object?> get props => [name, item, image, sizes, price, id];
}
