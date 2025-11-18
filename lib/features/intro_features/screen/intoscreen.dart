import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/const/responsive.dart';
import 'package:pro/const/shape/media_query.dart';
import 'package:pro/const/theme/colors.dart';
import 'package:pro/features/intro_features/logic/intro_cubit.dart';
import 'package:pro/features/intro_features/pref/shared_pref.dart';
import 'package:pro/features/public_features/screens/bottom_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../home_features/screen/home_screen.dart';

class IntoScreen extends StatefulWidget {
  const IntoScreen({super.key});
  static const String intoId = '/Into_Screen';
  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  PageController pageController = PageController();

  List<Widget> pageItem = [
    const page(
        Image1: 'assets/images/intro/Apple-iPad-PNG-Free-Download.png',
        title: 'آسان خرید و فروش کن',
        description: 'اپ تخصصی خرید و فروش کالا '),
    const page(
        Image1: 'assets/images/intro/iphone-x-pictures-45229.png',
        title: 'تخصص حرف اول رو میزنه',
        description: 'خرید و فروسش آسان با تیم تخصصی '),
    const page(
        Image1: 'assets/images/intro/pngwing.com.png',
        title: 'همه چی اینجا هست',
        description: 'ثبت خرید و فروش تنها با یک کلیک'),
    const page(
        Image1: 'assets/images/intro/pngwing.com1.png',
        title: 'اعتماد به ایران',
        description: 'اپ تخصصی خرید و فروش کالا '),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 200,
              color: primaryColor,
            ),
          ),
          Center(
            child: BlocBuilder<IntroCubit, int>(
  builder: (context, state) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getWidth(context, 0.6),
                  height: 275,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                        controller: pageController,
                        itemCount: pageItem.length,
                        itemBuilder: (context, index) {
                          return pageItem[index];
                        },

                      onPageChanged: (value) {
                          BlocProvider.of<IntroCubit>(context).chageindex(value);
                      },
                        ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: pageItem.length,
                  // forcing the indicator to use a specific direction
                  textDirection: TextDirection.rtl,
                  effect: ExpandingDotsEffect
                    (
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 5,
                    activeDotColor: primaryColor
                  ),
                ),
                SizedBox(height: 10.sp,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(getWidth(context, 0.3), 40)),
                    onPressed: () {
                       if( BlocProvider.of<IntroCubit>(context).cuurectIndex < 3)
                       {
                         pageController.nextPage(
                             duration: Duration(milliseconds: 300),
                             curve: Curves.ease);
                       }
                       else
                       {
                         Shared_Pref().setIntrostatus();
                         Navigator.of(context).pushNamedAndRemoveUntil( BottomNavBar.screenId, (route) => false);
                       }
                    },
                    child:  Text(
                      BlocProvider.of<IntroCubit>(context).cuurectIndex < 3 ? 'ورق بزن' : 'بزن بریم',
                      style:  TextStyle(
                          fontFamily: 'bold', fontWeight: FontWeight.bold),
                    ))
              ],
            );
  },
),
          )
        ],
      ),
    );
  }
}

class page extends StatelessWidget {
  const page({
    super.key,
    required this.Image1,
    required this.title,
    required this.description,
  });
  final String Image1;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    final isdesktop=Responsive.isDesktop(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            Image1,
            height:isdesktop? 100: 200,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'bold',
                fontSize:isdesktop?8.sp :16.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'normal',
              fontSize:isdesktop?6.sp: 12.sp,
            ),
          )
        ],
      ),
    );
  }
}
