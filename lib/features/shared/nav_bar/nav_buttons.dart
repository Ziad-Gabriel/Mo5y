import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/main_widgets_index_provider.dart';
import 'package:provider/provider.dart';

class NavButtons extends StatefulWidget {
  const NavButtons({super.key});

  @override
  State<NavButtons> createState() => _NavButtonsState();
}

class _NavButtonsState extends State<NavButtons> {
  final List<IconData> deSelectedIcons = [
    Icons.home_outlined,
    Icons.now_widgets_outlined,
    Icons.view_list_outlined,
    Icons.sticky_note_2_outlined,
    Icons.timer_outlined,
  ];
  final List<IconData> selectedIcons = [
    Icons.home_rounded,
    Icons.now_widgets_rounded,
    Icons.view_list_rounded,
    Icons.sticky_note_2_rounded,
    Icons.timer_rounded,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        5,
        (index) =>
            context.watch<MainWidgetsIndexProvider>().currentIndex == index
            ? Icon(
                selectedIcons[index],
                size: 34,
                color: Theme.of(context).colorScheme.primary,
              )
            : IconButton(
                onPressed: () {
                  context.read<MainWidgetsIndexProvider>().setNewIndex(index);
                },
                icon: Icon(
                  deSelectedIcons[index],
                  size: 26,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
      ),
    );
  }
}
