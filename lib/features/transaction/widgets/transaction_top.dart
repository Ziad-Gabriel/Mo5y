import 'package:flutter/material.dart';

class TransactionTop extends StatelessWidget {
  const TransactionTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('All Tasks',style: Theme.of(context).textTheme.titleMedium,);
  }
}