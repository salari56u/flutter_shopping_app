import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/const/responsive.dart';
import 'package:pro/const/shape/media_query.dart';
import 'package:pro/const/theme/colors.dart';
import 'package:pro/features/authication_features/logic/auth_bloc.dart';
import 'package:pro/features/authication_features/services/auth_repositry.dart';
import 'package:pro/features/public_features/function/secure_storage.dart';
import 'package:pro/features/public_features/logic/token_check/token_check_cubit.dart';
import 'package:pro/features/public_features/widget/snack_bar.dart';

import '../../public_features/screens/bottom_nav_bar.dart';
import '../widget/textformfield_widget.dart';

class AuthAcreen extends StatefulWidget {
  const AuthAcreen({super.key});
  static const String screenId = '/auth_screen';
  @override
  State<AuthAcreen> createState() => _AuthAcreenState();
}

class _AuthAcreenState extends State<AuthAcreen> {
  final TextEditingController _editingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _editingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperOne(),
          child: Container(
            height: 200,
            color: primaryColor,
          ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(AuthRepository()),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthErrorState) {
                getSnackBarWidget(context, state.error.errorMsg!, Colors.red);
              }
              if (state is AuthCompletedState) {
                SecureStorageClass().saveusertoken(state.token);
                Navigator.pushNamedAndRemoveUntil(
                    context, BottomNavBar.screenId, (route) => false);
                getSnackBarWidget(context, 'با موفقیت وارد شدید', Colors.green);
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return Center(
                child: Form(
                  key: _globalKey,
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: getWidth(context, 0.15),
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        const Text(
                          'برای احراز هویت شماره موبایل خود را وارد نمایید',
                          style: TextStyle(fontFamily: 'normal'),
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        TextFormFieldMobileWidget(
                          labelText: 'شماره ی موبایل',
                          textInputAction: TextInputAction.done,
                          icon: const Icon(Icons.phone_android_outlined),
                          controller: _editingController,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        SizedBox(
                          height: 25.sp,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(getWidth(context, 0.6),
                                    Responsive.isTablet(context) ? 60 : 45)),
                            onPressed: () {
                              if (_globalKey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                    CallAuthEvent(_editingController.text));
                              }
                            },
                            child: const Text(
                              'ورود',
                              style: TextStyle(fontFamily: 'bold'),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
