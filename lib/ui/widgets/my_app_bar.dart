import 'package:flutter/material.dart';
import 'package:task_management/responsive.dart';

import '../../utilities/app_size.dart';
import '../../utilities/app_strings.dart';
import 'profile_widget.dart';
import 'search_widget.dart';

class MyAppBar extends StatelessWidget {
  final Function() onPressed;
  const MyAppBar({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          if (Responsive.isDesktop(context)) ...[
            Text(
              AppStrings.dashboard,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer()
          ],
          const Expanded(
            child: Searchwidget(),
          ),
          const SizedBox(width: AppSize.defaultSize),
          const ProfileWidget(),
        ],
      ),
    );
  }
}
