

import 'package:car_assistance/src/ui/screens/login/register_view_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection.dart';
import '../../../domain/usescases/create_account.dart';

class RegisterViewModel extends Cubit<RegisterViewState> {
  final CreateAccountUseCase _createAccount;
  RegisterViewModel()
      : _createAccount = injector.get<CreateAccountUseCase>(),
        super(const RegisterViewState());

  Future<bool> createAccount({String email = '', String password = ''}) {
    emit(state.copyWith(isLoading: true));
    return _createAccount
        .createAccount(email: email, password: password)
        .then((user) {
      if (user != null) {
        emit(state.copyWith(isLoading: false, isRegistered: true));
        return state.isRegistered;
      } else {
        emit(state.copyWith(isLoading: false, isRegistered: false));
         return state.isRegistered;
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(error: error as FirebaseException,isLoading: false));
       return state.isRegistered;
    });
  }
}
