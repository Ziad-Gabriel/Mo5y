import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/task_model.dart';
part 'project_model.g.dart';

@collection
class ProjectModel {
  
  Id id = Isar.autoIncrement;
  
  late String title;
  late String description;
  String? image;
  

  @Backlink(to: 'project')
  final notes = IsarLinks<NoteModel>();

  @Backlink(to: 'project')
  final tasks = IsarLinks<TaskModel>();
}
