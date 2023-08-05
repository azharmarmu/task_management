import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/utilities/app_color.dart';

import '../../models/cloud_storage_info.dart';
import '../../responsive.dart';
import '../../utilities/app_assets.dart';
import '../../utilities/app_size.dart';
import 'my_progress_indicator.dart';

class CardFiles extends StatelessWidget {
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  const CardFiles({
    super.key,
    required this.crossAxisCount,
    this.crossAxisSpacing = AppSize.defaultSize / 2,
    this.mainAxisSpacing = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemBuilder: (_, int index) => _FileCard(
        demoMyFiles[index],
      ),
    );
  }
}

class _FileCard extends StatelessWidget {
  final CloudStorageInfo myFile;
  const _FileCard(this.myFile);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.defaultSize),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(
          AppSize.defaultSize,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSize.defaultSize * 0.75),
                decoration: BoxDecoration(
                  color: myFile.color.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(
                    AppSize.defaultSize * 0.70,
                  ),
                ),
                child: SvgPicture.asset(
                  AppAssets.docMenu,
                  color: myFile.color,
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: AppSize.defaultSize),
          Text(
            myFile.title,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.clip,
          ),
          const SizedBox(height: AppSize.defaultSize),
          MyProgressIndicator(color: myFile.color),
          const SizedBox(height: AppSize.defaultSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${myFile.numOfFiles} Files',
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${myFile.totalStorage}GB',
                style: Theme.of(context).textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
