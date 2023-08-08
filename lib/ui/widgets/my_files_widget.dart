import 'package:flutter/material.dart';
import 'package:task_management/utilities/app_network.dart';
import 'package:task_management/utilities/app_size.dart';

import '../../models/recent_files.dart';
import '../../responsive.dart';
import 'card_files.dart';
import 'files_header.dart';
import 'recent_files.dart';
import 'storage_widget.dart';

class MyFilesWidget extends StatefulWidget {
  const MyFilesWidget({
    super.key,
  });

  @override
  State<MyFilesWidget> createState() => _MyFilesWidgetState();
}

class _MyFilesWidgetState extends State<MyFilesWidget> {
  final List<FileModel> files = [];

  @override
  void initState() {
    super.initState();
    loadFiles();
  }

  Future<void> loadFiles() async {
    Map<String, dynamic> result = await AppNetwork().get(AppNetwork.taskList);

    for (var res in result.entries) {
      files.add(FileModel(
        id: res.key,
        name: res.value['name'],
        date: res.value['date'],
        size: double.parse('${res.value['size']}'),
      ));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilesHeader(
          onTap: (FileModel file) {
            files.add(file);
            setState(() {});
          },
        ),
        const SizedBox(height: AppSize.defaultSize),
        Responsive(
          mobile: const CardFiles(
            crossAxisCount: 2,
            mainAxisSpacing: AppSize.defaultSize / 2,
          ),
          desktop: const CardFiles(
            crossAxisCount: 4,
            childAspectRatio: 1,
          ),
          tablet: CardFiles(
            crossAxisCount: MediaQuery.of(context).size.width > 720 ? 4 : 2,
            childAspectRatio:
                MediaQuery.of(context).size.width > 720 ? 0.75 : 0.7,
            mainAxisSpacing: AppSize.defaultSize / 2,
          ),
        ),
        const SizedBox(height: AppSize.defaultSize),
        RecentFiles(files: files),
        if (Responsive.isMobile(context)) ...[
          const SizedBox(height: AppSize.defaultSize),
          const StorageWidget(),
        ],
      ],
    );
  }
}
