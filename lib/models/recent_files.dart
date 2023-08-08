import '../utilities/app_assets.dart';

class FileModel {
  final String name, date, id;
  final double size;

  FileModel({
    required this.id,
    required this.name,
    required this.date,
    required this.size,
  });
}