part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
class AuthLoadingState extends AuthState{}
class AuthCompletedState extends AuthState
{
  final String token;

  AuthCompletedState(this.token);
}
class AuthErrorState extends AuthState
{
  final ErrorMessageClass error;

  AuthErrorState(this.error);
}
