import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/utilities/app_assets.dart';
import 'package:task_management/utilities/app_strings.dart';

import '../../utilities/app_color.dart';

class DrawerWidget extends StatelessWidget {
  final List<Map<String, dynamic>> _drawerItems = [
    {'label': AppStrings.dashboard, 'icon': AppAssets.dashboardMenu},
    {'label': AppStrings.transaction, 'icon': AppAssets.transMenu},
    {'label': AppStrings.task, 'icon': AppAssets.taskMenu},
    {'label': AppStrings.doc, 'icon': AppAssets.docMenu},
    {'label': AppStrings.store, 'icon': AppAssets.storeMenu},
    {'label': AppStrings.notification, 'icon': AppAssets.notificationMenu},
    {'label': AppStrings.profile, 'icon': AppAssets.profileMenu},
    {'label': AppStrings.settings, 'icon': AppAssets.settingsMenu},
  ];
  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(AppAssets.logo),
            ),
            ..._drawerItems
                .map((Map<String, dynamic> item) => ListTile(
                      leading: SvgPicture.asset(
                        item['icon'],
                        color: AppColors.secondaryIconColor,
                      ),
                      title: Text(
                        item['label'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.secondaryTextColor,
                            ),
                      ),
                    ))
                .toList()
      
            // add list in between a list
            // ...[
            //   ListTile(
            //     leading: SvgPicture.asset(
            //       AppAssets.dashboardMenu,
            //       color: AppColors.secondaryIconColor,
            //     ),
            //     title: Text(
            //       AppStrings.dashboard,
            //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //             color: AppColors.secondaryTextColor,
            //           ),
            //     ),
            //   ),
            // ],
          ],
          //add list at last of list
          // ..addAll([
      
          // ]),
        ),
      ),
    );
  }
}
