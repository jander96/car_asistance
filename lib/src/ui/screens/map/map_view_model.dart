import 'dart:async';

import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:car_assistance/src/ui/screens/map/map_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/model/affiliate_model.dart';
import '../../../domain/usescases/get_affiliate_by_id.dart';
import '../../../domain/usescases/get_location_use_case.dart';

class MapViewModel extends Cubit<MapViewState> {
  final WatchAllAffiliatesUsesCase _watchAllAffiliatesUsesCase;
  final GetAffiliateByIdUseCase _affiliateByIdUseCase;
  final GetLocationUseCase _getLocationUseCase;
  bool _isStateAlive = true;
  StreamSubscription<List<Affiliate>>? _subscription;
  MapViewModel()
      : _watchAllAffiliatesUsesCase =
            injector.get<WatchAllAffiliatesUsesCase>(),
        _affiliateByIdUseCase = injector.get<GetAffiliateByIdUseCase>(),
        _getLocationUseCase = injector.get<GetLocationUseCase>(),
        super(const MapViewState()) {
    loadMarkers();
    getCurrentPosition();
  }

  loadMarkers() async {
    _subscription = _watchAllAffiliatesUsesCase
        .watchAffiliates()
        .distinct()
        .listen((listAffiliate) {
      if (_isStateAlive) emit(state.copyWith(isLoading: false, listOfAffiliate: listAffiliate));
    });
  }

  Future<Affiliate> getAffiliateById(String id) async {
    return await _affiliateByIdUseCase.get(id).then((affiliate) {
      if (_isStateAlive) {emit(state.copyWith(
        affiliateSelected: affiliate,
      ));}
      return affiliate;
    });
  }

  Future<void> getCurrentPosition() async {
    _getLocationUseCase.getMyCurrentPosition().then((position) {
      if (_isStateAlive) {
        emit(state.copyWith(
            currentPosition: LatLng(position.latitude, position.longitude),
            isSearching: false));
      }
    }, onError: (e) {
      if (_isStateAlive) emit(state.copyWith(error: e as Exception));
    });
  }

  void setZoom(double value) {
    emit(state.copyWith(zoom: value));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _isStateAlive = false;
    return super.close();
  }
}
