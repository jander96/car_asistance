

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeViewState>{
  HomeCubit(): super(HomeViewState());

  increaseBy(int value){
    emit(state.copyWith( counter: state.counter + value));
  }
}