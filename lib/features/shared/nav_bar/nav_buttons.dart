import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/main_widgets_index_provider.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';
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
      children: List.generate(5, (index) {
        final currentIndex = context
            .watch<MainWidgetsIndexProvider>()
            .getCurrentIndex;
        return GestureDetector(
          onTap: () {
            if (currentIndex == index) return;
            context.read<MainWidgetsIndexProvider>().setNewIndex(index);
          },
          child: MainContainer(
            duration: 300,
            curve: Curves.easeInOutBack,
            height: currentIndex == index ? 50 : 40,
            width: currentIndex == index ? 50 : 40,
            vPadding: 0,
            hPadding: 0,
            color: currentIndex == index
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.shadow,
            child: Icon(
              currentIndex == index
                  ? selectedIcons[index]
                  : deSelectedIcons[index],
              size: currentIndex == index ? 34 : 26,
              color: currentIndex == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        );
      }),
    );
  }
}
