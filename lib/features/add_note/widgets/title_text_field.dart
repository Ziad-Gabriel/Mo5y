import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController controller;
  const TitleTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      style: Theme.of(context).textTheme.titleMedium,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14),
        hintText: 'Enter Title',
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withAlpha(180),
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
