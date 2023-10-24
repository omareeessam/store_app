import 'package:dio/dio.dart';

class MyDio {
  static late Dio dio;
  init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({required path}) {
    return dio.get(path);
}
  ////////////////////////////////////////
  static Future postData({
    required String endPoint,
  required Map<String,dynamic> data,
   Map<String,dynamic>? query
   }) async {
    dio.options.headers = {
    'Accept':'application/json',
     'Content-Type':'application/x-www-form-urlencoded'
    };
  return await dio.post(endPoint,data: data,queryParameters: query );
  }
  /////////////////////////////////////////
  posttData(
      {required String path,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token,
      Map<String, dynamic>? query
      }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.post(path, data: data, queryParameters: query);
  }
  ////////////////////////////////////////////////////////////////
  static Future<Response> putData({
    required String endPoint,
  required Map<String,dynamic> data,
   Map<String,dynamic>? query
   }) async {
    dio.options.headers = {
    'Accept':'application/json',
     'Content-Type':'application/x-www-form-urlencoded'
    };
  return await dio.put(endPoint,data: data,queryParameters: query );
  }
}


// class DioHelper {
//   static late Dio dio;
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: "https://newsapi.org/v2/",
//         receiveDataWhenStatusError: true,
//         receiveTimeout: Duration(seconds: 30),
//         connectTimeout: Duration(seconds: 30),
//       ),
//     );
//   }
// }
