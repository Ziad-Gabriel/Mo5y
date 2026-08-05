import 'package:flutter/material.dart';

class ChooseTasksList extends StatelessWidget {
  const ChooseTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = ['All Tasks', 'Pending', 'Completed', 'Failed'];
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            4,
            (index) => Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: index == 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titles[index],
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: index == 0
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
