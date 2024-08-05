import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_text.dart';
import '../widgets/product_image.dart';
import '../widgets/product_size_box.dart';

class DetailsPage extends StatefulWidget {
  final String product, item, image, rating, price;

  const DetailsPage(
      {required this.price,
      required this.product,
      required this.item,
      required this.image,
      required this.rating,
      super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final sizes = [
    {'s': '22', 'c': const Color(0XFFF5FAFB)},
    {
      's': '23',
      'c': const Color(0XFF3F51F3),
    },
    {
      's': '24',
      'c': const Color(0XFFF5FAFB),
    },
    {
      's': '25',
      'c': const Color(0XFFF5FAFB),
    },
    {
      's': '26',
      'c': const Color(0XFFF5FAFB),
    },
    {
      's': '27',
      'c': const Color(0XFFF5FAFB),
    },
  ];

  @override
  Widget build(BuildContext context) {
    double ratio(double num) {
      return num * MediaQuery.of(context).size.width / 350;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            ProductImageWidget(
              image: widget.image,
              width: double.infinity,
              height: ratio(250),
              fit: BoxFit.cover,
            ),
            Positioned(
                top: 10,
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      ratio(10), ratio(10), ratio(10), ratio(10)),
                  height: ratio(42),
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: CustomIconButtonWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icons.keyboard_arrow_left_sharp,
                      color: const Color(0XFF3F51F3),
                      size: ratio(30)),
                )),
          ]),
          Padding(
            padding:
                EdgeInsets.fromLTRB(ratio(20), ratio(5), ratio(20), ratio(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: widget.item ,
                      color: const Color(0xFFAAAAAA),
                      weight: FontWeight.w400,
                      family: 'Poppins',
                      size: ratio(12),
                    ),
                    Row(children: [
                      CustomIconWidget(
                        icon: Icons.star,
                        color: Colors.yellow,
                        size: ratio(15),
                      ),
                      CustomTextWidget(
                        text: widget.rating,
                        color: const Color(0xFFAAAAAA),
                        weight: FontWeight.w400,
                        family: 'Sora',
                        size: ratio(12),
                      ),
                    ])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: widget.product,
                      color: const Color(0xFF3E3E3E),
                      weight: FontWeight.w500,
                      family: 'Poppins',
                      size: ratio(20),
                    ),
                    CustomTextWidget(
                      text: widget.price,
                      color: const Color(0xFF3E3E3E),
                      weight: FontWeight.w500,
                      family: 'Poppins',
                      size: ratio(14),
                    )
                  ],
                ),
                SizedBox(
                  height: ratio(10),
                ),
                CustomTextWidget(
                  text: 'Size:',
                  family: 'Poppins',
                  weight: FontWeight.w500,
                  size: ratio(20),
                  color: const Color(0xFF3E3E3E),
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

                        return ProductSizeBoxWidget(
                            size: s['s'] as String, color: s['c'] as Color);
                      }),
                    ),
                  ),
                ),
                SizedBox(
                  height: ratio(25),
                ),
                CustomTextWidget(
                  text:
                      'A derby leather shoe is a classic and versatile footwear option'
                      'characterized by its open lacing system, where the shoelace eyelets'
                      ' are sewn on top of the vamp (the upper part of the shoe). '
                      'This design feature provides a more relaxed and casual look compared'
                      ' to the closed lacing system of oxford shoes. Derby shoes are typically'
                      ' made of high-quality leather, known for its durability and elegance, making '
                      'them suitable for both formal and casual occasions. With their timeless style and '
                      'comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                  family: 'Poppins',
                  weight: FontWeight.w500,
                  size: ratio(12),
                  color: const Color(0XFF666666),
                ),
                SizedBox(
                  height: ratio(50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CustomElevatedButtonWidget(
                backgroundColor: const Color(0XFF3F51F3),
                padding: const EdgeInsets.symmetric(vertical: 21),
                borderRadius: ratio(8),
                text: 'UPDATE',
                textColor: Colors.white,
              ),

              
                    ),
                    SizedBox(width: ratio(7)),
                    Expanded(
                      child: CustomOutlinedButtonWidget(
                borderColor: const Color(0XFFFF1313),
                borderRadius: ratio(8),
                padding: const EdgeInsets.symmetric(vertical: 21),
                borderWidth: 1,
                text: 'DELETE',
                textColor: const Color(0XFFFF1313),
                foregroundColor: Colors.red,

              ),
                    ),

                     SizedBox(
                  height: ratio(50),
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
