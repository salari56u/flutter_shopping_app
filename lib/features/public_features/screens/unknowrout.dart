import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/const/responsive.dart';
import 'package:pro/const/shape/media_query.dart';

class UnknowRout extends StatelessWidget {
  const UnknowRout({super.key});
  static const String unkowId='UnkowId';
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: Center(child: Column
        (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Image.asset('assets/images/dontknow.png',width: getWidth(context, 0.5),),
          SizedBox(height: 8.sp,),
          Text('صفحه ی مورد نظر یافت نشد!',style: TextStyle
            (
            fontWeight: FontWeight.bold,
            fontFamily: 'bold',
            fontSize:Responsive.isDesktop(context)?12.sp: 18.sp
          ),)
        ],
      ),),
    );
  }
}
