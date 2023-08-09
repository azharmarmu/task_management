import 'package:flutter/material.dart';

import '../../models/recent_files.dart';
import '../../utilities/app_color.dart';
import '../../utilities/app_size.dart';

import '../../utilities/app_network.dart';

class RecentFiles extends StatelessWidget {
  final List<FileModel> files;
  final Function(FileModel) deleteFile;
  final Function(FileModel) updateFile;
  const RecentFiles({
    super.key,
    required this.files,
    required this.deleteFile,
    required this.updateFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          files.isEmpty
              ? const Center(child: CircularProgressIndicator.adaptive())
              : SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'File Name',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Date',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Size',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                    rows: files
                        .map(
                          (FileModel fm) => DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    // SizedBox(
                                    //   height: AppSize.defaultIconSize,
                                    //   width: AppSize.defaultIconSize,
                                    //   child: SvgPicture.asset(
                                    //     fm.icon,
                                    //     height: AppSize.defaultIconSize,
                                    //     width: AppSize.defaultIconSize,
                                    //   ),
                                    // ),
                                    // SizedBox(width: AppSize.defaultSize),
                                    Expanded(
                                      child: Text(
                                        fm.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(Text(fm.date,
                                  style:
                                      Theme.of(context).textTheme.labelMedium)),
                              DataCell(Text('${fm.size}',
                                  style:
                                      Theme.of(context).textTheme.labelMedium)),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        var res = await AppNetwork().delete(
                                          '${AppNetwork.taskList}/${fm.id}',
                                        );
                                        deleteFile(fm);
                                      },
                                      icon: const Icon(Icons.delete),
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: AppSize.defaultSize * 2),
                                    IconButton(
                                      onPressed: () async {
                                        Map<String, dynamic> fileModel =
                                            fm.toJson();

                                        fileModel['name'] = 'Personal Meeting';

                                        var res = await AppNetwork().update(
                                          '${AppNetwork.taskList}/${fm.id}',
                                          body: fileModel,
                                        );
                                        if (res != null) {
                                          FileModel _fm = FileModel(
                                            id: fileModel['id'],
                                            name: fileModel['name'],
                                            date: fileModel['date'],
                                            size: fileModel['size'],
                                          );
                                          updateFile(_fm);
                                        }
                                      },
                                      icon: const Icon(Icons.edit),
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
