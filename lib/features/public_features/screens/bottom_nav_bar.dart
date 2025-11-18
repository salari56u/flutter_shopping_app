import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro/const/theme/colors.dart';
import 'package:pro/features/authication_features/screen/auth_screen.dart';
import 'package:pro/features/cart_features/screen/check_cart.dart';
import 'package:pro/features/category_features/screen/category_screen.dart';
import 'package:pro/features/home_features/screen/home_screen.dart';
import 'package:pro/features/public_features/logic/token_check/token_check_cubit.dart';

import '../logic/bottomnav_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const String screenId='/bottomnav';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {



  List<Widget> screenItem = [
    HomeScreen(),
    CategoryScreen(),
    CheckCart(),
    Container(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TokenCheckCubit>(context).checkToken();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomnavcubit=BlocProvider.of<BottomnavCubit>(context);
    return BlocBuilder<BottomnavCubit, int>(
  builder: (context, state) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: theme.iconTheme.color,
            selectedLabelStyle: TextStyle(fontFamily: 'bold'),
            unselectedLabelStyle: TextStyle(fontFamily: 'bold'),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'صفحه ی اصلی ', activeIcon: Icon(Icons.home)),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'دسته ها', activeIcon: Icon(Icons.category)),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'سبد خرید', activeIcon: Icon(Icons.shopping_cart)),
              BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'پروفایل', activeIcon: Icon(Icons.settings)),
            ],
            currentIndex: bottomnavcubit.screenIndex,
            onTap: (value) {
              bottomnavcubit.onTab(value);
            },
          ),
          body: screenItem.elementAt(bottomnavcubit.screenIndex),
        ),
      ),
    );
  },
);
  }
}
