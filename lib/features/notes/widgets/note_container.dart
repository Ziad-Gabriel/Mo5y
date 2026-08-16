import 'package:flutter/material.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';

class NoteContainer extends StatelessWidget {
  final NoteModel note;
  const NoteContainer({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    Widget titleWidget() {
      if (note.title.isNotEmpty) {
        return Column(
          children: [
            Text(note.title, style: Theme.of(context).textTheme.titleSmall),
            Divider(color: Theme.of(context).colorScheme.onPrimary),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: MainContainer(
        duration: 0,
        curve: Curves.linear,
        height: 220,
        width: 150,
        vPadding: 4,
        hPadding: 4,
        color: Theme.of(context).colorScheme.shadow,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                titleWidget(),
                Expanded(
                  child: Text(
                    note.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
