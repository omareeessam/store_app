import 'package:dio/dio.dart';
import 'package:store_tha/remote/dio_helper/dio_helper.dart';
import 'package:store_tha/remote/models/addproduct_model.dart';

class AddProduct {
  addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Response response = await MyDio.postData(
        endPoint: 'https://fakestoreapi.com/products',
        data: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category
        });
    return AddProductModel.fromJson(response.data);
  }
}
