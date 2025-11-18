import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/const/theme/colors.dart';
import 'package:pro/features/home_features/logic/bloc/home_bloc.dart';
import 'package:pro/features/home_features/model/home_model.dart';
import '../../public_features/widget/error_screen.dart';
import '../widget/amazing_widget.dart';
import '../widget/brands_widget.dart';
import '../widget/carousel_widget.dart';
import '../widget/category_brand.dart';
import '../widget/product_list.dart';
import '../widget/shimmer_loading.dart';
import '../widget/sliver_search_bar.dart';
import '../widget/top_banner.dart';
import '../widget/two_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screenId = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeBloc>(context).add(CallHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      color: primaryColor,
      onRefresh: () async {
        BlocProvider.of<HomeBloc>(context).add(CallHomeEvent());
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const ShimmerLoading();
          }
          if (state is HomeCompletedState) {
            HomeModel homeModel = state.homeModel;

            return CompletedBody(theme: theme, homeModel: homeModel);
          }
          if (state is HomeErrorState) {
            return ErrorScreenWidget(
              errorMsg: state.error.errorMsg.toString(),
              function: () {
                BlocProvider.of<HomeBloc>(context).add(CallHomeEvent());
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}

class CompletedBody extends StatelessWidget {
  const CompletedBody({
    super.key,
    required this.theme,
    required this.homeModel,
  });

  final ThemeData theme;
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    print(homeModel.colOneId);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FadeIn(
        child: CustomScrollView(
          slivers: [
            SliverSearchBar(theme: theme),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.sp),
                      carouselWidget(homeModel: homeModel),
                      SizedBox(height: 10.sp),
                      BrandsWidget(homeModel: homeModel, theme: theme),
                      SizedBox(height: 15.sp),
                      AmazingWidget(homeModel: homeModel, theme: theme),
                      SizedBox(height: 16.sp),
                      homeModel.random == null
                          ? const SizedBox.shrink()
                          : ProductListWidget(
                          list: homeModel.random!, title: 'محصولات پر فروش'),
                      SizedBox(height: 16.sp),
                      CategoryBrandWidget(homeModel: homeModel),
                      SizedBox(height: 15.sp),
                      homeModel.colone == null
                          ? const SizedBox.shrink()
                          : ProductListWidget(
                        list: homeModel.colone!,
                        title: homeModel.colOneName.toString(),
                      ),
                      SizedBox(height: 10.sp),
                      TwoBannersWidget(homeModel: homeModel),
                      SizedBox(height: 15.sp),
                      homeModel.coltwo == null
                          ? const SizedBox.shrink()
                          : ProductListWidget(
                        list: homeModel.coltwo!,
                        title: homeModel.colTwoName.toString(),
                      ),
                      TopBannerWidget(homeModel: homeModel),
                      SizedBox(height: 10.sp),
                      homeModel.colthree == null
                          ? const SizedBox.shrink()
                          : ProductListWidget(
                        list: homeModel.colthree!,
                        title: homeModel.colThreeName.toString(),
                      ),
                      homeModel.colfour == null
                          ? const SizedBox.shrink()
                          : ProductListWidget(
                        list: homeModel.colfour!,
                        title: homeModel.colFourName.toString(),
                      ),
                      homeModel.colfive == null
                          ? const SizedBox.shrink()
                          : ProductListWidget(
                        list: homeModel.colfive!,
                        title: homeModel.colFiveName.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Column(
// children: [
// SizedBox(
// height: 8.sp,
// ),
// carouselWidget(homeModel: homeModel),
// SizedBox(
// height: 10.sp,
// ),
// BrandsWidget(homeModel: homeModel, theme: theme),
// SizedBox(
// height: 16.sp,
// ),
// AmazingWidget(homeModel: homeModel, theme: theme),
// SizedBox(
// height: 16.sp,
// ),
// ProductListWidget(
// list: homeModel.random!,
// title: 'محصولات پر فروش',
// ),
// SizedBox(
// height: 16.sp,
// ),
// CategoryBrandWidget(homeModel: homeModel),
// ProductListWidget(
// list: homeModel.colone!,
// title: homeModel.colOneName.toString(),
// ),
// SizedBox(
// height: 16.sp,
// ),
// TwoBannersWidget(homeModel: homeModel),
// ProductListWidget(
// list: homeModel.coltwo!,
// title: homeModel.colTwoName.toString()),
// Padding(
// padding: EdgeInsets.all(10.sp),
// child: ClipRRect(
// borderRadius: getBorderRadiusFunc(10),
// child: FadeInImage(
// placeholder:
// AssetImage('assets/images/logo.png'),
// image:
// NetworkImage(homeModel.topBanner!.image!),
// width: getAllWidth(context),
// height: getWidth(context, 0.15),
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(
// height: 16.sp,
// ),
// ProductListWidget(
// list: homeModel.colthree!,
// title: homeModel.colThreeName.toString()),
// ProductListWidget(
// list: homeModel.colfour!,
// title: homeModel.colFourName.toString()),
// ProductListWidget(
// list: homeModel.colfive!,
// title: homeModel.colFiveName.toString()),
// ],
// );










