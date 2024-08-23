import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/product_entity.dart';
import '../bloc/product_bloc.dart';
import '../widgets/card_grid_view.dart';
import '../widgets/product_card.dart';
import 'details_page.dart';

class SearchPage extends StatefulWidget {
  final List<ProductEntity> allProducts;
  const SearchPage({super.key, required this.allProducts});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  
  late List<ProductEntity> _allProducts = widget.allProducts;
  late List<ProductEntity> _filteredProducts = widget.allProducts;
  final TextEditingController _searchController = TextEditingController();

  double ratio(double num) {
    return num * MediaQuery.of(context).size.width / 500;
  }
  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color(0XFF3F51F3),
            size: ratio(16),
          ),
        ),
        title: Text(
          'Search  Product',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: ratio(16),
              color: const Color(0XFF3E3E3E)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  ratio(20), ratio(10), ratio(20), ratio(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: _filterProducts,
                            decoration: InputDecoration(
                                label: Text(
                                  'Leather',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Color(0XFF666666)),
                                ),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0XFF3F51F3),
                                )),
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          margin: const EdgeInsets.only(left: 7),
                          decoration: const BoxDecoration(
                            color: Color(0XFF3F51F3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Icon(
                            Icons.filter_list_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: ratio(27)),
                    SizedBox(
                      height: ratio(500),
                      child: CardGridView(allProducts: _filteredProducts)),

                    
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ratio(8)),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'category',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: ratio(12),
                            color: const Color(0XFF3E3E3E)),
                      ),
                      Container(
                        
                        decoration: BoxDecoration(
                            color: const Color(0XFFF3F3F3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(ratio(6)))),
                        margin: EdgeInsets.fromLTRB(0, ratio(6), 0, ratio(10)),
                        child: const TextField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 80, 79, 79),
                              fontSize: 15),
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'price',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: ratio(12),
                                color: const Color(0XFF3E3E3E)),
                          ),
                          RangeSlider(
                              values: const RangeValues(30, 80),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              labels: const RangeLabels('20', '50'),
                              onChanged: null),
                        ],
                      ),
                      SizedBox(height: ratio(20),),
                      Container(
                          margin: EdgeInsets.only(bottom: ratio(10)),
                          width: double.infinity,
                          height: ratio(42),
                          decoration: BoxDecoration(
                            color: const Color(0XFF3F51F3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(ratio(8))),
                          ),
                          child: ElevatedButton(
                            onPressed: null,
                           
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    ratio(8)), // Adjust the border radius here
                              ),
                            ),
                             child: Text(
                              'APPLY',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: ratio(12),
                                  color: const Color.fromARGB(255, 255, 255, 255)),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
