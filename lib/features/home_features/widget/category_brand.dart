import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../const/shape/border_raduis.dart';
import '../../../const/shape/media_query.dart';
import '../model/home_model.dart';

class CategoryBrandWidget extends StatelessWidget {
  const CategoryBrandWidget({
    super.key,
    required this.homeModel,
  });

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return homeModel.categorybanner==null?const SizedBox.shrink(): Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: homeModel.categorybanner!.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.75,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              final url = homeModel.categorybanner![index].link;
              if (await canLaunchUrlString(url!)) {
                await launchUrlString(url);
              }
            },
            child: ClipRRect(
              borderRadius: getBorderRadiusFunc(13),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/logo.png'),
                image: NetworkImage(homeModel.categorybanner![index].image!),
                height: getWidth(context, 0.32),
                width: getAllWidth(context),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}