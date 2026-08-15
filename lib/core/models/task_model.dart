import 'package:isar/isar.dart';
import 'package:mo5y/core/models/project_model.dart';

part 'task_model.g.dart';

@Collection()
class TaskModel {
  
  Id id = Isar.autoIncrement;
  
  late String title;
  String? description;
  late DateTime endDate;
  DateTime? completedAt;
  bool isCompleted=false;
  final project = IsarLink<ProjectModel>();

}
