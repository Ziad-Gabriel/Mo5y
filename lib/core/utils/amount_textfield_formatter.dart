import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class AmountTextFieldFormatter extends TextInputFormatter {
  final int maxDecimalDigits = 2;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll(',', '');
    if (newText.isEmpty) {
      return newValue;
    }

    String text = newValue.text.replaceAll(',', '');

    // prevent more than one decimal point
    if ('.'.allMatches(text).length > 1) {
      return oldValue;
    }

    // split integer & decimal
    List<String> parts = text.split('.');

    // format integer part
    String integerPart = parts[0];
    if (integerPart.isEmpty) integerPart = '0';

    final formatter = NumberFormat("#,###");
    String formattedInteger = formatter.format(int.parse(integerPart));

    // handle decimal part
    String decimalPart = '';
    if (parts.length > 1) {
      decimalPart = parts[1];

      if (decimalPart.length > maxDecimalDigits) {
        decimalPart = decimalPart.substring(0, maxDecimalDigits);
      }

      return TextEditingValue(
        text: '$formattedInteger.$decimalPart',
        selection: TextSelection.collapsed(
          offset: '$formattedInteger.$decimalPart'.length,
        ),
      );
    }

    return TextEditingValue(
      text: formattedInteger,
      selection: TextSelection.collapsed(offset: formattedInteger.length),
    );
  }
}
