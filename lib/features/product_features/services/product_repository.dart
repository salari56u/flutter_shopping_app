import 'package:dio/dio.dart';
import 'package:pro/features/product_features/model/product_model.dart';
import 'package:pro/features/product_features/services/product_api_services.dart';

class ProductRepository {
  ProductApiServices _apiServices = ProductApiServices();

  Future<ProductModel> callDetailProduct(String id) async {
    final Response response = await _apiServices.callDetailProductApi(id);

    ProductModel productModel = ProductModel.fromJson(response.data);
    return productModel;
  }
}
