import 'package:flutter/material.dart';

Future<DateTime?> customDatePicker(BuildContext context) async {
  return await showDatePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 3650)),
    initialDate: DateTime.now().add(Duration(days: 1)),
  );
}
