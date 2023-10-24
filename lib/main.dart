import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_tha/cubit/cubit/app_cubit.dart';
import 'package:store_tha/remote/dio_helper/dio_helper.dart';
import 'package:store_tha/remote/models/all_product_model.dart';
import 'package:store_tha/screens/home_screen/home_screen.dart';
import 'package:store_tha/screens/home_screen/show_product.dart';
import 'package:store_tha/screens/intial_screen.dart';
import 'package:store_tha/screens/updatescren.dart';

void main() {
  MyDio().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCategory(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: IntialScreen.id,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          IntialScreen.id: (context) => IntialScreen(),
          UpdateScreen.id: (context) => UpdateScreen(),
          ShowProductScreen.id: (context) =>
              ShowProductScreen(allProductModel: AllProductModel()),
        },
        home: const HomeScreen(),
      ),
    );
  }
}
