import 'package:isar/isar.dart';
import 'package:mo5y/core/models/profile_model.dart';
import 'package:mo5y/core/models/project_model.dart';

class ProjectService {
  final Isar isar;

  ProjectService(this.isar);

  Future<void> addProject({
    required ProjectModel project,
    required ProfileModel profile,
  }) async {
    await isar.writeTxn(() async {
      await isar.projectModels.put(project);
      await project.profile.save();
    });
  }

  Future<void> updateProject({required ProjectModel project}) {
    return isar.writeTxn(() => isar.projectModels.put(project));
  }

  Future<void> deleteProject({required int id}) async {
    await isar.writeTxn(() => isar.projectModels.delete(id));
  }

  Stream<List<ProjectModel>> getAllProjects({required int profileId}) {
    return isar.projectModels
        .filter()
        .profile((q) => q.idEqualTo(profileId))
        .watch(fireImmediately: true);
  }
}
