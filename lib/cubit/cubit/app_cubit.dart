import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_tha/remote/models/all_product_model.dart';
import 'package:store_tha/remote/requests/allProduct.dart';
import 'package:store_tha/remote/requests/allcategory.dart';
import 'package:store_tha/screens/category_screen.dart';
import 'package:store_tha/screens/get_category.dart';
import 'package:store_tha/screens/home_screen/home_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  changeNav(int value) {
    currentIndex = value;
    emit(ChangeNav());
  }

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    GetCategoryScreen(),
  ];
  List<BottomNavigationBarItem> listofBottom = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: 'category',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.production_quantity_limits),
      label: 'product',
    ),
  ];

  Map<int, bool> favourites = {};

  List<AllProductModel> myList = [];
  void getAllProduct() {
    emit(AppLoadin());
    GetAllProduct().getAllProduct().then((value) {
      myList = value;
     
      emit(AppSuccess());
    }).catchError((e) {
      emit(AppError(message: e.toString()));
    });
  }

  List<dynamic> allCategory = [];
  void getCategory() {
    emit(AppLoadinAllCategory());
    GetAllCategory().getAllCategory().then((value) {
      allCategory = value;
      emit(AppSuccessAllCategory());
    }).catchError((e) {
      emit(AppError(message: e.toString()));
    });
  }
}
