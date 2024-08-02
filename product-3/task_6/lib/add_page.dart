import 'package:flutter/material.dart';

class add_page extends StatefulWidget {
  const add_page({super.key});

  @override
  State<add_page> createState() => _add_pageState();
}

class _add_pageState extends State<add_page> {
  @override
  Widget build(BuildContext context) {
    double ratio(num){
      return num * MediaQuery.of(context).size.width / 400;

    }
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0XFF3F51F3),
              size: ratio(16),
            ),
          ),
          title: Text(
            'Add Product',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: ratio(16),
                color: Color(0XFF3E3E3E)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(ratio(25), ratio(10), ratio(25), ratio(10)),
          child: Form(
              child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: ratio(130),
                decoration: BoxDecoration(
                    color: Color(0XFFF3F3F3),
                    borderRadius: BorderRadius.all(Radius.circular(ratio(16)))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: ratio(27),
                      color: Color(0XFF3E3E3E),
                    ),
                    SizedBox(height: ratio(2)),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'Upload image',
                          style: TextStyle(
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.w500,
                              fontSize: ratio(13)),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: ratio(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'name',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: ratio(12),
                        color: Color(0XFF3E3E3E)),
                  ),
                  Container(
                    height: ratio(45),
                    decoration: BoxDecoration(
                        color: Color(0XFFF3F3F3),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    margin: EdgeInsets.fromLTRB(0, ratio(6), 0, ratio(10)),
                    child: TextField(
                      style: TextStyle(
                        color: const Color(0xFF504F4F),
                        fontSize: ratio(15)
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        
                        
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'category',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: ratio(12),
                        color: Color(0XFF3E3E3E)),
                  ),
                  Container(
                    height: ratio(45),
                    decoration: BoxDecoration(
                        color: Color(0XFFF3F3F3),
                        borderRadius: BorderRadius.all(Radius.circular(ratio(6)))),
                    margin: EdgeInsets.fromLTRB(0, ratio(6), 0, ratio(10)),
                    child: TextField(
                      style: TextStyle(
                        color: const Color.fromARGB(255, 80, 79, 79),
                        fontSize: ratio(15)
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  )
                ],
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
                        color: Color(0XFF3E3E3E)),
                  ),
                  Container(
                    height: ratio(45),
                    decoration: BoxDecoration(
                        color: Color(0XFFF3F3F3),
                        borderRadius: BorderRadius.all(Radius.circular(ratio(6)))),
                    margin: EdgeInsets.fromLTRB(0, ratio(6), 0, ratio(10)),
                    child: TextField(
                      style: TextStyle(
                        color: const Color.fromARGB(255, 80, 79, 79),
                        fontSize: ratio(15)
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'description',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: ratio(12),
                        color: Color(0XFF3E3E3E)),
                  ),
                  Container(
                    
                    height: ratio( 90),
                    decoration: BoxDecoration(
                        color: Color(0XFFF3F3F3),
                        borderRadius: BorderRadius.all(Radius.circular(ratio(6)))),
                    margin: EdgeInsets.fromLTRB(0, ratio(6), 0, ratio(10)),
                    child: TextField(
                      maxLines: null,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 80, 79, 79),
                        fontSize: ratio(15)
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: ratio(15)),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: ratio(10)),
                      width: double.infinity,
                      height: ratio(42),
                      decoration: BoxDecoration(
                      color: Color(0XFF3F51F3),
                      borderRadius: BorderRadius.all(Radius.circular(ratio(8))),
                      
                      

                      ),
                      
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'ADD',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: ratio(12),
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                ratio(8)), // Adjust the border radius here
                          ),
                        ),
                      )),
                      Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: ratio(10)),
                      height: ratio(42),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(ratio(8))),
                      border: Border.all(color: Color(0XFFFF1313))
                      

                      ),
                      
                      child: OutlinedButton(
                        onPressed: null,
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: ratio(12),
                              color: Color(0XFFFF1313),
                        ),),
                        
                        
                      )),
                  
                ],
              )
            ],
          )),
        ));
  }
}
