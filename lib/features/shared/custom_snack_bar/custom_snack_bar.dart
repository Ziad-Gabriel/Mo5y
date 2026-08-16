import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required BuildContext context,
  required String title,
  required SnackBarAction? action,
}) {
  return SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    clipBehavior: Clip.antiAlias,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 5),
    persist: false,

    backgroundColor: Theme.of(
      context,
    ).colorScheme.primaryContainer.withAlpha(180),

    content: Text(title, style: Theme.of(context).textTheme.bodyMedium),
    action: action,
  );
}
