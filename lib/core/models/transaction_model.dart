import 'package:isar/isar.dart';
import 'package:mo5y/core/models/transaction_category_model.dart';

part 'transaction_model.g.dart';

@Collection()
class TransactionModel {
  
  Id id = Isar.autoIncrement;
  
  late double amount;
  late String title;
  late DateTime date;
  late bool isAdd;

  @enumerated
  late TransactionCategory category;

}
