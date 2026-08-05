import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) {
  return AppBar(
    title: Text('Ziad Yahia', style: Theme.of(context).textTheme.titleMedium),
    backgroundColor: Theme.of(context).colorScheme.surface,
    scrolledUnderElevation: 0,
    actions: [
      IconButton(
        icon: Icon(
          Icons.calendar_month_outlined,
          size: 26,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        onPressed: () {},
      ),
    ],
  );
}
