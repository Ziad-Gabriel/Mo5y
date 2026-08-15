import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/transaction_category_model.dart';
import 'package:mo5y/core/models/transaction_model.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:mo5y/core/services/transaction_service.dart';
import 'package:provider/provider.dart';

class TransactionController {
  final Isar isar;
  TransactionController(this.isar);

  Future<bool> addTransaction({
    required String? amount,
    required String? title,
    required bool isAdd,
    required TransactionCategory category,
    required BuildContext context,
  }) async {
    if (amount == null ||
        title == null ||
        title.trim().isEmpty ||
        amount.trim().isEmpty) {
      return false;
    } else {
      double newAmount = double.parse(amount.replaceAll(',', ''));
      if (isAdd) {
        final transaction = TransactionModel()
          ..amount = newAmount
          ..title = title
          ..category = category
          ..isAdd = isAdd
          ..date = DateTime.now();
        TransactionService(isar).addTransaction(transaction: transaction);
        context.read<ProfileProvider>().addToBalance(
          amount: newAmount,
          isAdd: isAdd,
        );
        return true;
      } else {
        if (newAmount > context.read<ProfileProvider>().getBalance) {
          return false;
        }
        final transaction = TransactionModel()
          ..amount = newAmount
          ..title = title
          ..category = category
          ..isAdd = isAdd
          ..date = DateTime.now();
        TransactionService(isar).addTransaction(transaction: transaction);
        context.read<ProfileProvider>().addToBalance(
          amount: newAmount,
          isAdd: isAdd,
        );
        return true;
      }
    }
  }
}
