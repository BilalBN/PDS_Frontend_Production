import 'package:intl/intl.dart';

String formatDate(
  String dateTime, {
  String format = 'MMM-dd-yyyy',
}) {
  final formattedDate = DateFormat(format).format(DateTime.parse(dateTime));
  return formattedDate;
}
