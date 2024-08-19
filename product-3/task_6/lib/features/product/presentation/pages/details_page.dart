import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/params/params.dart';
import '../bloc/product_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_text.dart';
import '../widgets/loading.dart';
import '../widgets/product_image.dart';
import '../widgets/product_size_box.dart';
import 'update_page.dart';

class DetailsPage extends StatefulWidget {
  final String id;

  const DetailsPage({required this.id, super.key});

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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(GetSingleProductEvent(
        getProductParams: GetProductParams(id: widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    double ratio(double num) {
      return num * MediaQuery.of(context).size.width / 350;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
            if (state is SuccessState) {
            // Show a snackbar when the product is successfully added
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),);
            Navigator.pop(context);
            context.read<ProductBloc>().add(LoadAllProductEvent());

          } else if (state is ErrorState) {
            // Show a snackbar when there's an error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is Loading) {
              return LoadingWidget();
            }
            if (state is ErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is LoadedSingleProductState) {
              return Column(
                children: [
                  Stack(children: [
                    ProductImageWidget(
                      image: state.productEntity.image,
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
                                context
                                    .read<ProductBloc>()
                                    .add(LoadAllProductEvent());
                                Navigator.pop(context);
                              },
                              icon: Icons.keyboard_arrow_left_sharp,
                              color: const Color(0XFF3F51F3),
                              size: ratio(30)),
                        )),
                  ]),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        ratio(20), ratio(5), ratio(20), ratio(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              text: 'hjjkkl',
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
                                text: '4.0',
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
                              text: state.productEntity.name,
                              color: const Color(0xFF3E3E3E),
                              weight: FontWeight.w500,
                              family: 'Poppins',
                              size: ratio(20),
                            ),
                            CustomTextWidget(
                              text: state.productEntity.price.toString(),
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
                                    size: s['s'] as String,
                                    color: s['c'] as Color);
                              }),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ratio(25),
                        ),
                        CustomTextWidget(
                          text: state.productEntity.description,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 21),
                                borderRadius: ratio(8),
                                text: 'UPDATE',
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => UpdatePage(
                                          image: state.productEntity.image,
                                          name: state.productEntity.name,
                                          description:
                                              state.productEntity.description,
                                          price: state.productEntity.price,
                                          id: state.productEntity.id)));
                                },
                              ),
                            ),
                            SizedBox(width: ratio(7)),
                            Expanded(
                              child: CustomOutlinedButtonWidget(
                                borderColor: const Color(0XFFFF1313),
                                borderRadius: ratio(8),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 21),
                                borderWidth: 1,
                                text: 'DELETE',
                                textColor: const Color(0XFFFF1313),
                                foregroundColor: Colors.red,
                                onPressed: () {
                                  context.read<ProductBloc>().add(
                                      DeleteProductEvent(
                                          deleteProductParams:
                                              DeleteProductParams(
                                                  id: state.productEntity.id)));
                                },
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
              );
            } else {
              return Center(
                child: Text('state didnt initiate'),
              );
            }
          },
        ),
      ),
    ));
  }
}
