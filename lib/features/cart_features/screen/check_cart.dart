import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro/features/authication_features/screen/auth_screen.dart';
import 'package:pro/features/cart_features/screen/cart_Screen.dart';
import 'package:pro/features/public_features/logic/token_check/token_check_cubit.dart';

class CheckCart extends StatelessWidget {
  const CheckCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenCheckCubit,TokenCheckState>(builder:(context, state)
    {
      if(state is TokenCheckIslog)
        {
          return const CartScreen();
        }
      else
        {
          return const AuthAcreen();
        }

    },);
  }
}
