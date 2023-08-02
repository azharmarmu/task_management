import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/utilities/app_assets.dart';
import 'package:task_management/utilities/app_color.dart';
import 'package:task_management/utilities/app_size.dart';

import 'app_button.dart';
import 'card_files.dart';
import 'files_header.dart';

class MyFilesWidget extends StatelessWidget {
  const MyFilesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilesHeader(),
        SizedBox(height: AppSize.defaultSize),
        SizedBox(
          height: 400,
          child: CardFiles(),
        )
      ],
    );
  }
}
