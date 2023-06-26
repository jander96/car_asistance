import 'package:car_assistance/dependency_injection.dart';
import 'package:geolocator/geolocator.dart';

import '../repositories/location_repository.dart';

class GetLocationUseCase {
  final LocationRepository _locationRepository;
  GetLocationUseCase()
      : _locationRepository = injector.get<LocationRepository>();

  Future<Position> getMyCurrentPosition() {
    return _locationRepository.getCurrentPosition();
  }
}
