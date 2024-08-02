import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final String? image, product, price, item, rating ;

  const card({this.image, this.product, this.price, this.item, this.rating, Key ? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio(num){
      return num * 1.0;

    }
    return Card(
      child: Column(
        children: [
          Container(
              height: ratio(160),
              width:  double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.asset(
                  this.image ?? '',
                  fit: BoxFit.cover,
                ),
              )),
          Container(
              padding: EdgeInsets.fromLTRB(15, 7, 15, 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        this.product ?? '',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: const Color(0xFF3E3E3E)),
                      ),
                      Text(
                        this.price ?? '',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xFF3E3E3E)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        this.item ?? '',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xFFAAAAAA)),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Image.asset('assets/icon/image3.png'),
                          ),
                          Text(
                            this.rating ?? '',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color(0xFFAAAAAA)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
