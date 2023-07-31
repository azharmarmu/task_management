import 'package:flutter/material.dart';

import '../../utilities/app_assets.dart';
import '../../utilities/app_color.dart';
import '../../utilities/app_size.dart';
import '../../utilities/app_strings.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.defaultSize / 2,
        horizontal: AppSize.defaultSize,
      ),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppSize.defaultSize / 2),
          border: Border.all(
            color: Colors.white54,
            width: 0.25,
          ),
          color: AppColors.secondaryColor),
      child: Row(
        children: [
          Image.asset(AppAssets.profilePic),
          const SizedBox(width: AppSize.defaultSize / 4),
          Text(
            AppStrings.profileName,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(width: AppSize.defaultSize / 4),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
