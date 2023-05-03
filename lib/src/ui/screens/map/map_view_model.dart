import 'dart:async';

import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:car_assistance/src/ui/screens/map/map_view_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../domain/model/affiliate_model.dart';

class MapViewModel extends Cubit<MapViewState> {
  final WatchAllAffiliatesUsesCase _watchAllAffiliatesUsesCase;
  StreamSubscription<List<Affiliate>>? _subscription;
  MapViewModel()
      : _watchAllAffiliatesUsesCase =
            injector.get<WatchAllAffiliatesUsesCase>(),
        super(const MapViewState()) {
    loadMarkers();
  }

  loadMarkers() async {
    _subscription = _watchAllAffiliatesUsesCase
        .watchAffiliates()
        .distinct()
        .listen((listAffiliate) {
      final markers = listAffiliate
          .map((affiliate) => Marker(
              point: LatLng(affiliate.lat, affiliate.long),
              builder: (context) => const Icon(size: 34.0, Icons.pin_drop)))
          .toList();

      emit(const MapViewState().copyWith(isLoading: false, markers: markers));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
