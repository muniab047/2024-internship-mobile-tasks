import 'package:flutter/material.dart';

class text extends StatelessWidget {
  final String? family, txt;
  final double? size;
  final int? color;
  final FontWeight? weight;
  


  text({Key? key, this.family, this.size, this.txt, this.color, this.weight}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size.width;

    double fontsize =  screensize * (this.size?? 0) / 350;
    return Text(
       maxLines: null ,
       this.txt ?? '', 
       style: TextStyle(
        fontFamily: this.family,
        fontSize: fontsize ,
        color: Color(this.color??0XFFFFFFFF),
        fontWeight: this.weight,
        
        
      
      ));
    
        
      
      
    
  }
}