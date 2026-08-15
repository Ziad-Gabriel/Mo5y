import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:provider/provider.dart';

AppBar mainAppBar(BuildContext context) {
  final name =context.read<ProfileProvider>().profile!.username;
  return AppBar(
    title: Text(name, style: Theme.of(context).textTheme.titleMedium),
    backgroundColor: Theme.of(context).colorScheme.surface,
    scrolledUnderElevation: 0,
    // actions: [
    //   IconButton(
    //     icon: Icon(
    //       Icons.calendar_month_outlined,
    //       size: 26,
    //       color: Theme.of(context).colorScheme.onSurface,
    //     ),
    //     onPressed: () {},
    //   ),
    // ],
  );
}
