class Affiliate {
  final int id;
  final String name;
  final String? openTime;
  final String? closeTime;
  final bool isFullTimeService;
  final String phoneNumber;
  final double lat;
  final double long;
  final String address;
  final List<String> services;

  Affiliate(
      {required this.id,
      required this.name,
      this.openTime,
      this.closeTime,
      required this.isFullTimeService,
      required this.phoneNumber,
      required this.lat,
      required this.long,
      required this.address,
      required this.services});
}
