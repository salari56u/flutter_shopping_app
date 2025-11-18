import 'package:dio/dio.dart';
import 'package:pro/features/home_features/model/home_model.dart';
import 'package:pro/features/home_features/services/home_api.dart';

class HomeRepository
{

  HomeApiServices _ApiServices=HomeApiServices();

  Future<dynamic> CallIndexApi()async
  {
    Response response=await _ApiServices.callHomeApi();
    final HomeModel homeModel=HomeModel.fromJson(response.data);
    return homeModel;
  }
}