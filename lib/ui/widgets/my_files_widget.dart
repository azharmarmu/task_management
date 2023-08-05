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
        Responsive(
          mobile: const CardFiles(
            crossAxisCount: 2,
            mainAxisSpacing: AppSize.defaultSize / 2,
          ),
          desktop: const CardFiles(
            crossAxisCount: 4,
          ),
          tablet: CardFiles(
            crossAxisCount: MediaQuery.of(context).size.width > 720 ? 4 : 2,
            mainAxisSpacing: AppSize.defaultSize / 2,
          ),
        ),
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
