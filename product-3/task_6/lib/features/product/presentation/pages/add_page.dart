import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    double ratio(double num){
      return num * MediaQuery.of(context).size.width / 400;

    }
    return Scaffold(
        appBar: AppBar(
          leading: CustomIconButtonWidget(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icons.arrow_back_ios,
            color: const Color(0XFF3F51F3),
            size: ratio(16),),


          title: CustomTextWidget(
            text :'Add Product',
            family: 'Poppins',
             weight: FontWeight.w500,
             size: ratio(16),
            color: const Color(0XFF3E3E3E)),
          
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
                    color: const Color(0XFFF3F3F3),
                    borderRadius: BorderRadius.all(Radius.circular(ratio(16)))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: ratio(27),
                      color: const Color(0XFF3E3E3E),
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
                height: ratio(20),
              ),

              CustomTextFieldWidget(
                    label: 'name',
                    fillColor: const Color(0XFFF3F3F3),
                    enableBorderColor: Colors.transparent,
                    maxHeight: ratio(40),
                    sizedBox: ratio(5),
                    
                    
                    ),
              SizedBox(height: ratio(10),),

              CustomTextFieldWidget(
                    label: 'category',
                    fillColor: const Color(0XFFF3F3F3),
                    enableBorderColor: Colors.transparent,
                    maxHeight: ratio(40),
                    sizedBox: ratio(5),
                    
                    
                    ),
              SizedBox(height: ratio(10),),

              CustomTextFieldWidget(
                    label: 'price',
                    fillColor: const Color(0XFFF3F3F3),
                    enableBorderColor: Colors.transparent,
                    maxHeight: ratio(40),
                    sizedBox: ratio(5),
                    
                    
                    ),
              SizedBox(height: ratio(10),),

              CustomTextFieldWidget(
                    label: 'decription',
                    fillColor: const Color(0XFFF3F3F3),
                    enableBorderColor: Colors.transparent,
                    maxHeight: ratio(190),
                    maxLines: 5,
                    sizedBox: ratio(5),
                    
                    
                    ),
              
             
              SizedBox(height: ratio(30)),

              CustomElevatedButtonWidget(
                backgroundColor: const Color(0XFF3F51F3),
                padding: const EdgeInsets.symmetric(vertical: 19),
                borderRadius: ratio(8),
                text: 'ADD',
                textColor: Colors.white,
              ),

              SizedBox(height: ratio(7)),

              CustomOutlinedButtonWidget(
                borderColor: const Color(0XFFFF1313),
                borderRadius: ratio(8),
                padding: const EdgeInsets.symmetric(vertical: 19),
                borderWidth: 1,
                text: 'DELETE',
                textColor: const Color(0XFFFF1313),
                foregroundColor: Colors.red,

              ),                     
                  
                ],
              
            
          )),
        ));
  }
}
