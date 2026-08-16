import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  final TextEditingController controller;
  const NoteTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.shadow,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        style: Theme.of(context).textTheme.bodyMedium,
        maxLines: null,
        minLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14),
          hintText: 'Enter Note',
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(180),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
