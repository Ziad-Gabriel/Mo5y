import 'package:isar/isar.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/services/project_service.dart';

class ProjectController {
  final Isar isar;
  ProjectController(this.isar);

  Future<bool> addProject({required String? title,required String? description,required String? image})async {
    if(title==null||title.trim().isEmpty){
      return false;
    }
    ProjectModel project = ProjectModel()..title=title..description=description??''..image=image;
    await ProjectService(isar).addProject(project: project);
    return true;
  }

  Future<bool> updateProject({required int id,required String? title, required String? description, required String? image})async{
    if(title==null){
      return false;
    }
    ProjectModel project = ProjectModel()..id=id..title=title..description=description??''..image=image;
    await ProjectService(isar).updateProject(project: project);
    return true;
  }

  Future<void> deleteProject({required int id})async{
    await ProjectService(isar).deleteProject(id: id);
  }
}