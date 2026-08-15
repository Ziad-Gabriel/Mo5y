import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLines;
  final String title;
  final List<TextInputFormatter>? formatter;
  const MainTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.maxLines,
    required this.title,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: formatter,
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: maxLines,
      minLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14),
        labelText: title,
        labelStyle: Theme.of(context).textTheme.titleSmall,
        filled: true,
        fillColor: Theme.of(context).colorScheme.shadow,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary.withAlpha(180),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary.withAlpha(40),
          ),
        ),
      ),
    );
  }
}
