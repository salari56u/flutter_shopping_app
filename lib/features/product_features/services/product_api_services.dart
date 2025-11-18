import 'package:dio/dio.dart';
import 'package:pro/const/connection.dart';
import 'package:pro/features/public_features/function/secure_storage.dart';

class ProductApiServices {
  final Dio _dio = Dio();


  /// call detail product by product id
  Future<Response> callDetailProductApi(String id) async {
    final token = await SecureStorageClass().getusertoken()??false;
    print('-----------------------------');
    print(token);

    final Response response = await _dio.get('$apiUlr/product/$id/$token');

    return response;
  }
}