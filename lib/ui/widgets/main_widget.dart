import 'package:flutter/material.dart';

import '../../utilities/app_size.dart';
import 'body_section.dart';
import 'my_app_bar.dart';

class MainWidget extends StatelessWidget {
  final Function() onPressed;
  const MainWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.defaultSize,
        vertical: AppSize.defaultSize,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              onPressed: onPressed,
            ),
            const SizedBox(height: AppSize.defaultSize),
            const BodySection(),
          ],
        ),
      ),
    );
  }
}
