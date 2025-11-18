
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../const/shape/border_raduis.dart';
import '../../../const/shape/media_query.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Center(
        child: Column(
          children: [
            Container(
              width: getWidth(context, 0.9),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: getBorderRadiusFunc(5)),
            ),
            SizedBox(
              height: 10.sp,
            ),
            const Wrap(
              children: [
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              width: getWidth(context, 0.9),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: getBorderRadiusFunc(5)),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              width: getWidth(context, 0.9),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: getBorderRadiusFunc(5)),
            ),
            SizedBox(
              height: 10.sp,
            ),
            const Wrap(
              children: [
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
                LittleShimmer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LittleShimmer extends StatelessWidget {
  const LittleShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context, 0.175),
      height: getWidth(context, 0.175),
      margin: EdgeInsets.all(getWidth(context, 0.02)),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: getBorderRadiusFunc(5)),
    );
  }
}