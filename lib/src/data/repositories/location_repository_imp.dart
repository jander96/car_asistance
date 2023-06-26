import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/services/geolocator_service.dart';
import 'package:car_assistance/src/domain/repositories/location_repository.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationService _locationService;
  LocationRepositoryImpl() : _locationService = injector.get<LocationService>();
  @override
  Future<Position> getCurrentPosition() {
    return _locationService.determinePosition();
  }
}
