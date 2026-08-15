import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/controllers/transaction_controller.dart';
import 'package:mo5y/core/models/transaction_category_model.dart';
import 'package:mo5y/core/models/transaction_model.dart';
import 'package:mo5y/core/services/transaction_service.dart';

class TransactionProvider extends ChangeNotifier {
  final Isar isar;
  TransactionProvider(this.isar);

  List<TransactionModel> _transaction = [];
  List<TransactionModel> get getTransactions => _transaction;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  StreamSubscription<List<TransactionModel>>? _subscription;

  void listenToTransactions() {
    _subscription?.cancel();
    _isLoading = true;
    notifyListeners();

    _subscription = TransactionService(isar).getAllTransactions().listen((
      updatedTransactions,
    ) {
      _transaction = updatedTransactions..sort((a, b) => a.date.compareTo(b.date));
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<bool> addTransaction({required String? amount,required String? title,required bool isAdd, required TransactionCategory category,required BuildContext context})async{
    return await TransactionController(isar).addTransaction(amount: amount, title: title, isAdd: isAdd, category: category, context: context);
  }
}
