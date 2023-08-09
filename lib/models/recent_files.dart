import '../utilities/app_assets.dart';

class FileModel {
  final id;
  String name, date;
  double size;

  FileModel({
    required this.id,
    required this.name,
    required this.date,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'size': size,
    };
  }
}
