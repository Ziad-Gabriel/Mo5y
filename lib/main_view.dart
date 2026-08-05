import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/main_widgets_index_provider.dart';
import 'package:mo5y/features/home/view/home_view.dart';
import 'package:mo5y/features/notes/view/note_view.dart';
import 'package:mo5y/features/projects/view/projects_view.dart';
import 'package:mo5y/features/shared/nav_bar/nav_container.dart';
import 'package:mo5y/features/shared/top_bar/app_bar.dart';
import 'package:mo5y/features/tasks/view/tasks_view.dart';
import 'package:mo5y/features/timer/view/timer_view.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeView(),
      ProjectsView(),
      TasksView(),
      NoteView(),
      TimerView(),
    ];
    final int currentIndex = context
        .watch<MainWidgetsIndexProvider>()
        .getCurrentIndex;
    return Scaffold(
      appBar: mainAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: screens[currentIndex],
        ),
      ),
      bottomNavigationBar: NavContainer(),
    );
  }
}
