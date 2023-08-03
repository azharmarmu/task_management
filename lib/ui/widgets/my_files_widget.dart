import 'package:flutter/material.dart';
import 'package:task_management/utilities/app_size.dart';

import '../../responsive.dart';
import 'card_files.dart';
import 'files_header.dart';
import 'recent_files.dart';
import 'storage_widget.dart';

class MyFilesWidget extends StatelessWidget {
  const MyFilesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilesHeader(),
        const SizedBox(height: AppSize.defaultSize),
        const CardFiles(),
        const SizedBox(height: AppSize.defaultSize),
        const RecentFiles(),
        if (Responsive.isMobile(context)) ...[
          const SizedBox(height: AppSize.defaultSize),
          const StorageWidget(),
        ],
      ],
    );
  }
}
