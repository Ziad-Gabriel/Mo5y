import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/notes_provider.dart';
import 'package:mo5y/features/notes/widgets/note_list.dart';
import 'package:provider/provider.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final noteCount = context.watch<NotesProvider>().notes.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Notes', style: Theme.of(context).textTheme.titleLarge),
            Text(
              '$noteCount',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        NoteList(),
      ],
    );
  }
}
