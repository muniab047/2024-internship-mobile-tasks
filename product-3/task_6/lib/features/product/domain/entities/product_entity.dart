class ProductEntity {
  final String name, item, image;
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ProductEntity &&
           other.name == name &&
           other.item == item &&
           other.image == image &&
           ListEquality().equals(other.sizes, sizes) &&
           other.price == price &&
           other.id == id;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      item,
      image,
      ListEquality().hash(sizes),
      price,
      id,
    );
  }
}

class ListEquality {
  bool equals(List<int> list1, List<int> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }

  int hash(List<int> list) {
    return list.fold(0, (hash, item) => hash * 31 + item.hashCode);
  }
}
