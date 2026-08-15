import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/tasks_stats_model.dart';
import 'package:mo5y/core/services/stats_service.dart';

class TasksStatsProvider extends ChangeNotifier {
  final Isar isar;
  TasksStatsProvider(this.isar);

  List<TasksStatsModel> statsList = [];

  TasksStatsModel? currentWeek;

  List<TasksStatsModel> get getAllStats => statsList;
  TasksStatsModel get getCurrentWeek => currentWeek ?? (TasksStatsModel()
    ..tasksAdded = 0
    ..tasksCompleted = 0);

  StreamSubscription<List<TasksStatsModel>>? _subscription;

  void listenToStats() {
    _subscription?.cancel();
    notifyListeners();

    _subscription = StatsService(isar).watchAllStats().listen((stats) {
      statsList = stats;
      if(statsList.isNotEmpty){
      currentWeek = stats.first;
      }
      notifyListeners();
    });
  }
}
