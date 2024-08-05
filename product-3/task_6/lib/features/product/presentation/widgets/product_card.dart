import 'package:flutter/material.dart';

import 'custom_icon.dart';
import 'custom_text.dart';
import 'product_image.dart';

class ProductCardWidget extends StatelessWidget {
  final String image, product, price, item, rating;

  const ProductCardWidget(
      {required this.image,
      required this.product,
      required this.price,
      required this.item,
      required this.rating,
      super.key});
      

  @override
  Widget build(BuildContext context) {
    double ratio(double num) {
      return num * 1.0;
    }

    return Card(
      child: Column(
        children: [
          ProductImageWidget(
            image: image,
            height: ratio(160),
            width: double.infinity,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            fit: BoxFit.cover,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 7, 15, 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: product,
                        color: const Color(0xFF3E3E3E),
                        weight: FontWeight.w500,
                        family: 'Poppins',
                        size: 20,
                      ),
                      CustomTextWidget(
                        text: price,
                        color: const Color(0xFF3E3E3E),
                        weight: FontWeight.w500,
                        family: 'Poppins',
                        size: 14,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      CustomTextWidget(
                        text: item,
                        color: const Color(0xFFAAAAAA),
                        weight: FontWeight.w400,
                        family: 'Poppins',
                        size: 12,
                      ),
                      Row(
              
                        children: [

                        const CustomIconWidget(
                          icon: Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      
                      CustomTextWidget(
                        text: rating,
                        color: const Color(0xFFAAAAAA),
                        weight: FontWeight.w400,
                        family: 'Sora',
                        size: 12,
                      ),
                      ])
                  
                ],
              ),
        ],
      ),
    )


        ]
        
      ));
  }
}
