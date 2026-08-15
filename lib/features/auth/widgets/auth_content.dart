import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:mo5y/core/utils/amount_textfield_formatter.dart';
import 'package:mo5y/features/shared/main_button/main_button.dart';
import 'package:mo5y/features/shared/main_text_field/main_text_field.dart';
import 'package:mo5y/main_view.dart';
import 'package:provider/provider.dart';

class AuthContent extends StatefulWidget {
  const AuthContent({super.key});

  @override
  State<AuthContent> createState() => _AuthContentState();
}

class _AuthContentState extends State<AuthContent> {
  final nameController = TextEditingController();
  final balanceController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        /// username text field
        MainTextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          maxLines: 1,
          title: 'Enter Your Name',
          formatter: null,
        ),

        /// balance text field
        MainTextField(
          controller: balanceController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          maxLines: 1,
          title: 'Enter Your Balance',
          formatter: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            AmountTextFieldFormatter(),
          ],
        ),
        MainButton(
          title: 'Start',
          color: Theme.of(context).colorScheme.primary,
          onTap: () async{
            await context.read<ProfileProvider>().login(
              amount: double.parse(balanceController.text),
              username: nameController.text,
            );
            if (!context.mounted) return;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainView()),
            );
          },
        ),
      ],
    );
  }
}
