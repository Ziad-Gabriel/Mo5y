import 'package:flutter/material.dart';

class TopTaskContainer extends StatelessWidget {
  const TopTaskContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('My Tasks', style: Theme.of(context).textTheme.titleLarge),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '12',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text('Active', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        );
  }
}