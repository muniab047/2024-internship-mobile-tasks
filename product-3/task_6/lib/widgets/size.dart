import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_6/widgets/text.dart';

class product_size extends StatelessWidget {
  final String? size;
  final int? color;
  product_size({this.color, this.size, super.key});

  @override
  Widget build(BuildContext context) {
    
    double ratio(num){
      return num * MediaQuery.of(context).size.width / 350;
    }

    return Container(
      margin: EdgeInsets.fromLTRB(ratio(5) ,ratio(4), ratio(5) , ratio(4)),
      height: ratio(50),
      width: ratio(50),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ratio(8)),
          color: Color(this.color ?? 0),
          
          boxShadow: [ BoxShadow(
            color:Colors.black.withOpacity(0.1) ,
            spreadRadius: ratio(0.5),
            blurRadius: ratio(1),
            offset: Offset(0, ratio(2))
          )]
          ),
        child: TextButton(
          onPressed: null,

          child: text(
            txt: this.size ?? '0',
            size: 19,
            weight: FontWeight.w500,
            color: this.color == 0XFFF5FAFB ? 0xFF000000 :  0xFFFFFFFF

            ),
          
          
          
        ));
  }
}
