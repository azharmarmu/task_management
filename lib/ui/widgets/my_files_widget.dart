import 'package:flutter/material.dart';
import 'package:task_management/utilities/app_size.dart';

import 'card_files.dart';
import 'files_header.dart';

class MyFilesWidget extends StatelessWidget {
  const MyFilesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FilesHeader(),
        SizedBox(height: AppSize.defaultSize),
        SizedBox(
          height: 400,
          child: CardFiles(),
        )
      ],
    );
  }
}
