import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/recent_files.dart';
import '../../utilities/app_color.dart';
import '../../utilities/app_size.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({super.key});

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
            'Recent Files',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSize.defaultSize),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    'File Name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                DataColumn(
                  label: Text('Date',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                DataColumn(
                  label: Text('Size',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
              rows: files
                  .map(
                    (FileModel fm) => DataRow(
                      cells: [
                        DataCell(
                          Row(
                            children: [
                              SizedBox(
                                height: AppSize.defaultIconSize,
                                width: AppSize.defaultIconSize,
                                child: SvgPicture.asset(
                                  fm.icon,
                                  height: AppSize.defaultIconSize,
                                  width: AppSize.defaultIconSize,
                                ),
                              ),
                              SizedBox(width: AppSize.defaultSize),
                              Text(
                                fm.label,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(fm.date,
                            style: Theme.of(context).textTheme.labelMedium)),
                        DataCell(Text('${fm.size}',
                            style: Theme.of(context).textTheme.labelMedium)),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
