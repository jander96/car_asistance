import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeViewState> {
  final WatchAllAffiliatesUsesCase _watchAffiliates;
  HomeCubit() : 
    _watchAffiliates = injector.get<WatchAllAffiliatesUsesCase>(),super(HomeViewState());

  loadAffiliates() {
    final stream =  _watchAffiliates.watchAffiliates();

    emit(state.copyWith(streamOfAffiliates: stream, isLoading: false));
  }
}
