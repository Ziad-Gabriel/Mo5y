import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/transaction_provider.dart';
import 'package:mo5y/features/shared/main_transaction_container/main_transaction_container.dart';
import 'package:provider/provider.dart';

class LastTransactionList extends StatelessWidget {
  const LastTransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionList = context
        .watch<TransactionProvider>()
        .getTransactions;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Last Transaction',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(140),
                    ),
                  ),
                  SizedBox(width: 3),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary.withAlpha(140),
                  ),
                ],
              ),
            ),
          ],
        ),
        transactionList.isEmpty
            ? SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    "You don't have any transactions",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              )
            : Column(
                spacing: 12,
                children: List.generate(
                  transactionList.length,
                  (index) => MainTransactionContainer(
                    transaction: transactionList[index],
                  ),
                ),
              ),
      ],
    );
  }
}
