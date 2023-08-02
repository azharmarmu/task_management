import 'package:flutter/material.dart';
import 'package:task_management/utilities/app_color.dart';
import 'package:task_management/utilities/app_size.dart';

import '../../models/storage_files.dart';
import 'chart_widget.dart';
import 'storage_tile.dart';

class StorageWidget extends StatelessWidget {
  const StorageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppSize.defaultSize,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(AppSize.defaultSize / 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Storage Details',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSize.defaultSize * 1.5),
          const ChartWidget(),
          const SizedBox(height: AppSize.defaultSize * 1.5),
          ...storageFileList
              .map(
                (StorageModel sf) => StorageTile(storageModel: sf),
              )
              .toList(),
        ],
      ),
    );
  }
}
