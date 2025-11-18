import 'package:dio/dio.dart';
import 'package:pro/features/authication_features/services/auth_api_service.dart';

class AuthRepository
{
  final AuthApiService _apiservice=AuthApiService();
  Future<String?> CallIndexApi(String phonenumber)async
  {
    final Response response=await _apiservice.callAuthApi(phonenumber);
    final String? token=response.data['token'];
    return token;
  }
}