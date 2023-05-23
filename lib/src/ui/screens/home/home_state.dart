import 'package:equatable/equatable.dart';

import '../../../domain/model/affiliate_model.dart';
import '../../../domain/model/user_model.dart';

class HomeViewState extends Equatable {
  final bool isLoading;
  final List<Affiliate> affiliates;
  final AppUser? user;

  const HomeViewState({this.affiliates = const [], this.isLoading = false, this.user});

  copyWith({
    List<Affiliate>? affiliates,
    bool? isLoading,
    AppUser? user
  }) =>
      HomeViewState(
          affiliates: affiliates ?? this.affiliates,
          isLoading: isLoading ?? this.isLoading,
          user: user ?? this.user
          );
          

  @override
  List<Object?> get props => [affiliates, isLoading,user];
}
