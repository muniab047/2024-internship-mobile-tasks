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
import '../widgets/product_image.dart';
import 'details_page.dart';

class UpdatePage extends StatefulWidget {
  final String image, name, description, id;
  final double price;
  const UpdatePage({super.key, required this.image, required this.name, required this.description, required this.price, required this.id});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late String productName = widget.name,
      productPrice = widget.price.toString(),
      productDescription = widget.description,
      productCategory = '',
      id = widget.id, 
      image = widget.image;
      



  late final TextEditingController _nameController = TextEditingController(text: productName);
  late final TextEditingController _priceController= TextEditingController(text: productPrice);
  late final TextEditingController _descriptionController = TextEditingController(text: productDescription);
  late final TextEditingController _categoryController = TextEditingController();

  

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
              text: 'Update Product',
              family: 'Poppins',
              weight: FontWeight.w500,
              size: ratio(16),
              color: const Color(0XFF3E3E3E)),
          centerTitle: true,
        ),
        body: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
              if (state is UpdateSuccessState) {
            // Show a snackbar when the product is successfully added
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),);
            Navigator.pushNamed(context, '/home');

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
                    Container(
                      width: double.infinity,
                      height: ratio(130),
                      decoration: BoxDecoration(
                          color: const Color(0XFFF3F3F3),
                          borderRadius:
                              BorderRadius.all(Radius.circular(ratio(16)))),
                      child: ProductImageWidget(image: image, fit: BoxFit.fill)
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
                      text: 'UPDATE',
                      textColor: Colors.white,
                      onPressed: () {
                        if (productName != '' &&
                            productDescription != '' &&
                            productPrice != '') {
                          context.read<ProductBloc>().add(UpdateProductEvent(
                              updateProductParams: UpdateProductParams(
                                  id: id,
                                  name: productName as String,
                                  price: double.parse(productPrice),
                                  description: productDescription as String,
                                  )));
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
