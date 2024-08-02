import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_6/widgets/size.dart';
import 'package:task_6/widgets/text.dart';

class details_page extends StatefulWidget {
  details_page({super.key});

  @override
  State<details_page> createState() => _details_pageState();
}

class _details_pageState extends State<details_page> {
  final sizes = [
    {'s': '22', 'c':'0XFFF5FAFB' },
    {'s':'23','c':'0XFF3F51F3',},
    {'s': '24', 'c':'0XFFF5FAFB', },
    {'s': '25', 'c':'0XFFF5FAFB', },
    {'s': '26', 'c':'0XFFF5FAFB', },
    {'s': '27', 'c':'0XFFF5FAFB', },
    ];
  @override
  Widget build(BuildContext context) {
    double ratio(num){
      return num * MediaQuery.of(context).size.width / 350;

    }
    return Scaffold(
       body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children:[ 
                  Container(
                  width: double.infinity,

                  child: Image.asset('assets/img/p6.png', fit: BoxFit.cover),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                              margin: EdgeInsets.fromLTRB(ratio(10), ratio(10), ratio(10), ratio(10)),
                              height: ratio(42),
                              
                              decoration: ShapeDecoration(shape: CircleBorder(), color: Color.fromARGB(255, 255, 255, 255),),
                              child: ElevatedButton(
                                onPressed: null,
                                child: Icon(Icons.keyboard_arrow_left_sharp, color: Color(0XFF3F51F3), size: ratio(30),),
                                style: ElevatedButton.styleFrom(
                                  shape:CircleBorder()
                                ),
                              )),
                  
                )
                ]
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(ratio(20), ratio(5), ratio(20), ratio(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                                txt: 'Men’s shoe',
                                family: 'Poppins',
                                weight: FontWeight.w400,
                                size: 12,
                                color: 0xFFAAAAAA),
                            Row(
                                                        
                              children: [
                                Container(
                                  height: ratio(15),
                                  width: ratio(15),
                                  margin: EdgeInsets.fromLTRB(ratio(5), 0, ratio(5), 0),
                                  child: Image.asset('assets/icon/image3.png'),
                                ),
                                text(
                                    txt: '(4.0)',
                                    family: 'Sora',
                                    weight: FontWeight.w400,
                                    size: 12,
                                    color: 0xFFAAAAAA)
                              ],
                            )
                          ],
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                              txt: "Derby Leather",
                              family: 'Poppins',
                                  weight: FontWeight.w500,
                                  size: 25,
                                  color: 0xFF3E3E3E,
                            ),
                            text(
                              txt: "\$12",
                              family: 'Poppins',
                                  weight: FontWeight.w500,
                                  size: 16,
                                  color: 0xFF3E3E3E,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: ratio(10),),
                    text(
                              txt: "Size:",
                              family: 'Poppins',
                                  weight: FontWeight.w500,
                                  size: 20,
                                  color: 0xFF3E3E3E,
                            ),
                    SizedBox(
                      height: ratio(10),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Expanded(
                        child: Row(
                          children: List.generate(sizes.length, (index) {
                            final s = sizes[index];
                            return product_size(size: s['s'], color: int.parse(s['c'] ?? '0'),);
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ratio(25),
                    ),
                    text(
                      txt:
                          'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                      family: 'Poppins',
                      weight: FontWeight.w500,
                      size: 12,
                      color: 0XFF666666,
                    ),
                    SizedBox(
                      height: ratio(50),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.fromLTRB(ratio(10), ratio(10), ratio(10), ratio(10)),
                              height: ratio(42),
                              decoration: BoxDecoration(
                                color: Color(0XFF3F51F3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(ratio(8))),
                              ),
                              child: ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  'ADD',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: ratio(12),
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        ratio(8)), // Adjust the border radius here
                                  ),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.fromLTRB(ratio(5), ratio(10), ratio(5), ratio(10)),
                              height: ratio(42),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(ratio(8))),
                                  border: Border.all(color: Color(0XFFFF1313))),
                              child: OutlinedButton(
                                onPressed: null,
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.transparent),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        ratio(8)), // Custom border radius
                                  ),
                                ),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: ratio(12),
                                    color: Color(0XFFFF1313),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
