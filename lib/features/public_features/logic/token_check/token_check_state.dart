part of 'token_check_cubit.dart';

@immutable
sealed class TokenCheckState {}

final class TokenCheckInitial extends TokenCheckState {}
final class TokenCheckIslog extends TokenCheckState {}
final class TokenCheckIsnotlog extends TokenCheckState {}
