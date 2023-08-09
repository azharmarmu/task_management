import 'package:flutter/material.dart';
import 'package:task_management/models/recent_files.dart';
import 'package:task_management/ui/widgets/app_button.dart';

import 'popup.dart';

class FilesHeader extends StatelessWidget {
  final Function(FileModel) addFiles;

  const FilesHeader({
    required this.addFiles,
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
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (BuildContext context) => const PopupBox(),
            );

            if (result != null) {
              addFiles(
                FileModel(
                  id: result['id'],
                  name: result['name'],
                  date: result['date'],
                  size: double.parse('${result['size']}'),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
