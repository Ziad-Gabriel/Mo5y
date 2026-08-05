import 'package:isar/isar.dart';
import 'package:mo5y/core/models/profile_model.dart';
import 'package:mo5y/core/models/transaction_model.dart';

class TransactionService {
  final Isar isar;
  TransactionService(this.isar);

  Future<void> addTransaction({
    required TransactionModel transaction,
    required ProfileModel profile,
  }) async {
    await isar.writeTxn(() async {
      await isar.transactionModels.put(transaction);
      await transaction.profile.save();
    });
  }

  Future<void> updateTransaction({required TransactionModel transaction}) {
    return isar.writeTxn(() => isar.transactionModels.put(transaction));
  }

  Future<void> deleteTransaction({required int id}) async {
    await isar.writeTxn(() => isar.transactionModels.delete(id));
  }

  Stream<List<TransactionModel>> getAllTransactions({required int profileId}) {
    return isar.transactionModels
        .filter()
        .profile((q) => q.idEqualTo(profileId))
        .watch(fireImmediately: true);
  }
}
