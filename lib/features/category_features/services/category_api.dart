import 'package:dio/dio.dart';
import 'package:pro/const/connection.dart';

class CategoryApiServices
{
  final Dio _dio=Dio();
  Future<Response> CalCAtegoryApi()async
  {
    _dio.options.connectTimeout=const Duration(seconds: 25);
    _dio.options.receiveTimeout=const Duration(seconds: 25);
    _dio.options.sendTimeout=const Duration(seconds: 25);
    final Response response=await _dio.get('$apiUlr/get-menu-category');
    return response;
  }

}