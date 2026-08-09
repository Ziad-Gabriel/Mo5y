import 'package:isar/isar.dart';
import 'package:mo5y/core/models/project_model.dart';
part 'note_model.g.dart';

@collection
class NoteModel {
  Id id = Isar.autoIncrement;
  String? title;
  String? description;
  List<String>? images;
  final project = IsarLink<ProjectModel>();
}
