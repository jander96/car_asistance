import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/date_calculator.dart';

class GetEndOfFreePeriodUseCase {
  final DateCaculator _dateCaculator;
  GetEndOfFreePeriodUseCase() : _dateCaculator = injector.get<DateCaculator>();

  String getEndOfFreePeriod(int days) {
   return _dateCaculator.sumDaysToCurrentDate(days);
  }
}
