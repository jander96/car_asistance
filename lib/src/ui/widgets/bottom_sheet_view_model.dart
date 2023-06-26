import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/domain/repositories/favorites_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_shett_view_state.dart';

class SheetViewModel extends Cubit<SheetViewState> {
  final FavoriteRepository _favoriteRepository;

  final Affiliate affiliate;
  SheetViewModel(this.affiliate)
      : _favoriteRepository = injector.get<FavoriteRepository>(),
        super(const SheetViewState()) {
    loadFavorites();
    isFavorite(affiliate.id);
  }

  loadFavorites() {
    _favoriteRepository.getFavorites().then((favorites) {
      emit(state.copyWith(favorites: favorites));
    });
  }

  isFavorite(String id) {
    _favoriteRepository.isFavorite(id).then((value) {
      emit(state.copyWith(isFavorite: value));
    });
  }

  toogleFavorite(String id) {
    _favoriteRepository.toggleFavorite(id).then((value) {
      emit(state.copyWith(isFavorite: value));
    });
  }
}
