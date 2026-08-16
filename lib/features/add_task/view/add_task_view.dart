import 'package:flutter/material.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/providers/tasks_provider.dart';
import 'package:mo5y/features/add_task/widgets/choose_date.dart';
import 'package:mo5y/features/add_task/widgets/choose_project.dart';
import 'package:mo5y/features/add_task/widgets/text_fields_list.dart';
import 'package:mo5y/features/shared/add_button/add_button.dart';
import 'package:mo5y/features/shared/custom_snack_bar/custom_snack_bar.dart';
import 'package:mo5y/features/shared/top_bar/app_bar.dart';
import 'package:provider/provider.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  ProjectModel? _project;
  DateTime? _date;

  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      TextFieldsList(
                        controllers: [titleController, desController],
                      ),
                      SizedBox(height: 8),
                      ChooseProject(
                        project: _project,
                        onTap: (theProject) => _project = theProject,
                      ),
                      SizedBox(height: 8),
                      ChooseDate(
                        date: _date,
                        onTap: (newDate) {
                          setState(() {
                            _date = newDate;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              AddButton(
                onTap: () async {
                  if (await context.read<TasksProvider>().addTask(
                    title: titleController.text,
                    description: desController.text,
                    endDate: _date ?? DateTime.now().add(Duration(days: 1)),
                    project: _project,
                    context: context
                  )) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        customSnackBar(
                          // ignore: use_build_context_synchronously
                          context: context,
                          title: 'Task added successfully',
                          action: null,
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
