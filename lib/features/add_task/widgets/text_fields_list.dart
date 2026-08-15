import 'package:flutter/material.dart';
import 'package:mo5y/features/shared/main_text_field/main_text_field.dart';

class TextFieldsList extends StatelessWidget {
  final List<TextEditingController> controllers;
  const TextFieldsList({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = ['Title', 'Description'];
    final List<TextInputType> keyboards = [
      TextInputType.name,
      TextInputType.multiline,
    ];
    final List<int?> maxLines = [1, 5];
    return Column(
      spacing: 25,
      children: List.generate(
        2,
        (index) => MainTextField(
          title: titles[index],
          controller: controllers[index],
          keyboardType: keyboards[index],
          maxLines: maxLines[index],
          formatter: null,
        ),
      ),
    );
  }
}
