import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/usescases/login_user.dart';
import 'package:car_assistance/src/ui/screens/login/login_view_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginViewModel extends Cubit<LoginViewState> {
  final LoginUserUseCase _loginUserUseCase;
  LoginViewModel()
      : _loginUserUseCase = injector.get<LoginUserUseCase>(),
        super(const LoginViewState());

  Future<bool> login({String email = '', String password = ''}) {
    emit(state.copyWith(isLoading: true));
    return _loginUserUseCase
        .login(email: email, password: password)
        .then((user) {
      if (user != null) {
        emit(state.copyWith(isLoading: false, isLogin: true));
        return state.isLogin;
      } else {
        emit(state.copyWith(isLoading: false, isLogin: false));
        return state.isLogin;
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(error: error as FirebaseException, isLoading: false));
      return state.isLogin;
    });
  }
}
