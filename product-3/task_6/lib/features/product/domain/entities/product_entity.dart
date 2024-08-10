import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name, image,description, id;
  final double price;

  const ProductEntity({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    required this.description
  });

  @override
  List<Object?> get props => [name, description, image, price, id];
}
