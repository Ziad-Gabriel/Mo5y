import 'package:flutter/material.dart';

enum TransactionCategory {
  salary,
  food,
  transport,
  shopping,
  bills,
  health,
  entertainment,
  education,
  other,
}

extension TransactionCategoryX on TransactionCategory {
  String get label {
    switch (this) {
      case TransactionCategory.salary:
        return 'Salary';
      case TransactionCategory.food:
        return 'Food';
      case TransactionCategory.transport:
        return 'Transport';
      case TransactionCategory.shopping:
        return 'Shopping';
      case TransactionCategory.bills:
        return 'Bills';
      case TransactionCategory.health:
        return 'Health';
      case TransactionCategory.entertainment:
        return 'Entertainment';
      case TransactionCategory.education:
        return 'Education';
      case TransactionCategory.other:
        return 'Other';
    }
  }
 
  IconData get icon {
    switch (this) {
      case TransactionCategory.salary:
        return Icons.wallet_rounded;
      case TransactionCategory.food:
        return Icons.restaurant_rounded;
      case TransactionCategory.transport:
        return Icons.directions_car_rounded;
      case TransactionCategory.shopping:
        return Icons.shopping_cart_rounded;
      case TransactionCategory.bills:
        return Icons.receipt_rounded;
      case TransactionCategory.health:
        return Icons.local_hospital;
      case TransactionCategory.entertainment:
        return Icons.movie;
      case TransactionCategory.education:
        return Icons.school;
      case TransactionCategory.other:
        return Icons.category;
    }
  }
}