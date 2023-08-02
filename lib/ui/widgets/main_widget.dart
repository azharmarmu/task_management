import 'package:flutter/material.dart';

import '../../utilities/app_size.dart';
import 'body_section.dart';
import 'my_app_bar.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.defaultSize,
        vertical: AppSize.defaultSize,
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(),
            SizedBox(height: AppSize.defaultSize),
            BodySection(),
          ],
        ),
      ),
    );
  }
}
