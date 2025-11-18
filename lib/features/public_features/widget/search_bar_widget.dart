import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/responsive.dart';
import '../../../const/shape/border_raduis.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8.sp, horizontal: getWidth(context, 0.02)),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(context, 0.02), vertical: 8.sp),
        height: Responsive.isTablet(context) ? 65 : 40,
        decoration: BoxDecoration(
            color: textFieldColor, borderRadius: getBorderRadiusFunc(7.5)),
        child: Row(
          children: [
            Icon(
              Icons.search,
            ),
            SizedBox(
              width: getWidth(context, 0.01),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'جستجو در',
                  style: Responsive.isTablet(context)
                      ? TextStyle(fontSize: 14.sp, fontFamily: 'bold')
                      : TextStyle(fontSize: 16.sp, fontFamily: 'bold'),
                ),
                Text(
                  ' سهیل کالا',
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: 'bold',
                      fontSize: Responsive.isTablet(context) ? 15.sp : 18.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}