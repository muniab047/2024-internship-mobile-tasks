import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_entity.dart';
import '../bloc/product_bloc.dart';
import '../widgets/card_grid_view.dart';
import '../widgets/custom_text.dart';
import '../widgets/loading.dart';
import '../widgets/product_card.dart';
import 'details_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override

  State<HomePage> createState() => _HomePageState();}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(LoadAllProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    double ratio(double num) {
      return num * MediaQuery.of(context).size.width / 500;
    }

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: ratio(80),
            title: Container(
              padding: EdgeInsets.fromLTRB(0, ratio(0), ratio(10), ratio(20)),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: CustomTextWidget(
                        text: 'July 14, 2023',
                        color: const Color(0xFFABABAB),
                        weight: FontWeight.w500,
                        family: 'Syne',
                        size: ratio(12),
                      ),
                      subtitle: RichText(
                          text: TextSpan(
                              text: 'Hello ',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w400,
                                  fontSize: ratio(15),
                                  color: const Color.fromARGB(148, 0, 0, 0)),
                              children: [
                            TextSpan(
                                text: 'Yohannes',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w500,
                                    fontSize: ratio(15),
                                    color: const Color.fromARGB(255, 0, 0, 0)))
                          ])),
                      leading: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFCCCCCC),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: ratio(40),
                      height: ratio(40),
                      child: Image.asset('assets/icon/image1.png')),
                ],
              ),)
              ),
        body: Container(
            padding:
                EdgeInsets.fromLTRB(ratio(20), ratio(5), ratio(20), ratio(5)),
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {

                  if (state is Loading){
                      return LoadingWidget();
                     }
                  
                 
                     else if (state is LoadedAllProductState){
                      
                      return Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    text: 'Available Products',
                                    weight: FontWeight.w600,
                                    family: 'Poppins',
                                    size: ratio(24),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(ratio(10))),
                                        border: Border.all(
                                          color: const Color(0XFFD9D9D9),
                                        )),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => SearchPage(allProducts: state.allProducts))
                                        );
                                      },
                                      icon: Icon(
                                        Icons.search_outlined,
                                        size: ratio(30),
                                      ),
                                    ),
                                  )
                                ]),
                            SizedBox(
                              height: ratio(20),
                            ),
                            Expanded(
                              child: CardGridView(allProducts: state.allProducts),
                            )
                          ],
                        );}
                    else if (state is ErrorState){
                      return Center(child: Text(state.message)); 
                    }
                   
                    else{
                      print(state);
                      return Center(child: Text('sth wrong')); 
                    }
                
              },
            )),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF3F51F3),
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.of(context).pushNamed('/add');
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )));
  }
}
