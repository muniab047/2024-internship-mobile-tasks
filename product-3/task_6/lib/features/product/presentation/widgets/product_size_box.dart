import 'package:flutter/material.dart';

import 'custom_text.dart';

class ProductSizeBoxWidget extends StatelessWidget {
  final String size;
  final Color color;

  const ProductSizeBoxWidget(
      {required this.size, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    double ratio(double num) {
      return num * MediaQuery.of(context).size.width / 350;
    }

    return Container(
        margin: EdgeInsets.fromLTRB(ratio(5), ratio(4), ratio(5), ratio(4)),
        height: ratio(50),
        width: ratio(50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ratio(8)),
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: ratio(0.5),
                  blurRadius: ratio(1),
                  offset: Offset(0, ratio(2)))
            ]),
        child: TextButton(
          onPressed: null,
          child: CustomTextWidget(
            text: size,
            size: ratio(19),
            weight: FontWeight.w500,
            color: color == const Color(0XFFF5FAFB)
                ? const Color(0xFF000000)
                : const Color(0xFFFFFFFF),
          ),
        ));
  }
}
