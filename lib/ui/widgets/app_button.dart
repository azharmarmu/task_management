import 'package:flutter/material.dart';

import '../../utilities/app_color.dart';
import '../../utilities/app_size.dart';

class AppButton extends StatelessWidget {
  final double width;
  final Function() onPressed;
  final Color color;
  final String label;
  IconData? icon;

  AppButton({
    super.key,
    this.width = AppSize.buttonWidth,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    required this.label,
  }) {
    this.icon = null;
  }

  AppButton.icon({
    super.key,
    this.width = AppSize.buttonWidth,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.buttonHeight,
      width: width,
      child: icon != null
          ? TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
              ),
              onPressed: onPressed,
              label: _Text(label),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : TextButton(
              onPressed: onPressed,
              child: _Text(label),
            ),
    );
  }
}

class _Text extends StatelessWidget {
  final String label;
  const _Text(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
