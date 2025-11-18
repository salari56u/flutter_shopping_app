import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:pro/features/category_features/model/category_model.dart';
import 'package:pro/features/public_features/error/error_exception.dart';
import 'package:pro/features/public_features/error/error_massage_class.dart';

import '../services/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;
  CategoryBloc(this.repository) : super(CategoryInitial()) {
    on<CallCategory>((event, emit)async {
      emit(CategoryLoadingState());
      try
      {
        CategoryModel categoryModel=await repository.CallIndexApi();
        emit(CategoryCompletedState(categoryModel));
      }
      on DioException catch (e) {
        emit(AllCategoryErrorState(ErrorMessageClass(errorMsg: ErrorExceptions().fromError(e))));
      }
    });
  }
}
