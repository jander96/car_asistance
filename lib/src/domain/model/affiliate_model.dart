class Affiliate {
  final String id;
  final String name;
  final String? openTime;
  final String? closeTime;
  final bool isFullTimeService;
  final String phoneNumber;
  final double rating;
  final double lat;
  final double long;
  final String address;
  final List<String> services;
  final String state;

  Affiliate( 
      {required this.id,
      required this.name,
      this.openTime,
      this.closeTime,
      required this.isFullTimeService,
      required this.phoneNumber,
      required this.rating,
      required this.lat,
      required this.long,
      required this.address,
      required this.services,
      required this.state});

  Affiliate copyWith({
    String? id,
    String? name,
    String? openTime,
    String? closeTime,
    bool? isFullTimeService,
    String? phoneNumber,
    double? rating,
    double? lat,
    double? long,
    String? address,
    List<String>? services,
    String? state,
  }) {
    return Affiliate(
      id: id ?? this.id,
      name: name ?? this.name,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
      isFullTimeService: isFullTimeService ?? this.isFullTimeService,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rating: rating ?? this.rating,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      address: address ?? this.address,
      services: services ?? this.services,
      state: state ?? this.state,
    );
  }
}
