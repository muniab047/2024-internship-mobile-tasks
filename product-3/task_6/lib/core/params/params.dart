import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class GetProductParams{
  final String id;

  const GetProductParams({
    required this.id,});
    }

class UpdateProductParams{
  final String id;
  final String name, description;
  final double price;

  const UpdateProductParams({ 
    required this.id, 
    required this.name,
    required this.price,
    required this.description});

   Map<String, dynamic> toJson(){
    return{
      'name' : name,
      'description' : description,
      'price' : price,
    };
   } 

  
}


class DeleteProductParams{
  final String id;

  const DeleteProductParams({
    required this.id
  });
}

class InsertProductParams{
  final String name, description, price;
  final XFile image;

  const InsertProductParams({ 
    required this.name, 
    required this.price,
    required this.description,  
    required this.image
    });


}