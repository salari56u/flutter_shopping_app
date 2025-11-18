import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/features/product_features/screen/product_detail.dart';
import '../../../const/responsive.dart';
import '../../../const/shape/border_raduis.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
    required this.list,
    required this.title,
  });

  final List<dynamic> list;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: Responsive.isTablet(context) ? 14.sp : 16.sp,
                  fontFamily: 'bold'),
              textAlign: TextAlign.right,
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: list!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()
                {
                    Navigator.of(context).pushNamed(ProductDetailScreen.screenId ,
                arguments:
                {
                  'product_id':list![index].id
                });
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ClipRRect(
                    borderRadius: getBorderRadiusFunc(10),
                    child: FadeInImage(
                        placeholder: const AssetImage('assets/images/logo.png'),
                        image: NetworkImage(list![index].image!)),
                  ),
                ),
              );
            },
          ),
          Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "مشاهده ی همه",
                    style: TextStyle(
                        fontSize: Responsive.isTablet(context) ? 14.sp : 16.sp,
                        fontFamily: 'bold'),
                  )))
        ],
      ),
    );
  }
}