import 'dart:async';

import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';

import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usescases/get_user.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeViewState> {
  final WatchAllAffiliatesUsesCase _watchAffiliates;
  final GetUserUseCase _getUserUseCase;
  StreamSubscription<List<Affiliate>>? _subscription;
  HomeCubit()
      : _watchAffiliates = injector.get<WatchAllAffiliatesUsesCase>(),
        _getUserUseCase = injector.get<GetUserUseCase>(),
        super(const HomeViewState()) {
    loadAffiliates();
    loadUser();
  }

  loadAffiliates() {
    _subscription =
        _watchAffiliates.watchAffiliates().distinct().listen((affiliates) {
      emit(state.copyWith(affiliates: affiliates, isLoading: false));
    });
  }

  loadUser() {
    _getUserUseCase.getUser().then((user) {
      emit(state.copyWith(user: user, isLoading: false));
    });
  }

  filter(String value) {
    final filtredAffiliates = state.affiliates
        .where((affiliate) => affiliate.state == value)
        .toList();

    emit(state.copyWith(filtredAffiliates: filtredAffiliates,stateSelected: value));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
