import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/ui/widgets/profile_widget.dart';
import 'package:task_management/ui/widgets/search_widget.dart';
import 'package:task_management/utilities/app_assets.dart';
import 'package:task_management/utilities/app_color.dart';
import 'package:task_management/utilities/app_size.dart';

import '../utilities/app_strings.dart';
import 'widgets/drawer_widget.dart';
import 'widgets/main_widget.dart';

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
              child: MainWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

