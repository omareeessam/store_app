import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_tha/remote/dio_helper/dio_helper.dart';
import 'package:store_tha/remote/models/all_product_model.dart';

class GetAllProduct {
  Future<List<AllProductModel>> getAllProduct() async {
    Response response = await MyDio.getData(path: 'products');
    List<dynamic> rospone = response.data;
    List<AllProductModel> myList =
        rospone.map((e) => AllProductModel.fromJson(e)).toList();
    return myList;
  }
}
