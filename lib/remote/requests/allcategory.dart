import 'package:dio/dio.dart';
import 'package:store_tha/remote/dio_helper/dio_helper.dart';

class GetAllCategory {
  Future<List<dynamic>> getAllCategory() async {
    Response response = await MyDio.getData(path: 'products/categories');
    List<dynamic> myList = response.data;
    return myList;
  }
}
