import 'dart:async';

import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/domain/repositories/favorites_repository.dart';
import 'package:car_assistance/src/ui/widgets/favorite_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewModel extends Cubit<FavoriteViewState> {
  final FavoriteRepository _favoriteRepository;
 
  final Affiliate affiliate;
  FavoriteViewModel(this.affiliate)
      : _favoriteRepository = injector.get<FavoriteRepository>(),
        super(const FavoriteViewState()) {
    loadFavorites();
    isFavorite(affiliate.id);
  }

  loadFavorites() {
    _favoriteRepository.getFavorites().then((favorites) {
      emit(state.copyWith(favorites: favorites));
    });
  }

  Future<bool> isFavorite(String id) {
    return _favoriteRepository.isFavorite(id).then((value) {
      emit(state.copyWith(isFavorite: value));
      return value;
    });
  }

  toogleFavorite(String id) {
    _favoriteRepository.toggleFavorite(id).then((value) {
      emit(state.copyWith(isFavorite: value));
    });
  }


}
