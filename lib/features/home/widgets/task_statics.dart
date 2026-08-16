import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:mo5y/core/utils/money_counter_formatter.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';
import 'package:provider/provider.dart';

class TaskStatics extends StatelessWidget {
  const TaskStatics({super.key});

  @override
  Widget build(BuildContext context) {
    final weekStats = context.watch<ProfileProvider>().getStats;
    final double ratio = weekStats[0] == 0
        ? 0
        : weekStats[1]! / weekStats[0]!;
    return MainContainer(
      duration: 0,
      curve: Curves.linear,
      height: 150,
      width: 150,
      vPadding: 12,
      hPadding: 12,
      color: ratio < 0.5
          ? Theme.of(context).colorScheme.secondary
          : ratio < 0.85
          ? Theme.of(context).colorScheme.shadow
          : Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainContainer(
            duration: 0,
            curve: Curves.linear,
            height: 55,
            width: 55,
            vPadding: 4,
            hPadding: 4,
            color: ratio < 0.5
                ? Theme.of(context).colorScheme.secondary
                : ratio < 0.85
                ? Theme.of(context).colorScheme.shadow
                : Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.task_alt_rounded,
              color: ratio < 0.5
                  ? Theme.of(context).colorScheme.secondary.withRed(150)
                  : ratio < 0.85
                  ? Theme.of(context).colorScheme.onSurface.withAlpha(80)
                  : Theme.of(context).colorScheme.primary,
              size: 32,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                weekStats[0] == 0
                    ? '%0'
                    : '%${formatNumber(ratio * 100, true)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
