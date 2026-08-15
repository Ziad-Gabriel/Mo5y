import 'package:isar/isar.dart';
import 'package:mo5y/core/models/transaction_model.dart';

class TransactionService {
  final Isar isar;
  TransactionService(this.isar);

  Future<void> addTransaction({
    required TransactionModel transaction,
  }) async {
    await isar.writeTxn(() async {
      await isar.transactionModels.put(transaction);
    });
  }

  Stream<List<TransactionModel>> getAllTransactions() {
    return isar.transactionModels
        .where().watch(fireImmediately: true);
  }
  
}
