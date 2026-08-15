import 'package:flutter/material.dart';
import 'package:mo5y/features/home/widgets/last_transaction_list.dart';
import 'package:mo5y/features/home/widgets/task_statics.dart';
import 'package:mo5y/features/home/widgets/total_balance.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Home', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [TotalBalance(), SizedBox(width: 6), TaskStatics()],
        ),
        SizedBox(height: 16),
        LastTransactionList(),
      ],
    );
  }
}
