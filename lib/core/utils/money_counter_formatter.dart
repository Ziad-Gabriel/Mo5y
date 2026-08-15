import 'package:intl/intl.dart';

String formatNumber(double number,bool isStat) {
  final NumberFormat formatter;
  if(isStat){
    formatter = NumberFormat('#,##0.0');
    return formatter.format(number);
  }
  if (number % 1 == 0) {
    formatter = NumberFormat('#,##0');
    return formatter.format(number);
  } else {
    formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }
}
