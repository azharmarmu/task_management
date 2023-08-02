import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/app_assets.dart';
import '../../utilities/app_size.dart';

class CardFiles extends StatelessWidget {
  const CardFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 4,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (_, int index) => const _FileCard(),
    );
  }
}

class _FileCard extends StatelessWidget {
  const _FileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultSize),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.defaultSize,
          vertical: AppSize.defaultSize / 2,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSize.defaultSize * 0.75),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      AppSize.defaultSize * 0.70,
                    ),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.docMenu,
                  ),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: AppSize.defaultSize),
            Text(
              'Documents',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSize.defaultSize),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: double.infinity,
                  height: AppSize.defaultSize / 4,
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(
                      AppSize.defaultSize,
                    ),
                  ),
                ),
                Container(
                  width: 19,
                  height: AppSize.defaultSize / 4,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      AppSize.defaultSize,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.defaultSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1328 Files',
                    style: Theme.of(context).textTheme.bodySmall),
                Text(
                  '1.9GB',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
