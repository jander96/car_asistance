import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewState extends Equatable {
  final bool isLoading;
  final bool isRegistered;
  final FirebaseException? error;

  const RegisterViewState(
      {this.isLoading = false, this.isRegistered = false, this.error});

  RegisterViewState copyWith({bool? isLoading, bool? isRegistered, FirebaseException? error}) =>
      RegisterViewState(
        isLoading: isLoading ?? this.isLoading,
        isRegistered: isRegistered ?? this.isRegistered,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [isRegistered, error, isLoading];
}
