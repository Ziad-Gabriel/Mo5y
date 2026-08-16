import 'package:flutter/material.dart';
import 'package:mo5y/features/shared/main_button/main_button.dart';

class AddButton extends StatelessWidget {
  final Function onTap;
  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(30)),
      child: Container(
        height: 80,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 130),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.shadow,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 10,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withAlpha(80),
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: MainButton(
          title: 'Add',
          color: Theme.of(context).colorScheme.primary,
          onTap: () => onTap(),
        ),
      ),
    );
  }
}
