import 'package:flutter/material.dart';
import 'package:task_management/utilities/app_size.dart';

class MyProgressIndicator extends StatelessWidget {
  final Color color;
  const MyProgressIndicator({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: double.infinity,
          height: AppSize.defaultSize / 4,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(
              AppSize.defaultSize,
            ),
          ),
        ),
        Container(
          width: 19,
          height: AppSize.defaultSize / 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              AppSize.defaultSize,
            ),
          ),
        ),
      ],
    );
  }
}
