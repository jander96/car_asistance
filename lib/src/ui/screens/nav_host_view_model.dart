import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/usescases/_dowload_data_server.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainViewModel extends Cubit<MainViewState> {
  final DowloadDataServerUseCase _downloader;
  MainViewModel()
      : _downloader = injector.get<DowloadDataServerUseCase>(),
        super(MainViewState()) {
    dowloadDataFromServer();
  }

  void dowloadDataFromServer() {
    _downloader.watchAffiliates();
    emit(state);
  }
}
