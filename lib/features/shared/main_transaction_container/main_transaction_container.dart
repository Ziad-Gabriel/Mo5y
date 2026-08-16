import 'package:flutter/material.dart';
import 'package:mo5y/core/models/transaction_category_model.dart';
import 'package:mo5y/core/models/transaction_model.dart';
import 'package:mo5y/core/utils/date_formatter.dart';
import 'package:mo5y/core/utils/money_counter_formatter.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';

class MainTransactionContainer extends StatelessWidget {
  final TransactionModel _transaction;
  const MainTransactionContainer({super.key, required this._transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: double.infinity,
      padding: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.shadow.withAlpha(180),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: _transaction.isAdd
                ? Theme.of(context).colorScheme.primary.withAlpha(120)
                : Theme.of(context).colorScheme.secondary,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(
          color: _transaction.isAdd
              ? Theme.of(context).colorScheme.primary.withAlpha(80)
              : Theme.of(context).colorScheme.secondary.withAlpha(180),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainContainer(
            duration: 0,
            curve: Curves.linear,
            height: 60,
            width: 50,
            vPadding: 2,
            hPadding: 2,
            color: _transaction.isAdd
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
            child: Icon(_transaction.category.icon, size: 26),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _transaction.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                ),
                SizedBox(height: 12),
                Text(
                  customDateFormatter(date: _transaction.date),
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 90,
            decoration: BoxDecoration(
              color: _transaction.isAdd
                  ? Theme.of(context).colorScheme.primary.withAlpha(235)
                  : Theme.of(context).colorScheme.secondary.withAlpha(180),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30),
                right: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                formatNumber(_transaction.amount, false),
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
