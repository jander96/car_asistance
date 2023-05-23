import '../../domain/date_calculator.dart';
import 'package:intl/intl.dart';

class DartDateCalculator extends DateCaculator {
  @override
  String sumDaysToCurrentDate(int amountOfDays) {
    final currentDate = DateTime.now();
    final dateResult = currentDate.add(Duration(days: amountOfDays));
    final dateStringFormat = DateFormat('dd/MM/yyyy').format(dateResult);
    return dateStringFormat;
  }
}
