import 'package:flutter/material.dart';
import 'package:task_6/details_page.dart';
import 'package:task_6/widgets/card.dart';

class home_page extends StatelessWidget {
  home_page({super.key});

  final products = [
    {
      'product': 'Derby Leather',
      'image': 'assets/img/p5.png',
      'price': '\$120',
      'item': 'Men’s shoe',
      'rating': '(4.0)'
    },
    {
      'product': 'Sneakers',
      'image': 'assets/img/p1.jpg',
      'price': '\$150',
      'item': "women's shoes",
      'rating': '(4.8)'
    },
    {
      'product': 'axc',
      'image': 'assets/img/p3.jpg',
      'price': '\$12',
      'item': "kid's shoes",
      'rating': '(4.4)'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double ratio(num) {
      return num * MediaQuery.of(context).size.width / 500;
    }

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: ratio(80),
            title: Container(
              padding: EdgeInsets.fromLTRB(0, ratio(0), ratio(10), ratio(20)),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'July 14, 2023',
                        style: TextStyle(
                          fontSize: ratio(12),
                          color: const Color(0xFFABABAB),
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: RichText(
                          text: TextSpan(
                              text: 'Hello ',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w400,
                                  fontSize: ratio(15),
                                  color: const Color.fromARGB(148, 0, 0, 0)),
                              children: [
                            TextSpan(
                                text: 'Yohannes',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w500,
                                    fontSize: ratio(15),
                                    color: const Color.fromARGB(255, 0, 0, 0)))
                          ])),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFCCCCCC),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Container(
                      width: ratio(40),
                      height: ratio(40),
                      child: Image.asset('assets/icon/image1.png')),
                ],
              ),
            )),
        body: Container(
            padding:
                EdgeInsets.fromLTRB(ratio(20), ratio(5), ratio(20), ratio(5)),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Products',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: ratio(24),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(ratio(10))),
                            border: Border.all(
                              color: Color(0XFFD9D9D9),
                            )),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/search');
                          },
                          icon: Icon(
                            Icons.search_outlined,
                            size: ratio(30),
                          ),
                        ),
                      )
                    ]),
                SizedBox(
                  height: ratio(20),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
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
            )),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF3F51F3),
            shape: CircleBorder(),
            onPressed: () {
              Navigator.of(context).pushNamed('/add');
            },
            child: Icon(Icons.add, color: Colors.white)));
  }
}
