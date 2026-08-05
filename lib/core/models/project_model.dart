import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/profile_model.dart';
import 'package:mo5y/core/models/task_model.dart';
part 'project_model.g.dart';

@collection
class ProjectModel {
  
  Id id = Isar.autoIncrement;
  
  late  String title;
  String? description;
  String? image;
  
  final profile = IsarLink<ProfileModel>();

  @Backlink(to: 'project')
  final notes = IsarLinks<NoteModel>();

  @Backlink(to: 'project')
  final tasks = IsarLinks<TaskModel>();
}
