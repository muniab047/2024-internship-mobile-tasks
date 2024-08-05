import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String? family;
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomTextWidget({super.key, 
                          this.family, 
                          this.size, 
                          required this.text, 
                          this.color, 
                          this.weight});

  @override
  Widget build(BuildContext context) {
    
    return Text(
      
       maxLines: null ,
       text, 
       style: TextStyle(
        fontFamily: family,
        fontSize: size ,
        color: color?? Colors.black,
        fontWeight: weight,       
      
      ));
  }
}