import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/const/theme/theme.dart';
import 'package:pro/features/category_features/screen/category_screen.dart';
import 'package:pro/features/home_features/logic/cubit/home_cubit.dart';
import 'package:pro/features/home_features/screen/home_screen.dart';
import 'package:pro/features/home_features/services/home_repository.dart';
import 'package:pro/features/intro_features/logic/intro_cubit.dart';
import 'package:pro/features/intro_features/screen/intoscreen.dart';
import 'package:pro/features/intro_features/screen/splash_screen.dart';
import 'package:pro/features/public_features/screens/bottom_nav_bar.dart';
import 'package:pro/features/public_features/screens/unknowrout.dart';

import 'features/authication_features/screen/auth_screen.dart';
import 'features/home_features/logic/bloc/home_bloc.dart';
import 'features/product_features/screen/product_detail.dart';
import 'features/public_features/logic/bottomnav_cubit.dart';
import 'features/public_features/logic/token_check/token_check_cubit.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
       providers: 
       [
         BlocProvider(create: (context) => IntroCubit()),
         BlocProvider(create: (context) => TokenCheckCubit()),
         BlocProvider(create: (context) => HomeCubit()),
         BlocProvider(create: (context) => BottomnavCubit()),
         BlocProvider(create: (context) => HomeBloc(HomeRepository()))
       ],
        child: MaterialApp(
          theme: CustomTheme.lightTheme,
          //home: SplashScreen(),

          initialRoute: SplashScreen.screenId,
          onUnknownRoute: (settings) =>
              MaterialPageRoute(builder: (context) => UnknowRout()),
          routes: {
            SplashScreen.screenId: (context) => SplashScreen(),
            IntoScreen.intoId: (context) => IntoScreen(),
            HomeScreen.screenId: (context) => HomeScreen(),
            BottomNavBar.screenId: (context) => BottomNavBar(),
            CategoryScreen.screenId: (context) => CategoryScreen(),
            AuthAcreen.screenId: (context) => AuthAcreen(),
            ProductDetailScreen.screenId: (context) => ProductDetailScreen(),
          },
        ),
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}

