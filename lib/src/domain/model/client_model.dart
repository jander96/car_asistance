class Client{
  final int id;
  final String username;
  final String phoneNumber;
  final List<String> serviceHistory;
  final String licenseExpirationDate;
  final bool isInTrialPeriod;

  Client(
      this.id,
      this.username,
      this.phoneNumber,
      this.serviceHistory,
      this.licenseExpirationDate,
      this.isInTrialPeriod
      );
}