import 'package:flutter/widgets.dart';

class GetProductParams{
  final String id;

  const GetProductParams({
    required this.id,});
    }

class UpdateProductParams{
  final String id;
  final String name, description, image;
  final double price;

  const UpdateProductParams({ 
    required this.id, 
    required this.name, 
    required this.image, 
    required this.price,
    required this.description}); 

  
}


class DeleteProductParams{
  final String id;

  const DeleteProductParams({
    required this.id
  });
}

class InsertProductParams{
  final String id;
  final String name, description, image;
  final double price;

  const InsertProductParams({ 
    required this.id, 
    required this.name, 
    required this.image,
    required this.price,
    required this.description});


}