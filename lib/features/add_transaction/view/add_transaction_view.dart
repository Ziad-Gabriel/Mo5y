import 'package:flutter/material.dart';
import 'package:mo5y/core/models/transaction_category_model.dart';
import 'package:mo5y/core/providers/transaction_provider.dart';
import 'package:mo5y/features/add_transaction/widgets/categories_list.dart';
import 'package:mo5y/features/add_transaction/widgets/is_add_toggle.dart';
import 'package:mo5y/features/add_transaction/widgets/transaction_text_fields.dart';
import 'package:mo5y/features/shared/add_button/add_button.dart';
import 'package:mo5y/features/shared/custom_snack_bar/custom_snack_bar.dart';
import 'package:mo5y/features/shared/top_bar/app_bar.dart';
import 'package:provider/provider.dart';

class AddTransactionView extends StatefulWidget {
  const AddTransactionView({super.key});

  @override
  State<AddTransactionView> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionView> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  bool _isAdd = true;
  TransactionCategory _category = TransactionCategory.other;

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    super.dispose();
  }

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
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IsAddToggle(
                        isAdd: _isAdd,
                        onTap: (toggling) {
                          setState(() {
                            _isAdd = toggling;
                          });
                        },
                      ),
                      TransactionTextFields(
                        controllers: [amountController, titleController],
                      ),
                      CategoriesList(
                        category: _category,
                        onTap: (selectedCategory) {
                          setState(() {
                            _category = selectedCategory;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              AddButton(onTap: () async {
                  if (await context.read<TransactionProvider>().addTransaction(
                    amount: amountController.text,
                    title: titleController.text,
                    category: _category,
                    isAdd: _isAdd,
                    context: context
                  )) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        customSnackBar(
                          // ignore: use_build_context_synchronously
                          context: context,
                          title: 'Transaction added successfully',
                          action: null,
                        ),
                      );
                  }
                },),
            ],
          ),
        ),
      ),
    );
  }
}
