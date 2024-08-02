import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:task_6/home_page.dart';
import 'package:task_6/add_page.dart';
import 'package:task_6/details_page.dart';
import 'package:task_6/search_page.dart';



void main() {
  runApp(
    DevicePreview(
    enabled: true,
    builder: (context) => MyApp(),
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
        '/details':(context) => details_page(),
        '/add' : (context) => add_page(),
        '/search' : (context) => search_page(),
        

      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: home_page(),
    );
  }
}

