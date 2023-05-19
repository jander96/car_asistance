import 'package:equatable/equatable.dart';

class LoadingViewState extends Equatable {
  final bool isLoading;

  const LoadingViewState({this.isLoading = false});
  LoadingViewState copyWith({bool? isLoading}) => LoadingViewState(
      isLoading: isLoading ?? this.isLoading);

  @override
  List<Object?> get props => [isLoading];
}
