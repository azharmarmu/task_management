import 'package:flutter/material.dart';

import '../../utilities/app_size.dart';
import '../../utilities/app_strings.dart';
import 'profile_widget.dart';
import 'search_widget.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Text(
            AppStrings.dashboard,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          const SizedBox(
            width: AppSize.defaultSize * 20,
            child: Searchwidget(),
          ),
          const SizedBox(width: AppSize.defaultSize),
          const ProfileWidget(),
        ],
      ),
    );
  }
}
