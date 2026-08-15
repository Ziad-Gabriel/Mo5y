import 'package:intl/intl.dart';

String customDateFormatter({required DateTime date}) {
  return DateFormat.yMMMd().format(date);
}
