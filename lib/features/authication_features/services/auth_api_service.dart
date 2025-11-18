import 'package:dio/dio.dart';
import 'package:pro/const/connection.dart';

class AuthApiService {
  final Dio _dio = Dio();

  /// call authentication api
  Future<Response> callAuthApi(String phoneNumber) async {
    final Response response = await _dio.post(
      '$apiUlr/login',
      queryParameters: {'mobile': phoneNumber},
    );
    return response;
  }
}