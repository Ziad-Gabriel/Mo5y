import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:mo5y/core/utils/money_counter_formatter.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';
import 'package:provider/provider.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final totalBalance = context.watch<ProfileProvider>().getBalance;
    return MainContainer(
      duration: 0,
      curve: Curves.linear,
      height: 150,
      width: 150,
      vPadding: 12,
      hPadding: 12,
      color: Theme.of(context).colorScheme.shadow,
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
            color: Theme.of(context).colorScheme.shadow,
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: Theme.of(context).colorScheme.primary.withAlpha(220),
              size: 32,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                formatNumber(totalBalance, false),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
