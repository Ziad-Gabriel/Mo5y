import 'package:flutter/material.dart';
import 'package:mo5y/features/shared/top_bar/app_bar.dart';
import 'package:mo5y/features/transaction/widgets/all_transaction_list.dart';
import 'package:mo5y/features/transaction/widgets/transaction_top.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TransactionTop(),
              AllTransactionList()
            ]),
        ),
      ),
    );
  }
}
