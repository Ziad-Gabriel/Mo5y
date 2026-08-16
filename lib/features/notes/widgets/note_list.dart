import 'package:flutter/material.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/providers/notes_provider.dart';
import 'package:mo5y/features/add_note/view/add_note_view.dart';
import 'package:mo5y/features/notes/widgets/note_container.dart';
import 'package:provider/provider.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    final noteList = context.watch<NotesProvider>().notes;
    final rowCount = (noteList.length / 2).ceil();

    return Column(
      children: List.generate(rowCount, (rowIndex) {
        final leftNote = noteList[rowIndex * 2];
        final hasRightNote = (rowIndex * 2 + 1) < noteList.length;
        final rightNote = hasRightNote ? noteList[rowIndex * 2 + 1] : null;

        // ignore: use_null_aware_elements
        final rowNotes = <NoteModel>[leftNote, if (rightNote != null) rightNote];

        return Row(
          children: rowNotes.map((note) {
            return Expanded(
              child: GestureDetector(
                onLongPress:() {
                  context.read<NotesProvider>().deleteNote(id: note.id);
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNoteView(
                        isNew: false,
                        title: note.title,
                        note: note.content,
                        id: note.id,
                      ),
                    ),
                  );
                },
                child: NoteContainer(note: note),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}