import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'injection_container.dart' as di;

import '../features/product/presentation/pages/add_page.dart';
import '../features/product/presentation/pages/details_page.dart';
import '../features/product/presentation/pages/home_page.dart';
import '../features/product/presentation/pages/search_page.dart';
import 'injection_container.dart';

void main() async {
  await di.init();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => di.sl<ProductBloc>(),
        ),
        // Add other providers here if needed
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/add': (context) => const AddPage(),
          
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}