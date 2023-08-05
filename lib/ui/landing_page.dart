import 'package:flutter/material.dart';
import 'package:task_management/responsive.dart';

import 'widgets/drawer_widget.dart';
import 'widgets/main_widget.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: DrawerWidget(),
              ),
            Expanded(
              flex: 5,
              child: MainWidget(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
