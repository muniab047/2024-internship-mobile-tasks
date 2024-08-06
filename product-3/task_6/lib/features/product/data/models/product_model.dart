
import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity{
  const ProductModel({
    required image,
    required item,
    required name,
    required price,
    required sizes,
    required id,
    }) :super (
      image : image,
      item: item,
      name : name,
      price : price,
      sizes : sizes,
      id : id
  );

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      image: json['image'], 
      item: json['item'], 
      name: json['name'], 
      price: json['price'].toDouble(), // Ensure price is converted to double
      sizes: List<int>.from(json['sizes']),
      id: json['id']);
  }

  Map <String, dynamic> toJson(){
    return {
      'image' : image,
      'item': item,
      'name' : name,
      'price' : price,
      'sizes' : sizes,
      'id' : id 
    };

  }

 
}