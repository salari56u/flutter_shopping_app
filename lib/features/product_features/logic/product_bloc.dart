import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:pro/features/product_features/model/product_model.dart';
import 'package:pro/features/public_features/error/error_exception.dart';
import 'package:pro/features/public_features/error/error_massage_class.dart';

import '../services/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository  productRepository;
  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<CallProductEvent>(_calldetailproduct);
  }

  FutureOr<void> _calldetailproduct(CallProductEvent event, Emitter<ProductState> emit) async{
    emit(ProductLoadingState());

    try
        {
          final ProductModel productModel=await productRepository.callDetailProduct(event.id);
          emit(ProductCompletedState(productModel));
        }
    on DioException catch(e)
    {
      emit(ProductErrorState(ErrorMessageClass(errorMsg: ErrorExceptions().fromError(e))));
    }
  }
}
