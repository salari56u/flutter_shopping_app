import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/const/responsive.dart';
import 'package:pro/const/theme/colors.dart';
import 'package:pro/const/shape/media_query.dart';
import 'package:pro/features/home_features/screen/home_screen.dart';
import 'package:pro/features/intro_features/pref/shared_pref.dart';
import 'package:pro/features/intro_features/screen/intoscreen.dart';

import '../../public_features/screens/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String screenId ='/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  navigate()
  {
    Timer(Duration(seconds: 3), ()async {

      if(await Shared_Pref().getIntroStatus())
        {
          Navigator.of(context).pushNamedAndRemoveUntil( BottomNavBar.screenId, (route) => false);
        }
      else
        Navigator.of(context).pushReplacementNamed(IntoScreen.intoId);

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    navigate();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdesktop= Responsive.isDesktop(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: FadeInDown(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius:isdesktop?getWidth(context, 0.05):getWidth(context, 0.16),
                backgroundColor: theme.scaffoldBackgroundColor,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: isdesktop?getWidth(context, 0.05):getWidth(context, 0.16),
                ),
              ),
              SizedBox(height: 2.5.sp),
              Text('soheil Kala',
              style: TextStyle
                (
                color: whiteColor,
                fontSize:isdesktop?13.sp: 16.sp,
                fontFamily: 'bold',
                fontWeight: FontWeight.bold
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
