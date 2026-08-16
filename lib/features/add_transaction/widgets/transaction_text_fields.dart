import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo5y/core/utils/amount_textfield_formatter.dart';
import 'package:mo5y/features/shared/main_text_field/main_text_field.dart';

class TransactionTextFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  const TransactionTextFields({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = ['Amount', 'Title'];
    final List<TextInputType> keyboardsType = [
      TextInputType.numberWithOptions(decimal: true),
      TextInputType.name,
    ];
    final List<List<TextInputFormatter>?> formatters = [
      [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        AmountTextFieldFormatter(),
      ],
      null,
    ];

    return Column(
      spacing: 16,
      children: List.generate(
        2,
        (index) => MainTextField(
          controller: controllers[index],
          maxLines: 1,
          title: titles[index],
          keyboardType: keyboardsType[index],
          formatter: formatters[index],
        ),
      ),
    );
  }
}
