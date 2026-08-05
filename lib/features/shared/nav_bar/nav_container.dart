import 'package:flutter/material.dart';
import 'package:mo5y/features/shared/nav_bar/nav_buttons.dart';

class NavContainer extends StatefulWidget {
  const NavContainer({super.key});

  @override
  State<NavContainer> createState() => _NavContainerState();
}

class _NavContainerState extends State<NavContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            offset: Offset(0, -1.5),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: NavButtons(),
    );
  }
}
