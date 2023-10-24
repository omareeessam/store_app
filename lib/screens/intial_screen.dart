import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_tha/cubit/cubit/app_cubit.dart';

class IntialScreen extends StatefulWidget {
  const IntialScreen({super.key});
  static String id = 'intial screen';
  @override
  State<IntialScreen> createState() => _IntialScreenState();
}

class _IntialScreenState extends State<IntialScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    var ccubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 17,
              iconSize: 25,
              selectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromARGB(167, 255, 235, 59),
              currentIndex: ccubit.currentIndex,
              onTap: (value) {
                ccubit.changeNav(value);
              },
              items: ccubit.listofBottom),
          body: Container(
            child: ccubit.screens[ccubit.currentIndex],
          ),
        );
      },
    );
  }
}
