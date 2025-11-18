part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState{}

class HomeCompletedState extends HomeState
{
  final HomeModel homeModel;

  HomeCompletedState(this.homeModel);
}

class HomeErrorState extends HomeState
{
  final ErrorMessageClass error;

  HomeErrorState({required this.error});
}
