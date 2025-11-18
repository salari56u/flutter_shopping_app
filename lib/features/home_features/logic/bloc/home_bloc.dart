import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:pro/features/home_features/model/home_model.dart';
import 'package:pro/features/public_features/error/error_exception.dart';
import 'package:pro/features/public_features/error/error_massage_class.dart';

import '../../services/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {
  final HomeRepository homeRepositoty;
  HomeBloc(this.homeRepositoty) : super(HomeInitial()) {
    on<CallHomeEvent>(_callHomeApi);
  }

  FutureOr<void> _callHomeApi(CallHomeEvent event, Emitter<HomeState> emit)async {
    emit(HomeLoadingState());
   try
   {
     HomeModel _homemodel=await homeRepositoty.CallIndexApi();
     emit(HomeCompletedState(_homemodel));
   }on DioException catch(e)
    {
      emit(HomeErrorState(error: ErrorMessageClass(errorMsg: ErrorExceptions().fromError(e))));
    }
  }
}
