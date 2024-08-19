import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';
import '../pages/details_page.dart';
import 'product_card.dart';

class CardGridView extends StatelessWidget {
  final List<ProductEntity> allProducts;

  const CardGridView({super.key, required this.allProducts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 230,
                        ),
                        itemCount: allProducts.length,
                        itemBuilder: (context, index) {
                          final product = allProducts[index];
                          final name = product.name,
                              price = product.price,
                              description = product.description,
                              image = product.image,
                              id = product.id;
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=> DetailsPage(id : id))
                                );
                              },
                              child: ProductCardWidget(
                                image: image ?? '',
                                description: description ?? '',
                                price: price ?? 0.0,
                                product: name ?? '',
                                id: id ?? '',
                              ));
                        },
                      );;
  }
}