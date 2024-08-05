import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';


import '../features/product/presentation/pages/add_page.dart';
import '../features/product/presentation/pages/details_page.dart';
import '../features/product/presentation/pages/home_page.dart';
import '../features/product/presentation/pages/search_page.dart';




void main() {
  runApp(
    DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/details':(context) => const DetailsPage( image: '', item: '',price: '', product: '',rating: '',),
        '/add' : (context) => const AddPage(),
        '/search' : (context) => const SearchPage(),
        

      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

