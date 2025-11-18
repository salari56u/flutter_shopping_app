import 'package:dio/dio.dart';
import 'package:pro/features/category_features/model/category_model.dart';
import 'package:pro/features/category_features/services/category_api.dart';

class CategoryRepository
{
  final CategoryApiServices _apiServices=CategoryApiServices();
  Future<CategoryModel> CallIndexApi()async
  {
    Response response=await _apiServices.CalCAtegoryApi();
    final CategoryModel categoryModel=CategoryModel.fromJson(response.data);
    return categoryModel;
  }
}