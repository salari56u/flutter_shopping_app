import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const/responsive.dart';
import '../../public_features/widget/search_bar_widget.dart';

class SliverSearchBar extends StatelessWidget {
  const SliverSearchBar({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      forceElevated: true,
      toolbarHeight: Responsive.isTablet(context) ? 85 : 65,
      pinned: true,
      flexibleSpace: SearchBarWidget(),
    );
  }
}