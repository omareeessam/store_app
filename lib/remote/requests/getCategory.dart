import 'package:dio/dio.dart';
import 'package:store_tha/remote/dio_helper/dio_helper.dart';
import 'package:store_tha/remote/models/get_category.dart';

class GetCategory {
  Future getCategory({required nameCategory}) async {
    Response response =
        await MyDio.getData(path: 'products/category/$nameCategory');
    return GetCategoryModel.fromJson(response.data);
  }
}
