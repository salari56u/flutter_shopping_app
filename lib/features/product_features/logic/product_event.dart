part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}


class CallProductEvent extends ProductEvent
{
  final String id;

  CallProductEvent(this.id);
}