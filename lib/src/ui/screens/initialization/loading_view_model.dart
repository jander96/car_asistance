import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/usescases/get_log_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_view_state.dart';

class LoadingVieModel extends Cubit<LoadingViewState> {
  final GetLogStateUseCase _logStateUseCase;
  LoadingVieModel()
      : _logStateUseCase = injector.get<GetLogStateUseCase>(),
        super(const LoadingViewState());

  Future<bool> verifyUserLog() async {
    emit(state.copyWith(isLoading: true));
    final userState = await _logStateUseCase.verifyUserLog();
    emit(state.copyWith(isLoading: userState));
    return userState;
  }
}
