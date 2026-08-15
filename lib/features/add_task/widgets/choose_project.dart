import 'package:flutter/material.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/providers/projects_provider.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';
import 'package:provider/provider.dart';

class ChooseProject extends StatefulWidget {
  final ProjectModel? project;
  final Function(ProjectModel?) onTap;
  const ChooseProject({super.key, required this.onTap, this.project});

  @override
  State<ChooseProject> createState() => _ChooseProjectState();
}

class _ChooseProjectState extends State<ChooseProject> {
  bool _isOpen = false;
  bool _showList = false;
  @override
  Widget build(BuildContext context) {
    final projects = context.watch<ProjectsProvider>().getProjects;
    Future<void> showListToggle() async {
      if (_isOpen) {
        await Future.delayed(const Duration(milliseconds: 50));
        setState(() {
          _showList = _isOpen;
        });
        return;
      }
      setState(() {
        _showList = _isOpen;
      });
      return;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Project', style: Theme.of(context).textTheme.titleMedium),

        SizedBox(height: 10),
        MainContainer(
          duration: 400,
          curve: _isOpen ? Curves.easeOutBack : Curves.easeInBack,
          height: _isOpen ? 220 : 65,
          width: double.infinity,
          vPadding: 0,
          hPadding: 12,
          color: Theme.of(context).colorScheme.shadow,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.project == null
                            ? 'None'
                            : widget.project!.title!,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isOpen = !_isOpen;
                          });
                          showListToggle();
                        },
                        icon: Icon(
                          _isOpen
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                _showList
                    ? Column(
                        children: [
                          Divider(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withAlpha(80),
                          ),
                          projects.isEmpty
                              ? Text("You don't have any projects")
                              : ListView.builder(
                                  itemCount: projects.length,
                                  itemBuilder: (context, index) {
                                    final project = projects[index];
                                    return GestureDetector(
                                      onTap: () => setState(() {
                                        widget.onTap(project);
                                      }),
                                      child: MainContainer(
                                        duration: 300,
                                        curve: Curves.easeInOutBack,
                                        height: 50,
                                        width: double.infinity,
                                        vPadding: 4,
                                        hPadding: 4,
                                        color: widget.project == null
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.shadow
                                            : project.id == widget.project!.id
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primary
                                            : Theme.of(
                                                context,
                                              ).colorScheme.shadow,
                                        child: Text(
                                          project.title!,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
