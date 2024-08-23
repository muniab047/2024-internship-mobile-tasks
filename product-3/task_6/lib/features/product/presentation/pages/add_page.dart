import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/params/params.dart';
import '../bloc/product_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/loading.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String productName = '',
      productPrice = '',
      productDescription = '',
      productCategory = '';
  XFile? productImage;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();


  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      productImage = pickedFile;
    });
  }

  void clearTextFeild (){
      _nameController.clear();
      _categoryController.clear();
      _descriptionController.clear();
      _priceController.clear();
      setState(() {
        productImage = null;
      });
  }


  @override
  Widget build(BuildContext context) {
    double ratio(double num) {
      return num * MediaQuery.of(context).size.width / 400;
    }

    return Scaffold(
        appBar: AppBar(
          leading: CustomIconButtonWidget(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icons.arrow_back_ios,
            color: const Color(0XFF3F51F3),
            size: ratio(16),
          ),
          title: CustomTextWidget(
              text: 'Add Product',
              family: 'Poppins',
              weight: FontWeight.w500,
              size: ratio(16),
              color: const Color(0XFF3E3E3E)),
          centerTitle: true,
        ),
        body: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
              if (state is InsertSuccessState) {
            // Show a snackbar when the product is successfully added
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),);
            clearTextFeild();
            Navigator.of(context).pushNamed('/home');
            //context.read<ProductBloc>().add(LoadAllProductEvent());
            //Navigator.of(context).pop();

          } else if (state is ErrorState) {
            // Show a snackbar when there's an error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          },
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    ratio(25), ratio(10), ratio(25), ratio(10)),
                child: Form(
                    child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        width: double.infinity,
                        height: ratio(130),
                        decoration: BoxDecoration(
                            color: const Color(0XFFF3F3F3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(ratio(16)))),
                        child: productImage == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: ratio(27),
                                    color: const Color(0XFF3E3E3E),
                                  ),
                                  SizedBox(height: ratio(2)),
                                  Text(
                                    'Upload image',
                                    style: TextStyle(
                                      fontFamily: 'Poppin',
                                      fontWeight: FontWeight.w500,
                                      fontSize: ratio(13),
                                    ),
                                  ),
                                ],
                              )
                            : Image.file(
                                File(productImage!.path),
                                fit: BoxFit.fill,
                              ),
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
                      controller: _nameController,
                      onChanged: (value) {
                        productName = value.trim();
                      },
                    ),
                    SizedBox(
                      height: ratio(10),
                    ),
                    CustomTextFieldWidget(
                      label: 'category',
                      fillColor: const Color(0XFFF3F3F3),
                      enableBorderColor: Colors.transparent,
                      maxHeight: ratio(40),
                      sizedBox: ratio(5),
                      controller: _categoryController,
                      onChanged: (value) {
                        productCategory = value.trim();
                      },
                    ),
                    SizedBox(
                      height: ratio(10),
                    ),
                    CustomTextFieldWidget(
                      label: 'price',
                      fillColor: const Color(0XFFF3F3F3),
                      enableBorderColor: Colors.transparent,
                      maxHeight: ratio(40),
                      sizedBox: ratio(5),
                      controller: _priceController,
                      inputFormatter: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                      ],
                      textInputType:
                          TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        productPrice = value;
                      },
                    ),
                    SizedBox(
                      height: ratio(10),
                    ),
                    CustomTextFieldWidget(
                      label: 'decription',
                      fillColor: const Color(0XFFF3F3F3),
                      enableBorderColor: Colors.transparent,
                      maxHeight: ratio(190),
                      maxLines: 5,
                      sizedBox: ratio(5),
                      controller: _descriptionController,
                      onChanged: (value) {
                        productDescription = value.trim();
                      },
                    ),
                    SizedBox(height: ratio(30)),
                    CustomElevatedButtonWidget(
                      backgroundColor: const Color(0XFF3F51F3),
                      padding: const EdgeInsets.symmetric(vertical: 19),
                      borderRadius: ratio(8),
                      text: 'ADD',
                      textColor: Colors.white,
                      onPressed: () {
                        if (productName != '' &&
                            productDescription != '' &&
                            productPrice != '' &&
                            productImage != null) {
                          context.read<ProductBloc>().add(InsertProductEvent(
                              insertProductParams: InsertProductParams(
                                  name: productName as String,
                                  price: productPrice as String,
                                  description: productDescription as String,
                                  image: productImage as XFile)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('fill all fields')));
                        }
                      },
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
              ),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state is Waiting) {
                  return Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                return SizedBox();
              }),
            ],
          ),
        ));
  }
}
