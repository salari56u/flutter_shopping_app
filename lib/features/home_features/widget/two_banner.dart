import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/features/home_features/model/home_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../const/shape/border_raduis.dart';
class TwoBannersWidget extends StatelessWidget {
  const TwoBannersWidget({
    super.key,
    required this.homeModel,
  });

  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return homeModel.twobanners==null?const SizedBox.shrink(): ListView.builder(
      itemCount: homeModel.twobanners!.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            final url = homeModel.twobanners![index].link;
            if (await canLaunchUrlString(url!)) {
              launchUrlString(url);
            }
          },
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: ClipRRect(
              borderRadius: getBorderRadiusFunc(10),
              child: FadeInImage(
                  placeholder: AssetImage('assets/images/logo.png'),
                  image: NetworkImage(homeModel.twobanners![index].image!)),
            ),
          ),
        );
      },
    );
  }
}