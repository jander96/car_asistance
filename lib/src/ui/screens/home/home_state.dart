import 'package:equatable/equatable.dart';

import '../../../domain/model/affiliate_model.dart';
import '../../../domain/model/user_model.dart';

class HomeViewState extends Equatable {
  final bool isLoading;
  final List<Affiliate> affiliates;
  final List<Affiliate> filtredAffiliates;
  final List<Affiliate> favorites;
  final String? stateSelected;
  final AppUser? user;

  const HomeViewState( 
      {this.affiliates = const [],
      this.isLoading = true,
      this.filtredAffiliates = const [],
      this.stateSelected,
      this.favorites = const [],
      this.user});

  copyWith(
          {List<Affiliate>? affiliates,
          final List<Affiliate>? filtredAffiliates,
          final List<Affiliate>? favorites,
          String? stateSelected,
          bool? isLoading,
          AppUser? user}) =>
      HomeViewState(
          affiliates: affiliates ?? this.affiliates,
          filtredAffiliates: filtredAffiliates ?? this.filtredAffiliates,
          favorites: favorites ?? this.favorites,
          stateSelected: stateSelected ?? this.stateSelected,
          isLoading: isLoading ?? this.isLoading,
          user: user ?? this.user);

  @override
  List<Object?> get props =>
      [affiliates, isLoading, filtredAffiliates, favorites,stateSelected, user];
}
