class ProductEntity {
  final String name,  item,  image;
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
  }
    
  );

}