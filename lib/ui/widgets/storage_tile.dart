import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/storage_files.dart';
import '../../utilities/app_color.dart';
import '../../utilities/app_size.dart';

class StorageTile extends StatelessWidget {
  final StorageModel storageModel;

  const StorageTile({
    super.key,
    required this.storageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.defaultSize),
      margin: const EdgeInsets.only(
        bottom: AppSize.defaultSize * 0.75,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.defaultSize),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: AppSize.defaultIconSize,
            height: AppSize.defaultIconSize,
            child: SvgPicture.asset(
              storageModel.icon,
              width: AppSize.defaultIconSize / 1.25,
              height: AppSize.defaultIconSize / 1.25,
            ),
          ),
          const SizedBox(width: AppSize.defaultSize),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storageModel.label,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: AppSize.defaultSize / 4),
                Text(
                  '${storageModel.fileNo} Files',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '${storageModel.fileSize}GB',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
