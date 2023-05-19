import 'dart:async';

import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';

import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeViewState> {
  final WatchAllAffiliatesUsesCase _watchAffiliates;
  StreamSubscription<List<Affiliate>>? _subscription;
  HomeCubit()
      : _watchAffiliates = injector.get<WatchAllAffiliatesUsesCase>(),
        super(const HomeViewState()) {
    loadAffiliates();
  }

  loadAffiliates() {
    emit(state.copyWith(isLoading: true));
    _subscription =
        _watchAffiliates.watchAffiliates().distinct().listen((affiliates) {
      emit(state.copyWith(affiliates: affiliates, isLoading: false));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
