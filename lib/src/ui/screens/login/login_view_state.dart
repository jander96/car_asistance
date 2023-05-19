import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewState extends Equatable {
  final bool isLoading;
  final bool isLogin;
  final FirebaseException? error;

  const LoginViewState(
      {this.isLoading = false, this.isLogin = false, this.error});

  LoginViewState copyWith(
          {bool? isLoading, bool? isLogin, FirebaseException? error}) =>
      LoginViewState(
        isLoading: isLoading ?? this.isLoading,
        isLogin: isLogin ?? this.isLogin,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [isLogin, error, isLoading];
}
