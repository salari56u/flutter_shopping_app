part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState{}

class CategoryCompletedState extends CategoryState
{
  final CategoryModel categoryModel;

  CategoryCompletedState(this.categoryModel);
}

class AllCategoryErrorState extends CategoryState{
  final ErrorMessageClass error;

  AllCategoryErrorState(this.error);
}
