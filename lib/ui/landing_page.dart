import 'package:flutter/material.dart';

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
            const Expanded(
              flex: 5,
              child: MainWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
