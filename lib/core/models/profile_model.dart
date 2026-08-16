import 'package:isar/isar.dart';

part 'profile_model.g.dart';

@collection
class ProfileModel {
  Id id = Isar.autoIncrement;

  late String username;
  late bool isLoggedIn;
  DateTime? lastCleanUp;
  double balance = 0;
  int tasksAdded = 0;
  int tasksCompleted = 0;
}
