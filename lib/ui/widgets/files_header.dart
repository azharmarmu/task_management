import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/app_button.dart';

class FilesHeader extends StatelessWidget {
  const FilesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('My Files', style: Theme.of(context).textTheme.bodyMedium),
        AppButton.icon(
          icon: Icons.add,
          label: 'Add New',
          onPressed: () {},
        )
      ],
    );
  }
}