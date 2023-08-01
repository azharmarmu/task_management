import 'package:flutter/material.dart';

import '../../utilities/app_size.dart';
import 'my_files_widget.dart';
import 'storage_widget.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: MyFilesWidget(),
        ),
        const SizedBox(width: AppSize.defaultSize),
        Expanded(
          flex: 2,
          child: StorageWidget(),
        )
      ],
    );
  }
}