import 'package:dio/dio.dart';
import 'package:store_tha/remote/dio_helper/dio_helper.dart';
import 'package:store_tha/remote/models/addproduct_model.dart';
import 'package:store_tha/remote/models/update_product.dart';

class UpdateProductServices {
  Future<UpdateProductModel> updateProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category,
      required int id}) async {
    try {
      print(' go  url  ');
      Response response = await MyDio.putData(
          endPoint: 'https://fakestoreapi.com/products/$id',
          data: {
            'title': title,
            'price': price,
            'description': description,
            'image': image,
            'category': category,
            'id': id
          });
      print(response.data);
      print('ok');
      return UpdateProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
