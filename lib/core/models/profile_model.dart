import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/models/task_model.dart';
import 'package:mo5y/core/models/transaction_model.dart';

part 'profile_model.g.dart';

@Collection()
class ProfileModel {
  
  Id id = Isar.autoIncrement;
  
  late String username;
  String? image;
  double wallet=0.0;

  @Backlink(to: 'profile')
  final projects = IsarLinks<ProjectModel>();

  @Backlink(to: 'profile')
  final tasks = IsarLinks<TaskModel>();
  
  @Backlink(to: 'profile')
  final notes = IsarLinks<NoteModel>();
  
  @Backlink(to: 'profile')
  final transactions = IsarLinks<TransactionModel>();
}
