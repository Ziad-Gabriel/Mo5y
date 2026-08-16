import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/controllers/task_controller.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/models/task_model.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:mo5y/core/services/task_service.dart';
import 'package:provider/provider.dart';

class TasksProvider extends ChangeNotifier {
  final Isar isar;
  TasksProvider(this.isar);

  List<TaskModel> _pendingTasks = [];
  List<TaskModel> get getPending => _pendingTasks;


  bool _isLoading = true;
  bool get isLoading => _isLoading;

  StreamSubscription<List<TaskModel>>? _subscription;

  void listenToTasks() {
    _subscription?.cancel();
    _isLoading = true;
    notifyListeners();

    _subscription = TaskService(isar).getAllTasks().listen((updatedTasks) {
      _pendingTasks =
          updatedTasks
              .where((task) => !task.endDate.isBefore(DateTime.now()))
              .toList()
            ..sort((a, b) => a.endDate.compareTo(b.endDate));
      
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<bool> addTask({
    required String? title,
    required String? description,
    required DateTime endDate,
    required ProjectModel? project,
    required BuildContext context
  }) async {
    return await TaskController(isar).addTask(
      title: title,
      description: description,
      endDate: endDate,
      project: project,
      context: context
    );
  }

  Future<void> completeToggle({required int id,required BuildContext context}) {
    return TaskController(isar).completeToggle(id: id,context: context);
  }

  Future<void> dailyDeleteCompletedTasks(BuildContext context) async {
    final profileProvider = context.read<ProfileProvider>();
    if (profileProvider.profile == null) return;
    DateTime? lastCleanUp = profileProvider.getLastCleanUp;
    if (lastCleanUp == null) {
      lastCleanUp = DateTime.now();
      await profileProvider.setNewCleanUp(newDate: lastCleanUp);
    }
    final today = DateTime.now();

    if ((lastCleanUp.year != today.year) ||
        (lastCleanUp.month != today.month) ||
        (lastCleanUp.day != today.day)) {
      await TaskController(isar).deleteCompletedTasks();
      await profileProvider.setNewCleanUp(newDate: today);
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
