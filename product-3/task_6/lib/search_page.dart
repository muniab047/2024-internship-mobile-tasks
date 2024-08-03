import 'package:flutter/material.dart';
import '../widgets/card.dart';
import 'details_page.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  double ratio(num) {
    return num * MediaQuery.of(context).size.width / 500;
  }

  final products = [
    {'product' : 'Derby Leather', 
    'image': 'assets/img/p5.png', 
    'price': '\$120',
    'item' : 'Men’s shoe',
    'rating': '(4.0)'},

    {'product' : 'Sneakers', 
    'image': 'assets/img/p1.jpg', 
    'price': '\$150',
    'item' : "women's shoes",
    'rating': '(4.8)'} ,

    {'product' : 'axc', 
    'image': 'assets/img/p3.jpg', 
    'price': '\$12',
    'item' : "kid's shoes",
    'rating': '(4.4)'} ,
  ];

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
                        const Expanded(
                          child: TextField(
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

                    SizedBox(height: ratio(27),),
                    Container(
                      height: ratio(500),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 230,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          final name = product['product'],
                              price = product['price'],
                              item = product['item'],
                              image = product['image'],
                              rating = product['rating'];
                          return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => details_page(
                                  image: image,
                                  item: item,
                                  name: name,
                                  price: price,
                                  rating: rating,
                                ),
                              ),
                            );
                          },
                          child: card(
                            image: image,
                            item: item,
                            price: price,
                            product: name,
                            rating: rating,
                          ));
                        },
                      ),
                    )
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
                              color: const Color.fromARGB(255, 80, 79, 79),
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
                            child: Text(
                              'APPLY',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: ratio(12),
                                  color: const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    ratio(8)), // Adjust the border radius here
                              ),
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
