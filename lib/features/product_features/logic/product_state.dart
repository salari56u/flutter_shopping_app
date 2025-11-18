part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState{}

class ProductCompletedState extends ProductState
{
  ProductModel productModel;

  ProductCompletedState(this.productModel);
}

class ProductErrorState extends ProductState
{
  final ErrorMessageClass errormassage;

  ProductErrorState(this.errormassage);
}
