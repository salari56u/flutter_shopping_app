import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/responsive.dart';
import '../../../const/shape/border_raduis.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';
import '../../public_features/function/number_format.dart';
import '../model/home_model.dart';

class AmazingWidget extends StatelessWidget {
  const AmazingWidget({
    super.key,
    required this.homeModel,
    required this.theme,
  });

  final HomeModel homeModel;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return homeModel.amazing==null?const SizedBox.shrink(): Container(
      width: getAllWidth(context),
      height: Responsive.isTablet(context)
          ? getWidth(context, 0.6)
          : getWidth(context, 0.65),
      color: primaryColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: getWidth(context, 0.02)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "پیشنهادات ویژه",
                    style: TextStyle(
                        fontSize: Responsive.isTablet(context) ? 16.sp : 18.sp,
                        fontFamily: 'bold',
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                  FadeInImage(
                    placeholder: const AssetImage('assets/images/logo.png'),
                    image: const AssetImage(
                        'assets/images/amazing/amazing_box.png'),
                    width: Responsive.isTablet(context)
                        ? getWidth(context, 0.225)
                        : getWidth(context, 0.275),
                    height: Responsive.isTablet(context)
                        ? getWidth(context, 0.225)
                        : getWidth(context, 0.275),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: homeModel.amazing?.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding:
              EdgeInsets.symmetric(horizontal: getWidth(context, 0.02)),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final helper = homeModel.amazing![index];
                return AmazingItems(
                  theme: theme,
                  helper: helper,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class AmazingItems extends StatelessWidget {
  const AmazingItems({super.key, required this.theme, required this.helper});
  final ThemeData theme;
  final Amazing helper;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getWidth(context, 0.02)),
      padding: EdgeInsets.symmetric(horizontal: getWidth(context, 0.02)),
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: getBorderRadiusFunc(10)),
      width: getWidth(context, 0.375),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: getBorderRadiusFunc(7.5),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/images/logo.png'),
                    image: NetworkImage(helper.image!),
                    width: getWidth(context, 0.275),
                    height: getWidth(context, 0.275),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                helper.title!,
                style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: Responsive.isTablet(context) ? 14.sp : 16.sp,
                ),
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth(context, 0.03),
                        vertical: getWidth(context, 0.01)),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: getBorderRadiusFunc(50)),
                    child: Text(
                      '%${helper.percent!}',
                      style: TextStyle(
                          fontFamily: 'bold',
                          fontWeight: FontWeight.bold,
                          color: theme.scaffoldBackgroundColor,
                          fontSize:
                          Responsive.isTablet(context) ? 12.sp : 13.sp),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getprice(helper.percentPrice.toString()),
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontWeight: FontWeight.bold,
                            fontSize:
                            Responsive.isTablet(context) ? 14.sp : 16.sp),
                      ),
                      Text(
                        getprice(helper.defaultPrice!),
                        style: TextStyle(
                            fontFamily: 'normal',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize:
                            Responsive.isTablet(context) ? 13.sp : 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}