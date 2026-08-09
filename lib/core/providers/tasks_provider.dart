import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/task_model.dart';
import 'package:mo5y/core/services/task_service.dart';

class TasksProvider extends ChangeNotifier {
  final Isar isar;
  TasksProvider(this.isar);

  List<TaskModel> _pendingTasks = [];
  List<TaskModel> get pending => _pendingTasks;
  List<TaskModel> _completedTasks = [];
  List<TaskModel> get completed => _completedTasks;
  List<TaskModel> _failedTasks = [];
  List<TaskModel> get failed => _failedTasks;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  StreamSubscription<List<TaskModel>>? _subscription;

  void listenToTasks({required int profileId}) {
    _subscription?.cancel();
    _isLoading = true;
    notifyListeners();

    _subscription = TaskService(isar).getAllTasks().listen((updatedTasks) {
      _pendingTasks = updatedTasks
          .where(
            (task) =>
                !task.isCompleted && !task.endDate.isBefore(DateTime.now()),
          )
          .toList();
      _completedTasks = updatedTasks.where((task) => task.isCompleted).toList();
      _failedTasks = updatedTasks
          .where(
            (task) =>
                task.endDate.isBefore(DateTime.now()) && !task.isCompleted,
          )
          .toList();
      _isLoading = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
