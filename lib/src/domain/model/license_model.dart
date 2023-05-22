class License {
  final String id;
  final String userId;
  final String freePeriodDateEnd;
  final bool isPayDone;

  License(
      {this.id = '',
      required this.userId,
      required this.freePeriodDateEnd,
      required this.isPayDone});
}
