import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/const/shape/border_raduis.dart';
import 'package:pro/const/shape/media_query.dart';
import 'package:pro/features/category_features/logic/category_bloc.dart';
import 'package:pro/features/category_features/model/category_model.dart';
import 'package:pro/features/category_features/services/category_repository.dart';
import 'package:pro/features/home_features/widget/sliver_search_bar.dart';
import 'package:pro/features/public_features/widget/error_screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const String screenId = '/category_screen';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) =>
          CategoryBloc(CategoryRepository())..add(CallCategory()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const CategoryLoading();
          }
          if (state is CategoryCompletedState) {
            CategoryModel categoryModel = state.categoryModel;
            return CustomScrollView(
              slivers: [
                SliverSearchBar(theme: theme),
                SliverList(
                    delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                    width: getAllWidth(context),
                    height: getAllHeight(context)-kBottomNavigationBarHeight*MediaQuery.of(context).devicePixelRatio,
                    child: ListView.builder(
                      itemCount: categoryModel.category!.length,
                      itemBuilder: (context, Categoryindex) {
                        final categoryhelper =
                            categoryModel.category![Categoryindex];
                        return CategoryItems(categoryhelper: categoryhelper);
                      },
                    ),
                  )
                ]))
              ],
            );
          }
          if (state is AllCategoryErrorState)
          {
            return ErrorScreenWidget(errorMsg: state.error.errorMsg!, function: ()
            {
              BlocProvider.of<CategoryBloc>(context).add(CallCategory());
            });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.categoryhelper,
  });

  final Catgory categoryhelper;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 5.sp),
          child: Text(categoryhelper.title!,style: TextStyle
            (
            fontFamily: 'bold',
            fontSize: 18.sp
          ),),
        ),
        SizedBox(
          width: getAllWidth(context),
          height: getWidth(context, 0.45),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryhelper.subcategory!.length,
            itemBuilder: (context, subcategoryindex) {
              final subcategoryhepler = categoryhelper
                  .subcategory![subcategoryindex];
              return SubCategoryItems(subcategoryhepler: subcategoryhepler);
            },
          ),
        )
      ],
    );
  }
}

class SubCategoryItems extends StatelessWidget {
  const SubCategoryItems({
    super.key,
    required this.subcategoryhepler,
  });

  final SubCategory subcategoryhepler;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context, 0.3),
      height: getWidth(context, 0.375),
      margin: EdgeInsets.all(5.sp),
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration
        (
        color: Colors.grey.shade300,
        borderRadius: getBorderRadiusFunc(10.sp)
      ),
      child: Column(
        children: [
          subcategoryhepler.image == null
              ? Image.asset(
                  'assets/images/logo.png',
                  width: getWidth(context, 0.25),
                  height: getWidth(context, 0.325),
                )
              : ClipRRect(
            borderRadius: getBorderRadiusFunc(10.sp),
                child: FadeInImage(
                    placeholder: AssetImage(
                        'assets/images/logo.png'),
                    image: NetworkImage(
                        subcategoryhepler.image!),
                    width: getWidth(context, 0.25),
                    height: getWidth(context, 0.325),
                    imageErrorBuilder:
                        (context, error, stackTrace) {
                      return SizedBox(
                        width: getWidth(context, 0.25),
                        height: getWidth(context, 0.3),
                      );
                    },
                  ),
              ),
          Text(subcategoryhepler.title!,style: const TextStyle
            (
            fontSize: 16,
            fontFamily: 'bold'
          ),)
        ],
      ),
    );
  }
}

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 15.sp,
          children: const [
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
            ShimmerContainer(),
          ],
        ),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.sp),
      width: getWidth(context, 0.28),
      height: getWidth(context, 0.4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: getBorderRadiusFunc(10)),
    );
  }
}
