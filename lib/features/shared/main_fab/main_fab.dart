import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mo5y/features/add_note/view/add_note_view.dart';
import 'package:mo5y/features/add_task/view/add_task_view.dart';
import 'package:mo5y/features/add_transaction/view/add_transaction_view.dart';

class MainFab extends StatelessWidget {
  const MainFab({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      activeBackgroundColor: Theme.of(context).colorScheme.secondary,
      activeForegroundColor: Theme.of(context).colorScheme.onSurface,
      buttonSize: const Size(56, 56),
      childrenButtonSize: const Size(50, 50),
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
          child: Icon(Icons.note_add),
          label: 'Add Note',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNoteView(isNew: true),
              ),
            );
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.task_alt),
          label: 'Add Task',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskView()),
            );
          },
        ),
        // SpeedDialChild(
        //   child: Icon(Icons.folder_open),
        //   label: 'Add Project',
        //   onTap: () {
        //     // Handle add project action
        //   },
        // ),
        SpeedDialChild(
          child: Icon(Icons.credit_card_rounded),
          label: 'Add Transaction',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTransactionView()),
            );
          },
        ),
      ],
    );
  }
}
