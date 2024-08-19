
import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity{
  const ProductModel({
    required image,
    required description,
    required name,
    required price,
    required id,
    }) :super (
      image : image,
      description: description,
      name : name,
      price : price,
      id : id
  );

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      image: json['imageUrl'] as String,
      name: json['name'], 
      description: json['description'],
      price: json['price'].toDouble(),
      id: json['id']);
  }

  Map <String, dynamic> toJson(){
    return {
      'imageUrl' : image,
      'description': description,
      'name' : name,
      'price' : price.toInt(),
      'id' : id 
    };

  }

  ProductEntity toEntity(){
    final productEntity = ProductEntity(
              image: image, 
              name: name, 
              price: price, 
              id: id, 
              description: description);
    return productEntity;
  }

 
}