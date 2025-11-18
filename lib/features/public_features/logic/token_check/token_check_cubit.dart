import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pro/features/public_features/function/secure_storage.dart';

part 'token_check_state.dart';

class TokenCheckCubit extends Cubit<TokenCheckState> {
  TokenCheckCubit() : super(TokenCheckInitial());

  checkToken()async
  {
    final statuse=await SecureStorageClass().getusertoken();
    if(statuse !=null)
      {
        emit(TokenCheckIslog());
      }
    else
      {
        emit(TokenCheckIsnotlog());
      }
  }
}
