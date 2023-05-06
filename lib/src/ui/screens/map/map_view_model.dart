import 'dart:async';

import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:car_assistance/src/ui/screens/map/map_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/affiliate_model.dart';
import '../../../domain/usescases/get_affiliate_by_id.dart';

class MapViewModel extends Cubit<MapViewState> {
  final WatchAllAffiliatesUsesCase _watchAllAffiliatesUsesCase;
  final GetAffiliateByIdUseCase _affiliateByIdUseCase;
  StreamSubscription<List<Affiliate>>? _subscription;
  MapViewModel()
      : _watchAllAffiliatesUsesCase =
            injector.get<WatchAllAffiliatesUsesCase>(),
        _affiliateByIdUseCase = injector.get<GetAffiliateByIdUseCase>(),
        super(const MapViewState()) {
    loadMarkers();
  }

  loadMarkers() async {
    _subscription = _watchAllAffiliatesUsesCase
        .watchAffiliates()
        .distinct()
        .listen((listAffiliate) {
      emit(state.copyWith(isLoading: false, listOfAffiliate: listAffiliate));
    });
  }

  Future<Affiliate> getAffiliateById(String id) async {
    return await _affiliateByIdUseCase.get(id).then((affiliate) {
      emit(state.copyWith(
        affiliateSelected: affiliate,
      ));
      return affiliate;
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
