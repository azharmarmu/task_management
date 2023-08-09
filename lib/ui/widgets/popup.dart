import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_management/utilities/app_network.dart';

import '../../utilities/app_size.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

//import 'package:scroll_date_picker/scroll_date_picker.dart';

class PopupBox extends StatefulWidget {
  const PopupBox({super.key});

  @override
  State<PopupBox> createState() => _PopupBoxState();
}

class _PopupBoxState extends State<PopupBox> {
  final nameCtrl = TextEditingController();
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMd();
    return AlertDialog(
      title: const Text('Add Field'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameCtrl,
            decoration: const InputDecoration(
              label: Text('File Name'),
            ),
          ),
          const SizedBox(height: AppSize.defaultSize / 2),
          Row(
            children: [
              Text('Date: ${format.format(selectedDate!)}'),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2024),
                  );
                  setState(() {});
                },
                icon: const Icon(Icons.calendar_month),
              )
            ],
          ),
          const SizedBox(height: AppSize.defaultSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () async {
                  final name = nameCtrl.text;
                  try {
                    Map<String, dynamic> body = {
                      'name': name,
                      'date': format.format(selectedDate!),
                      'size': '35',
                    };

                    var result = await AppNetwork().post(
                      AppNetwork.taskList,
                      body: body,
                    );
                    if (result != null) {
                      body['id'] = result['name'];
                      Navigator.of(context).pop(body);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Could not add the task'),
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  'ADD',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'CANCEL',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
