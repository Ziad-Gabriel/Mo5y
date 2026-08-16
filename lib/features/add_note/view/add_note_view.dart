import 'package:flutter/material.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/providers/notes_provider.dart';
import 'package:mo5y/features/add_note/widgets/note_text_field.dart';
import 'package:mo5y/features/add_note/widgets/title_text_field.dart';
import 'package:mo5y/features/shared/top_bar/app_bar.dart';
import 'package:provider/provider.dart';

class AddNoteView extends StatefulWidget {
  final int? id;
  final String? title;
  final String? note;
  final bool isNew;
  const AddNoteView({
    super.key,
    this.id,
    required this.isNew,
    this.title,
    this.note,
  });

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  late final titleController = TextEditingController(
    text: !widget.isNew ? widget.title : null,
  );
  late final noteController = TextEditingController(
    text: !widget.isNew ? widget.note : null,
  );
  ProjectModel? project;

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        if (widget.isNew) {
        await context.read<NotesProvider>().addNote(
            context: context,
            title: titleController.text,
            content: noteController.text,
            project: project,
        );
        } else {
          await context.read<NotesProvider>().updateNote(
            context: context,
            id: widget.id!,
            title: titleController.text,
            content: noteController.text,
            project: project,
          );
        }
      },
      child: Scaffold(
        appBar: mainAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                TitleTextField(controller: titleController),
                Expanded(child: NoteTextField(controller: noteController)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
