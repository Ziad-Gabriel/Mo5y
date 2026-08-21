import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/transaction_provider.dart';
import 'package:mo5y/features/shared/main_transaction_container/main_transaction_container.dart';
import 'package:provider/provider.dart';

class AllTransactionList extends StatelessWidget {
  const AllTransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfTransaction = context
        .watch<TransactionProvider>()
        .getTransactions;
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: List.generate(listOfTransaction.length, (index) {
          final theTransaction = listOfTransaction[index];
          return MainTransactionContainer(transaction: theTransaction);
        }),
      ),
    );
  }
}
