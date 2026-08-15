import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/controllers/project_controller.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/services/project_service.dart';

class ProjectsProvider extends ChangeNotifier{
  final Isar isar;
  ProjectsProvider(this.isar);

  List<ProjectModel> _projects=[];
  bool _isLoading = true;

  List<ProjectModel> get getProjects=>_projects;
  bool get isLoading=>_isLoading;

  StreamSubscription<List<ProjectModel>>? _subscription;

  void listenToProjects() {
    _subscription?.cancel();
    _isLoading = true;
    notifyListeners();

    _subscription = ProjectService(isar).getAllProjects().listen((updatedProjects) {
      _projects = updatedProjects;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<bool> addProject({required String? title,required String? description,required String? image})async{
    return await ProjectController(isar).addProject(title: title, description: description, image: image);
  }

  Future<bool> updateProject({required int id,required String? title,required String? description,required String? image})async{
    return await ProjectController(isar).updateProject(id: id,title: title, description: description, image: image);
  }

  Future<void> deleteProject({required int id})async{
    return await ProjectService(isar).deleteProject(id: id);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}