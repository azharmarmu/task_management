import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/ui/widgets/profile_widget.dart';
import 'package:task_management/ui/widgets/search_widget.dart';
import 'package:task_management/utilities/app_assets.dart';
import 'package:task_management/utilities/app_color.dart';
import 'package:task_management/utilities/app_size.dart';

import '../utilities/app_strings.dart';
import 'widgets/drawer_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: DrawerWidget(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.defaultSize,
                  vertical: AppSize.defaultSize,
                ),
                child: Column(
                  children: [
                    SafeArea(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
