import 'package:flutter/material.dart';
import 'package:task_management/responsive.dart';

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
        const Expanded(
          flex: 5,
          child: MyFilesWidget(),
        ),
        if (!Responsive.isMobile(context))
          const SizedBox(width: AppSize.defaultSize),
        if (!Responsive.isMobile(context))
          const Expanded(
            flex: 2,
            child: StorageWidget(),
          )
      ],
    );
  }
}
